import 'package:flutter/material.dart';

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
      backgroundColor: Theme.of(context).backgroundColor,
      floatingActionButton: _floatingFunc == null
          ? null
          : FloatingActionButton(
              onPressed: _floatingFunc,
              child: _floatingIcon,
            ),
      body: buildBody(),
    );
  }

  Widget buildBody() {
    return buildChild();
  }

  Widget buildChild() {
    return SafeArea(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(15.0),
        child: _body,
      ),
    );
  }
}
