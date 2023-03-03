import 'dart:developer';

import 'package:flutter/material.dart';

import '../../global_components/text/custom_titles.dart';
import '../../play_screen/play_screen.dart';

class PlayButton extends StatelessWidget {
  const PlayButton({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Align(
      alignment: Alignment.center,
      child: GestureDetector(
        onTap: () =>
            Navigator.of(context).pushReplacementNamed(PlayScreen.routeName),
        child: Container(
          height: 0.5 * screenWidth,
          width: 0.5 * screenWidth,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Theme.of(context).primaryColor,
          ),
          child: const Center(
            child: CustomMediumTitle(text: 'PLAY'),
          ),
        ),
      ),
    );
  }
}
