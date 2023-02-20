import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../resources/colors.dart';
import '../../../view_models/game_view_model.dart';

class TeamsSettings extends StatelessWidget {
  const TeamsSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<GameViewModel>(
      builder: (context, value, child) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomArrowIcon(
              iconData: Icons.arrow_left,
              onPressedFunc: () => value.removeTeam(),
              isAvailable: value.teamQuantity > 2),
          Text(
            value.teamQuantity.toString(),
            style: Theme.of(context).textTheme.labelMedium,
          ),
          CustomArrowIcon(
              iconData: Icons.arrow_right,
              onPressedFunc: () => value.addTeam(),
              isAvailable: value.teamQuantity < 4),
        ],
      ),
    );
  }
}

class CustomArrowIcon extends StatelessWidget {
  final IconData _iconData;
  final Function() _onPressedFunc;
  final bool _isAvailable;

  const CustomArrowIcon(
      {required IconData iconData,
      required Function() onPressedFunc,
      required bool isAvailable,
      super.key})
      : _iconData = iconData,
        _onPressedFunc = onPressedFunc,
        _isAvailable = isAvailable;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onPressedFunc,
      child: Icon(
        _iconData,
        color: _isAvailable ? lightColor : darkColor,
        size: 40.0,
      ),
    );
  }
}
