import 'package:alias/resources/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/team.dart';
import '../../view_models/game_view_model.dart';

class TeamPoints extends StatelessWidget {
  const TeamPoints({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<GameViewModel>(
      builder: (context, value, child) => Column(
        children: List.generate(
          value.teamQuantity,
          (index) => TeamPointItem(
            team: value.teams[index],
            isPlaying: value.teams[index] == value.playingTeam,
          ),
        ),
      ),
    );
  }
}

class TeamPointItem extends StatelessWidget {
  final Team _team;
  final bool _isPlaying;
  const TeamPointItem({required Team team, required bool isPlaying, super.key})
      : _team = team,
        _isPlaying = isPlaying;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      margin: const EdgeInsets.only(bottom: 5.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: primaryColor,
        border: _isPlaying ? Border.all(color: Colors.amber, width: 2.0) : null,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Text(
              _team.name,
              style: Theme.of(context).textTheme.labelSmall,
            ),
          ),
          Text(
            _team.points.toString(),
            style: Theme.of(context).textTheme.labelSmall,
          ),
        ],
      ),
    );
  }
}
