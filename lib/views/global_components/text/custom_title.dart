import 'package:flutter/material.dart';

class CustomTitle extends StatelessWidget {
  final String _text;
  final Color? _color;
  const CustomTitle({required String text, Color? color, super.key})
      : _text = text,
        _color = color;

  @override
  Widget build(BuildContext context) {
    return Text(
      _text,
      style: Theme.of(context).textTheme.labelLarge!.copyWith(color: _color),
    );
  }
}
