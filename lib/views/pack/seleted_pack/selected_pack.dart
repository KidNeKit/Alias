import 'package:alias/resources/colors.dart';
import 'package:alias/view_models/pack_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SelectedPack extends StatelessWidget {
  const SelectedPack({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PackViewModel>(
      builder: (context, value, child) => Container(
        height: 100,
        width: double.infinity,
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: darkColor,
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(color: primaryColor),
        ),
        child: Center(
          child: value.selectedPack == null
              ? const Text(
                  'There is nothing selected yet',
                )
              : Text(value.selectedPack!.name),
        ),
      ),
    );
  }
}
