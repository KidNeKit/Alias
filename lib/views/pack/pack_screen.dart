import 'package:alias/views/pack/seleted_pack/selected_pack.dart';
import 'package:flutter/material.dart';

import '../../resources/colors.dart';
import 'packs_listview/packs_listview.dart';

class PackScreen extends StatelessWidget {
  static const String routeName = '/pack_screen';
  const PackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkColor,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Text(
                'Packs catalogue',
                style: Theme.of(context).textTheme.labelSmall,
              ),
              const SizedBox(height: 10.0),
              const PacksListView(),
              const SizedBox(height: 10.0),
              const SelectedPack(),
              const SizedBox(height: 10.0),
              ElevatedButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text(
                  'Back',
                  style: Theme.of(context).textTheme.labelSmall,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
