import 'package:flutter/material.dart';

class CustomLargeTitle extends StatelessWidget {
  final String _text;
  final Color? _color;
  const CustomLargeTitle({required String text, Color? color, super.key})
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

class CustomMediumTitle extends StatelessWidget {
  final String _text;
  final Color? _color;
  const CustomMediumTitle({required String text, Color? color, super.key})
      : _text = text,
        _color = color;

  @override
  Widget build(BuildContext context) {
    return Text(
      _text,
      style: Theme.of(context).textTheme.labelMedium!.copyWith(color: _color),
    );
  }
}

class CustomSmallTitle extends StatelessWidget {
  final String _text;
  final Color? _color;
  const CustomSmallTitle({required String text, Color? color, super.key})
      : _text = text,
        _color = color;

  @override
  Widget build(BuildContext context) {
    return Text(
      _text,
      style: Theme.of(context).textTheme.labelSmall!.copyWith(color: _color),
    );
  }
}
