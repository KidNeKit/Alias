import 'package:flutter/material.dart';

import '../../resources/colors.dart';

class TurnResultScreen extends StatelessWidget {
  static const String routeName = '/turn_result_screen';
  const TurnResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkColor,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(15.0),
          child: const Center(
            child: Text('Results'),
          ),
        ),
      ),
    );
  }
}
