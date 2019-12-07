import 'package:flutter/material.dart';

class CardScaffold extends StatelessWidget {
  CardScaffold({this.color, this.child});

  final Color color;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: child,
        ),
      ),
    );
  }
}
