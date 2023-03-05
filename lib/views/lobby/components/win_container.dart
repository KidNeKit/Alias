import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../view_models/game_settings_view_model.dart';
import '../../../view_models/game_view_model.dart';
import '../../../view_models/turn_view_model.dart';
import '../../global_components/text/custom_titles.dart';
import '../../home/home_screen.dart';

class WinContainer extends StatelessWidget {
  const WinContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<GameViewModel>(
      builder: (context, value, child) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CustomMediumTitle(text: 'We have a winner!'),
          const SizedBox(height: 10.0),
          CustomMediumTitle(
              text: 'Congratulations, \'${value.winner.teamName}\''),
          const SizedBox(height: 10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ActionButton(
                iconData: Icons.close,
                onPressedFunc: () {
                  Provider.of<GameViewModel>(context, listen: false)
                      .setDefaultValues();
                  Provider.of<TurnViewModel>(context, listen: false)
                      .refreshState();
                  Provider.of<GameSettingsViewModel>(context, listen: false)
                      .wipeGameSettings();
                  Navigator.of(context)
                      .pushReplacementNamed(HomeScreen.routeName);
                },
              ),
              const SizedBox(width: 20.0),
              ActionButton(
                iconData: Icons.replay,
                onPressedFunc: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ActionButton extends StatelessWidget {
  final IconData _iconData;
  final Function() _onPressedFunc;
  const ActionButton(
      {required IconData iconData,
      required Function() onPressedFunc,
      super.key})
      : _iconData = iconData,
        _onPressedFunc = onPressedFunc;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onPressedFunc,
      child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Theme.of(context).primaryColor,
        ),
        child: Icon(
          _iconData,
          color: Colors.white,
        ),
      ),
    );
  }
}
