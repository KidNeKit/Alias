import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../models/team_playing.dart';
import '../../../view_models/game_view_model.dart';
import '../../global_components/text/custom_titles.dart';

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
            isPlaying:
                value.teams[index] == value.playingTeam && !value.isGameEnded,
          ),
        ),
      ),
    );
  }
}

class TeamPointItem extends StatelessWidget {
  final TeamPlaying _team;
  final bool _isPlaying;
  const TeamPointItem(
      {required TeamPlaying team, required bool isPlaying, super.key})
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
        color: Theme.of(context).primaryColor,
        border: _isPlaying
            ? Border.all(
                color: Theme.of(context).cardColor,
                width: 3.0,
              )
            : null,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: CustomSmallTitle(text: _team.teamName),
          ),
          CustomSmallTitle(text: _team.points.toString()),
        ],
      ),
    );
  }
}
