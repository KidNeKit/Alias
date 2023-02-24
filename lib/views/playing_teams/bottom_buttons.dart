import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../view_models/game_view_model.dart';
import '../global_components/custom_button.dart';
import '../game_settings/game_settings_screen.dart';

class BottomButtons extends StatelessWidget {
  const BottomButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Consumer<GameViewModel>(
          builder: (context, value, child) => CustomButton(
            text: 'Back',
            onPressedFunc: () {
              value.resetData();
              Navigator.of(context).pop();
            },
          ),
        ),
        const SizedBox(width: 15.0),
        CustomButton(
          text: 'Continue',
          onPressedFunc: () {
            bool isValid = Provider.of<GameViewModel>(context, listen: false)
                .isTeamsValid();
            if (!isValid) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  duration: Duration(seconds: 1),
                  content: Text('Please fill all teams name'),
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
