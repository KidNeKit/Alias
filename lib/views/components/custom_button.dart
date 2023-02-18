import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String _text;
  final Function() _onPressedFunc;
  const CustomButton(
      {required String text, required Function() onPressedFunc, super.key})
      : _text = text,
        _onPressedFunc = onPressedFunc;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ElevatedButton(
        onPressed: _onPressedFunc,
        child: Text(
          _text,
          style: Theme.of(context).textTheme.labelSmall,
        ),
      ),
    );
  }
}
