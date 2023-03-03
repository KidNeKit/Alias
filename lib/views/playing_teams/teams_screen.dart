import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../view_models/game_settings_view_model.dart';
import '../global_components/body_wrapper_animated.dart';
import '../team_info/team_info_screen.dart';
import 'bottom_buttons.dart';
import 'components/teams_list.dart';

class PlayingTeamsScreen extends StatelessWidget {
  static const String routeName = '/playing_teams_screen';
  const PlayingTeamsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BodyWrapperAnimated(
      floatingIcon: const Icon(Icons.add),
      floatingFunc: () =>
          Navigator.of(context).pushNamed(TeamInfoScreen.routeName),
      body: Column(
        children: [
          Text(
            'Choose teams',
            style: Theme.of(context).textTheme.labelMedium,
          ),
          const SizedBox(height: 10.0),
          Align(
            alignment: Alignment.centerRight,
            child: Consumer<GameSettingsViewModel>(
                builder: (context, value, child) {
              return Text(
                '${value.teamQuantity} / 4',
                style: Theme.of(context).textTheme.labelMedium,
              );
            }),
          ),
          const SizedBox(height: 10.0),
          const Expanded(
            child: TeamsList(),
          ),
          const SizedBox(height: 10.0),
          const BottomButtons(),
        ],
      ),
    );
  }
}
