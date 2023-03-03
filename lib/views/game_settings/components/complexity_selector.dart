import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../models/enums/difficulty_level.dart';
import '../../../resources/colors.dart';
import '../../../view_models/game_settings_view_model.dart';

class ComplexitySelector extends StatelessWidget {
  const ComplexitySelector({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<GameSettingsViewModel>(
      builder: (context, value, child) => Column(
        children: List.generate(
          DifficultyLevel.values.length,
          (index) {
            bool isAvailable = value.selectedPack != null &&
                value.selectedPack!.levels
                    .map((e) => e.level)
                    .contains(DifficultyLevel.values[index]);
            return GestureDetector(
              onTap: () {
                if (isAvailable) {
                  value.setLevel = DifficultyLevel.values[index];
                }
              },
              child: ComplexityItem(
                level: DifficultyLevel.values[index],
                isAvailable: isAvailable,
                isSelected: DifficultyLevel.values[index] == value.level,
              ),
            );
          },
        ),
      ),
    );
  }
}

class ComplexityItem extends StatelessWidget {
  final DifficultyLevel _level;
  final bool _isAvailable;
  final bool _isSelected;
  const ComplexityItem(
      {required DifficultyLevel level,
      required bool isAvailable,
      required bool isSelected,
      super.key})
      : _level = level,
        _isAvailable = isAvailable,
        _isSelected = isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 5.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: _isAvailable
            ? Theme.of(context).primaryColor
            : Theme.of(context).backgroundColor,
        border: _isSelected
            ? Border.all(color: Theme.of(context).cardColor, width: 3.0)
            : _isAvailable
                ? null
                : Border.all(color: Theme.of(context).primaryColor, width: 3.0),
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
