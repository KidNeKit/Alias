import 'package:flutter/material.dart';

import '../../../models/enums/difficulty_level.dart';
import '../../../resources/colors.dart';

class ComplexityItem extends StatelessWidget {
  final DifficultyLevel _level;
  final bool _isAvailable;
  const ComplexityItem(
      {required DifficultyLevel level, required bool isAvailable, super.key})
      : _level = level,
        _isAvailable = isAvailable;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 5.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: _isAvailable ? primaryColor : darkColor,
        border:
            _isAvailable ? null : Border.all(color: primaryColor, width: 2.0),
      ),
      child: Center(
        child: Text(
          _level.name.toUpperCase(),
          style: Theme.of(context).textTheme.labelSmall,
        ),
      ),
    );
  }
}
