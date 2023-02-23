import 'package:alias/view_models/game_view_model.dart';
import 'package:alias/views/lobby/play_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../resources/colors.dart';
import 'current_turn.dart';
import 'points_to_win.dart';
import 'team_points.dart';

class LobbyScreen extends StatelessWidget {
  static const String routeName = '/lobby_screen';
  const LobbyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkColor,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              const PointsToWin(),
              const SizedBox(height: 10.0),
              const TeamPoints(),
              const SizedBox(height: 10.0),
              const CurrentTurn(),
              const Spacer(),
              Consumer<GameViewModel>(
                builder: (context, value, child) =>
                    value.isGameEnded ? Container() : const PlayButton(),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
