import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../view_models/game_settings_view_model.dart';
import '../../global_components/custom_button.dart';
import '../../global_components/error_snackbar_body.dart';
import '../../lobby/lobby_screen.dart';

class BottomButtons extends StatelessWidget {
  const BottomButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<GameSettingsViewModel>(
      builder: (ctx, value, child) => Row(
        children: [
          CustomButton(
            text: 'Back',
            onPressedFunc: () {
              value.wipePack();
              Navigator.of(context).pop();
            },
          ),
          const SizedBox(width: 15.0),
          CustomButton(
            text: 'Continue',
            onPressedFunc: () {
              if (!value.isPackValid()) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    behavior: SnackBarBehavior.floating,
                    duration: Duration(milliseconds: 3000),
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    content: ErrorSnackbarBody(
                        errorText: 'Please select all fields'),
                  ),
                );
              } else {
                Navigator.of(context).pushNamed(LobbyScreen.routeName);
              }
            },
          ),
        ],
      ),
    );
  }
}
