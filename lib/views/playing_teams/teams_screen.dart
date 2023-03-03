import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../view_models/game_settings_view_model.dart';
import '../global_components/body_wrapper_animated.dart';
import '../global_components/text/custom_titles.dart';
import '../team_info/team_info_screen.dart';
import 'components/bottom_buttons.dart';
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
          const CustomMediumTitle(text: 'Choose teams'),
          const SizedBox(height: 10.0),
          Align(
            alignment: Alignment.centerRight,
            child: Consumer<GameSettingsViewModel>(
                builder: (context, value, child) {
              return CustomMediumTitle(text: '${value.teamQuantity} / 4');
            }),
          ),
          const SizedBox(height: 10.0),
          const TeamsList(),
          const SizedBox(height: 10.0),
          const BottomButtons(),
        ],
      ),
    );
  }
}
