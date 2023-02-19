import 'dart:developer';

import 'package:alias/models/enums/win_points.dart';
import 'package:alias/view_models/game_view_model.dart';
import 'package:alias/views/game_settings/win_points_selector/win_point_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WinPointsSelector extends StatelessWidget {
  const WinPointsSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<GameViewModel>(
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
