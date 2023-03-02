import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../view_models/game_settings_view_model.dart';
import '../game_settings/game_settings_screen.dart';
import '../global_components/custom_button.dart';

class BottomButtons extends StatelessWidget {
  const BottomButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Consumer<GameSettingsViewModel>(
          builder: (context, value, child) => CustomButton(
            text: 'Back',
            onPressedFunc: () {
              value.wipeTeams();
              Navigator.of(context).pop();
            },
          ),
        ),
        const SizedBox(width: 15.0),
        CustomButton(
          text: 'Continue',
          onPressedFunc: () {
            bool isValid =
                Provider.of<GameSettingsViewModel>(context, listen: false)
                    .isTeamsValid();
            if (!isValid) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  duration: Duration(seconds: 1),
                  content: Text('Please select 2-4 teams'),
                ),
              );
            } else {
              Navigator.of(context).pushNamed(GameSettingsScreen.routeName);
            }
          },
        ),
      ],
    );
  }
}
