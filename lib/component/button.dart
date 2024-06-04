import 'package:flutter/material.dart';

class ButtonKu extends StatelessWidget {
  final void Function()? onTap;
  final Widget child;

  const ButtonKu({super.key, required this.onTap, required this.child});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: child,
      ),
    );
  }
}
