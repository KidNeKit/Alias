import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../view_models/game_view_model.dart';
import '../global_components/body_wrapper_animated.dart';
import 'components/current_turn.dart';
import 'components/play_button.dart';
import 'components/points_to_win.dart';
import 'components/team_points.dart';

class LobbyScreen extends StatelessWidget {
  static const String routeName = '/lobby_screen';
  const LobbyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BodyWrapperAnimated(
      body: Column(
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
    );
  }
}
