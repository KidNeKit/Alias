import 'package:flutter/material.dart';

import 'text/custom_titles.dart';

class ErrorSnackbarBody extends StatelessWidget {
  final String _errorText;
  const ErrorSnackbarBody({required String errorText, super.key})
      : _errorText = errorText;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 90,
          width: double.infinity,
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: CustomSmallTitle(text: _errorText),
        ),
        Positioned(
          right: -10,
          top: -10,
          child: Container(
            padding: const EdgeInsets.all(10.0),
            decoration: const BoxDecoration(
              color: Colors.red,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.close,
              color: Colors.white,
              size: 20.0,
            ),
          ),
        )
      ],
    );
  }
}
