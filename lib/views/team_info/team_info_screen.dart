import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../view_models/teams_view_model.dart';
import '../global_components/body_wrapper.dart';
import '../global_components/team_card.dart';
import 'components/edit_part.dart';
import 'components/info_part.dart';

class TeamInfoScreen extends StatefulWidget {
  static const String routeName = '/team_stats';
  static const Duration editSwapDuration = Duration(milliseconds: 250);

  final String? _teamId;
  final String _teamName;
  final bool _isEditing;

  const TeamInfoScreen(
      {bool isEditing = false, String? teamId, String teamName = '', super.key})
      : _isEditing = isEditing,
        _teamId = teamId,
        _teamName = teamName;

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
    Provider.of<TeamsViewModel>(context, listen: false)
        .setEditableTeam(widget._teamId);
    _isEditing = widget._teamId == null ? true : widget._isEditing;
    _opacityController = AnimationController(
      vsync: this,
      duration: TeamInfoScreen.editSwapDuration,
    );
    _opacityController.addListener(() {
      setState(() {});
    });
    Future.delayed(
      TeamInfoScreen.editSwapDuration,
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
            _opacityController.reverse().then((value) async {
              if (_isEditing) {
                await Provider.of<TeamsViewModel>(context, listen: false)
                    .updateTeam();
                log('updated');
              }
              _isEditing = !_isEditing;
              Future.delayed(TeamInfoScreen.editSwapDuration,
                  () => _opacityController.forward());
            });
          }
        },
        body: Hero(
          tag: 'team_${widget._teamId}',
          child: Column(
            children: [
              Consumer<TeamsViewModel>(
                  builder: (context, value, child) =>
                      TeamCard(teamName: value.team?.name ?? '')),
              Visibility(
                visible: _isInitialized,
                child: Opacity(
                  opacity: _opacityController.value,
                  child: _isEditing ? const EditPart() : const InfoPart(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _opacityController.dispose();
    super.dispose();
  }
}
