import 'package:flutter/material.dart';

import '../global_components/body_wrapper_animated.dart';
import '../global_components/text/custom_titles.dart';
import 'components/packs_listview.dart';
import 'components/selected_pack.dart';

class PackScreen extends StatelessWidget {
  static const String routeName = '/pack_screen';
  const PackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BodyWrapperAnimated(
      body: Column(
        children: [
          const CustomMediumTitle(text: 'Packs catalogue'),
          const SizedBox(height: 10.0),
          const PacksListView(),
          const SizedBox(height: 10.0),
          const SelectedPack(),
          const SizedBox(height: 10.0),
          ElevatedButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const CustomSmallTitle(text: 'Back'),
          ),
        ],
      ),
    );
  }
}
