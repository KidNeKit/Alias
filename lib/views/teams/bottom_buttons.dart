import 'package:flutter/material.dart';

import '../components/custom_button.dart';

class BottomButtons extends StatelessWidget {
  const BottomButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomButton(
          text: 'Back',
          onPressedFunc: () => Navigator.of(context).pop(),
        ),
        const SizedBox(width: 15.0),
        CustomButton(
          text: 'Continue',
          onPressedFunc: () {},
        ),
      ],
    );
  }
}
