import 'package:alias/resources/colors.dart';
import 'package:flutter/material.dart';

class TeamItem extends StatelessWidget {
  const TeamItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: primaryColor,
      ),
    );
  }
}
