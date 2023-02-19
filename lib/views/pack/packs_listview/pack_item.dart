import 'package:alias/resources/colors.dart';
import 'package:flutter/material.dart';

class PackItem extends StatelessWidget {
  final String _packName;
  const PackItem({required String packName, super.key}) : _packName = packName;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: primaryColor,
      ),
      child: Center(
        child: Text(
          _packName,
          style: Theme.of(context).textTheme.labelSmall,
        ),
      ),
    );
  }
}
