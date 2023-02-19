import 'package:flutter/material.dart';

import '../../resources/colors.dart';
import 'bottom_buttons.dart';
import 'complexity_selector/complexity_selector.dart';
import 'pack_picker/pack_picker.dart';
import 'win_points_selector/win_points_selector.dart';

class GameSettingsScreen extends StatelessWidget {
  static const String routeName = '/game_settings_screen';
  const GameSettingsScreen({super.key});

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
              Text(
                'Pick your pack',
                style: Theme.of(context).textTheme.labelMedium,
              ),
              const SizedBox(height: 10.0),
              const PackPicker(),
              const SizedBox(height: 10.0),
              Text(
                'Choose complexity level',
                style: Theme.of(context).textTheme.labelMedium,
              ),
              const SizedBox(height: 10.0),
              const ComplexitySelector(),
              const SizedBox(height: 5.0),
              Text(
                'Choose points for win',
                style: Theme.of(context).textTheme.labelMedium,
              ),
              const SizedBox(height: 10.0),
              const WinPointsSelector(),
              const Spacer(),
              const BottomButtons(),
            ],
          ),
        ),
      ),
    );
  }
}
