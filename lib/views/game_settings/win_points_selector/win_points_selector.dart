import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../models/enums/win_points.dart';
import '../../../view_models/game_settings_view_model.dart';
import 'win_point_item.dart';

class WinPointsSelector extends StatelessWidget {
  const WinPointsSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<GameSettingsViewModel>(
      builder: (context, value, child) => Expanded(
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
          scrollDirection: Axis.vertical,
          childAspectRatio: 3 / 1,
          children: List.generate(
            WinPoints.values.length,
            (index) => GestureDetector(
              onTap: () => value.setWinPoints = WinPoints.values[index],
              child: WinPointItem(
                winPoint: WinPoints.values[index],
                isSelected: WinPoints.values[index] == value.winPoints,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
