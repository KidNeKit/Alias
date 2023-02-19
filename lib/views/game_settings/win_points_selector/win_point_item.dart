import 'package:alias/models/enums/win_points.dart';
import 'package:alias/resources/colors.dart';
import 'package:flutter/material.dart';

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
        color: _isSelected ? primaryColor : darkColor,
        border: _isSelected
            ? null
            : Border.all(
                color: primaryColor,
                width: 2.0,
              ),
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
