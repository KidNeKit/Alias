import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../view_models/game_settings_view_model.dart';
import '../../global_components/text/custom_titles.dart';

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
          color: Theme.of(context).backgroundColor,
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(color: Theme.of(context).primaryColor),
        ),
        child: Stack(
          children: [
            Center(
              child: CustomSmallTitle(
                  text: value.selectedPack == null
                      ? 'There is nothing selected yet'
                      : value.selectedPack!.name),
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
