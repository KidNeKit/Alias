import 'package:alias/models/enums/win_points.dart';
import 'package:alias/resources/colors.dart';
import 'package:flutter/material.dart';

class WinPointItem extends StatelessWidget {
  final WinPoints _winPoint;
  const WinPointItem({required WinPoints winPoint, super.key})
      : _winPoint = winPoint;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: accentColor,
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
