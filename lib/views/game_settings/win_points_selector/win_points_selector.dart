import 'package:alias/models/enums/win_points.dart';
import 'package:alias/views/game_settings/win_points_selector/win_point_item.dart';
import 'package:flutter/material.dart';

class WinPointsSelector extends StatelessWidget {
  const WinPointsSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
        scrollDirection: Axis.vertical,
        childAspectRatio: 3 / 1,
        children: List.generate(
          WinPoints.values.length,
          (index) => WinPointItem(winPoint: WinPoints.values[index]),
        ),
      ),
    );
  }
}
