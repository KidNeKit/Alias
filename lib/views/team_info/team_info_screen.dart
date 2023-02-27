import 'dart:developer';

import '../global_components/body_wrapper.dart';
import '../global_components/team_card.dart';
import 'package:flutter/material.dart';

class TeamInfoScreen extends StatefulWidget {
  static const String routeName = '/team_stats';
  final bool _isInGameCreating;
  final bool _isEditing;
  const TeamInfoScreen(
      {bool isInGameCreating = false, bool isEditing = false, super.key})
      : _isEditing = isEditing,
        _isInGameCreating = isInGameCreating;

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
    _isEditing = widget._isInGameCreating ? true : widget._isEditing;
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
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>? ??
            {};
    String index = args['index'] ?? '';
    return BodyWrapper(
      floatingIcon: Icon(widget._isInGameCreating
          ? Icons.check
          : _isEditing
              ? Icons.save
              : Icons.edit),
      floatingFunc: () {
        if (widget._isInGameCreating) {
          Navigator.of(context).pop();
        } else {
          _opacityController.reverse().then((value) {
            _isEditing = !_isEditing;
            Future.delayed(const Duration(milliseconds: 300),
                () => _opacityController.forward());
          });
        }
      },
      body: Hero(
        tag: 'team_$index',
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
