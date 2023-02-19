import 'package:flutter/material.dart';

import '../../../resources/colors.dart';
import '../../pack/pack_screen.dart';

class PackPicker extends StatelessWidget {
  const PackPicker({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pushNamed(PackScreen.routeName),
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: accentColor,
        ),
      ),
    );
  }
}
