import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../view_models/game_view_model.dart';
import '../../view_models/pack_view_model.dart';
import '../components/custom_button.dart';
import '../lobby/lobby_screen.dart';

class BottomButtons extends StatelessWidget {
  const BottomButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<GameViewModel>(
      builder: (context, value, child) => Row(
        children: [
          CustomButton(
            text: 'Back',
            onPressedFunc: () {
              value.clearGameData();
              Provider.of<PackViewModel>(context, listen: false)
                  .clearSelectedPack();
              Navigator.of(context).pop();
            },
          ),
          const SizedBox(width: 15.0),
          CustomButton(
            text: 'Continue',
            onPressedFunc: () {
              if (!value.isDataValid()) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    duration: Duration(seconds: 1),
                    content: Text('Please select all fields'),
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
