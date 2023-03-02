import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../models/enums/difficulty_level.dart';
import '../../../view_models/game_settings_view_model.dart';
import 'complexity_item.dart';

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
