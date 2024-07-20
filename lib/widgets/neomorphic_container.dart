import 'package:flutter/material.dart';

class NeomorphicContainer extends StatelessWidget {
  final Widget child;
  final double borderRadius;
  final double offset;
  final double blurRadius;
  final Color color;

  NeomorphicContainer({
    required this.child,
    this.borderRadius = 15.0,
    this.offset = 10.0,
    this.blurRadius = 30.0,
    this.color = const Color(0xFFE0E0E0),
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          color: color,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade500,
              offset: Offset(offset, offset),
              blurRadius: blurRadius,
            ),
            BoxShadow(
              color: Colors.white,
              offset: Offset(-offset, -offset),
              blurRadius: blurRadius,
            ),
          ],
        ),
        child: child,
      ),
    );
  }
}
