import 'package:flutter/material.dart';

class CustomPopupMenuItem<T> extends PopupMenuItem<T> {
  final Color backgroundColor;
  final double borderRadius;
  final Widget child;

  const CustomPopupMenuItem({
    Key? key,
    required this.backgroundColor,
    required this.borderRadius,
    required this.child,
    required T value,
  }) : super(key: key, value: value, child: child);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: child,
    );
  }
}
