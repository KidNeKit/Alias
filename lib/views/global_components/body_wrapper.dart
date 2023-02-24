import 'package:flutter/material.dart';

import '../../resources/colors.dart';

class BodyWrapper extends StatelessWidget {
  final Widget _body;
  const BodyWrapper({required Widget body, super.key}) : _body = body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkColor,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(15.0),
          child: _body,
        ),
      ),
    );
  }
}
