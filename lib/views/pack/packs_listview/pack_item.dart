import 'package:alias/resources/colors.dart';
import 'package:flutter/material.dart';

class PackItem extends StatelessWidget {
  final String _packName;
  final bool _isSelected;
  const PackItem(
      {required String packName, required bool isSelected, super.key})
      : _packName = packName,
        _isSelected = isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: primaryColor,
        border:
            _isSelected ? Border.all(color: Colors.amber, width: 2.0) : null,
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
