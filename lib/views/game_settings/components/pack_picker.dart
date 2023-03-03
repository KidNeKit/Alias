import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../view_models/game_settings_view_model.dart';
import '../../pack/pack_screen.dart';

class PackPicker extends StatelessWidget {
  const PackPicker({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(PackScreen.routeName);
      },
      child: Consumer<GameSettingsViewModel>(builder: (context, value, child) {
        bool isPackSelected = value.selectedPack != null;
        return Center(
          child: Container(
            height: 50,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Theme.of(context).primaryColor,
              border: isPackSelected
                  ? Border.all(color: Theme.of(context).cardColor, width: 3.0)
                  : null,
            ),
            child: Center(
              child: Text(
                isPackSelected ? value.selectedPack!.name : 'Select pack',
                style: Theme.of(context).textTheme.labelSmall,
              ),
            ),
          ),
        );
      }),
    );
  }
}
