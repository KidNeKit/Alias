import 'package:alias/view_models/team_view_model.dart';
import 'package:alias/views/game_settings/game_settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/custom_button.dart';

class BottomButtons extends StatelessWidget {
  const BottomButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Consumer<TeamViewModel>(
          builder: (context, value, child) => CustomButton(
            text: 'Back',
            onPressedFunc: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        const SizedBox(width: 15.0),
        CustomButton(
          text: 'Continue',
          onPressedFunc: () {},
        ),
      ],
    );
  }
}
