import 'package:alias/resources/colors.dart';
import 'package:flutter/material.dart';

class PlayScreen extends StatelessWidget {
  static const String routeName = '/play_screen';
  const PlayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkColor,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(15.0),
        ),
      ),
    );
  }
}
