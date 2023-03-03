import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../models/enums/win_points.dart';
import '../../../view_models/game_settings_view_model.dart';

class WinPointsSelector extends StatelessWidget {
  const WinPointsSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Consumer<GameSettingsViewModel>(
        builder: (context, value, child) => GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
          scrollDirection: Axis.vertical,
          childAspectRatio: 3 / 1,
          physics: const NeverScrollableScrollPhysics(),
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

class WinPointItem extends StatelessWidget {
  final WinPoints _winPoint;
  final bool _isSelected;
  const WinPointItem(
      {required WinPoints winPoint, required bool isSelected, super.key})
      : _winPoint = winPoint,
        _isSelected = isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Theme.of(context).primaryColor,
        border: _isSelected
            ? Border.all(
                color: Theme.of(context).cardColor,
                width: 3.0,
              )
            : null,
      ),
      child: Align(
        alignment: Alignment.center,
        child: Text(
          _winPoint.value.toString(),
          style: Theme.of(context).textTheme.labelSmall,
        ),
      ),
    );
  }
}
