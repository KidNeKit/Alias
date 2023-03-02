import 'package:flutter/material.dart';

import '../../resources/colors.dart';

class BodyWrapper extends StatelessWidget {
  final Widget _body;
  final Icon? _floatingIcon;
  final Function()? _floatingFunc;
  const BodyWrapper(
      {required Widget body,
      Icon? floatingIcon,
      Function()? floatingFunc,
      super.key})
      : _body = body,
        _floatingIcon = floatingIcon,
        _floatingFunc = floatingFunc;

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
      floatingActionButton: _floatingFunc == null
          ? null
          : FloatingActionButton(
              onPressed: _floatingFunc,
              child: _floatingIcon,
            ),
    );
  }
}
