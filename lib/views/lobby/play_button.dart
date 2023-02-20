import 'package:alias/resources/colors.dart';
import 'package:alias/views/play_screen/play_screen.dart';
import 'package:flutter/material.dart';

class PlayButton extends StatelessWidget {
  const PlayButton({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Align(
      alignment: Alignment.center,
      child: GestureDetector(
        onTap: () => Navigator.of(context).pushNamed(PlayScreen.routeName),
        child: Container(
          height: 0.5 * screenWidth,
          width: 0.5 * screenWidth,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: primaryColor,
          ),
          child: Center(
            child: Text(
              'PLAY',
              style: Theme.of(context).textTheme.labelMedium,
            ),
          ),
        ),
      ),
    );
  }
}
