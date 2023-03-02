import 'package:alias/view_models/game_settings_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../resources/colors.dart';
import '../../../view_models/game_view_model.dart';

class SelectedPack extends StatelessWidget {
  const SelectedPack({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<GameSettingsViewModel>(
      builder: (context, value, child) => Container(
        height: 100,
        width: double.infinity,
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: darkColor,
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(color: primaryColor),
        ),
        child: Stack(
          children: [
            Center(
              child: Text(
                value.selectedPack == null
                    ? 'There is nothing selected yet'
                    : value.selectedPack!.name,
                style: Theme.of(context).textTheme.labelSmall,
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: Visibility(
                visible: value.selectedPack != null,
                child: GestureDetector(
                  onTap: () {
                    value.setPack = null;
                  },
                  child: const Icon(
                    Icons.cancel_rounded,
                    color: Colors.red,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
