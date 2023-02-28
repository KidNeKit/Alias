import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../view_models/teams_view_model.dart';
import '../global_components/body_wrapper.dart';
import '../global_components/team_card.dart';

class TeamInfoScreen extends StatefulWidget {
  static const String routeName = '/team_stats';

  final String? _teamId;
  final bool _isEditing;

  const TeamInfoScreen({bool isEditing = false, String? teamId, super.key})
      : _isEditing = isEditing,
        _teamId = teamId;

  @override
  State<TeamInfoScreen> createState() => _TeamInfoScreenState();
}

class _TeamInfoScreenState extends State<TeamInfoScreen>
    with SingleTickerProviderStateMixin {
  late bool _isEditing;
  late AnimationController _opacityController;

  bool _isInitialized = false;

  @override
  void initState() {
    Provider.of<TeamsViewModel>(context, listen: false).setEditableTeam();
    _isEditing = widget._teamId == null ? true : widget._isEditing;
    _opacityController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _opacityController.addListener(() {
      setState(() {});
    });
    Future.delayed(
      const Duration(milliseconds: 200),
      () {
        _isInitialized = true;
        _opacityController.forward();
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Provider.of<TeamsViewModel>(context, listen: false).wipeTeamChanges();
        return true;
      },
      child: BodyWrapper(
        floatingIcon: Icon(widget._teamId == null
            ? Icons.check
            : _isEditing
                ? Icons.save
                : Icons.edit),
        floatingFunc: () {
          if (widget._teamId == null) {
            Provider.of<TeamsViewModel>(context, listen: false)
                .createTeam()
                .then((value) {
              log('Team $value created');
              Provider.of<TeamsViewModel>(context, listen: false)
                  .wipeTeamChanges();
              Navigator.of(context).pop();
            });
          } else {
            _opacityController.reverse().then((value) {
              _isEditing = !_isEditing;
              Future.delayed(const Duration(milliseconds: 300),
                  () => _opacityController.forward());
            });
          }
        },
        body: Hero(
          tag: 'team_${widget._teamId}',
          child: Column(
            children: [
              const TeamCard(),
              Visibility(
                visible: _isInitialized,
                child: Opacity(
                  opacity: _opacityController.value,
                  child: _isEditing ? _buildEditBody() : _buildInfoBody(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoBody() {
    return Column(
      children: [
        Text(
          'Info',
          style: Theme.of(context).textTheme.labelMedium,
        ),
        const SizedBox(height: 10.0),
        Text(
          'Info',
          style: Theme.of(context).textTheme.labelMedium,
        ),
        const SizedBox(height: 10.0),
        Text(
          'Info',
          style: Theme.of(context).textTheme.labelMedium,
        ),
        const SizedBox(height: 10.0),
        Text(
          'Info',
          style: Theme.of(context).textTheme.labelMedium,
        ),
        const SizedBox(height: 10.0),
        Text(
          'Info',
          style: Theme.of(context).textTheme.labelMedium,
        ),
        const SizedBox(height: 10.0),
      ],
    );
  }

  Widget _buildEditBody() {
    return Column(
      children: [
        TextField(
          onChanged: (value) =>
              Provider.of<TeamsViewModel>(context, listen: false)
                  .changeTeamName(value),
        ),
        Text(
          'Edit',
          style: Theme.of(context).textTheme.labelMedium,
        ),
        const SizedBox(height: 10.0),
        Text(
          'Edit',
          style: Theme.of(context).textTheme.labelMedium,
        ),
        const SizedBox(height: 10.0),
        Text(
          'Edit',
          style: Theme.of(context).textTheme.labelMedium,
        ),
        const SizedBox(height: 10.0),
        Text(
          'Edit',
          style: Theme.of(context).textTheme.labelMedium,
        ),
        const SizedBox(height: 10.0),
        Text(
          'Edit',
          style: Theme.of(context).textTheme.labelMedium,
        ),
        const SizedBox(height: 10.0),
      ],
    );
  }

  @override
  void dispose() {
    _opacityController.dispose();
    super.dispose();
  }
}
