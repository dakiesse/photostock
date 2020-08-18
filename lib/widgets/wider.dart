import 'package:flutter/material.dart';

class Wider extends StatelessWidget {
  final Widget child;

  const Wider({Key key, @required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: child,
    );
  }
}
