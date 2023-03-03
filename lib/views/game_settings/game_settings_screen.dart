import 'package:flutter/material.dart';

import '../global_components/body_wrapper_animated.dart';
import '../global_components/text/custom_titles.dart';
import 'components/bottom_buttons.dart';
import 'components/complexity_selector.dart';
import 'components/pack_picker.dart';
import 'components/win_points_selector.dart';

class GameSettingsScreen extends StatelessWidget {
  static const String routeName = '/game_settings_screen';
  const GameSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BodyWrapperAnimated(
      body: Column(
        children: const [
          CustomMediumTitle(text: 'Pick your pack'),
          SizedBox(height: 10.0),
          PackPicker(),
          SizedBox(height: 10.0),
          CustomMediumTitle(text: 'Choose complexity level'),
          SizedBox(height: 10.0),
          ComplexitySelector(),
          SizedBox(height: 5.0),
          CustomMediumTitle(text: 'Choose points for win'),
          SizedBox(height: 10.0),
          WinPointsSelector(),
          SizedBox(height: 10.0),
          BottomButtons(),
        ],
      ),
    );
  }
}
