import 'package:flutter/material.dart';

class AppBeautifullCard extends StatelessWidget {
  const AppBeautifullCard({
    super.key,
    this.width,
    this.height,
    required this.child,
    this.color,
    this.bgColor,
  });
  final double? width;
  final double? height;
  final Color? color, bgColor;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        iconTheme: IconThemeData(
          color: color ?? Colors.white,
        ),
      ),
      child: Container(
        width: width,
        height: height,
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: bgColor ?? Colors.brown,
          borderRadius: BorderRadius.circular(8),
        ),
        child: child,
      ),
    );
  }
}
