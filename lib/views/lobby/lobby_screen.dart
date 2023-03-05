import 'package:alias/views/global_components/text/custom_titles.dart';
import 'package:alias/views/lobby/components/win_container.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../view_models/game_view_model.dart';
import '../../view_models/turn_view_model.dart';
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
    return WillPopScope(
      onWillPop: () async {
        Provider.of<GameViewModel>(context, listen: false).setDefaultValues();
        Provider.of<TurnViewModel>(context, listen: false).refreshState();
        return true;
      },
      child: BodyWrapperAnimated(
        body: Column(
          children: [
            const PointsToWin(),
            const SizedBox(height: 10.0),
            const TeamPoints(),
            const SizedBox(height: 10.0),
            const CurrentTurn(),
            Expanded(
              child: Consumer<GameViewModel>(
                builder: (context, value, child) => value.isGameEnded
                    ? const WinContainer()
                    : const PlayButton(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
