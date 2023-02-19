import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../models/enums/difficulty_level.dart';
import '../../../view_models/game_view_model.dart';
import '../../../view_models/pack_view_model.dart';
import 'complexity_item.dart';

class ComplexitySelector extends StatelessWidget {
  const ComplexitySelector({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PackViewModel>(
      builder: (context, packValue, child) => Consumer<GameViewModel>(
        builder: (context, gameValue, child) => Column(
          children: List.generate(
            DifficultyLevel.values.length,
            (index) => GestureDetector(
              onTap: () {
                if (packValue.selectedPack != null &&
                    packValue.selectedPack!.levels
                        .map((e) => e.level)
                        .contains(DifficultyLevel.values[index])) {
                  gameValue.setLevel = DifficultyLevel.values[index];
                }
              },
              child: ComplexityItem(
                level: DifficultyLevel.values[index],
                isAvailable: packValue.selectedPack != null &&
                    packValue.selectedPack!.levels
                        .map((e) => e.level)
                        .contains(DifficultyLevel.values[index]),
                isSelected: DifficultyLevel.values[index] == gameValue.level,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
