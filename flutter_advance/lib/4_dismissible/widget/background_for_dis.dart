import 'package:flutter/material.dart';

class BackgroundForDis extends StatelessWidget {
  final Color color;
  final IconData icon;
  final bool isLeft;
  const BackgroundForDis(
      {super.key,
      required this.color,
      required this.icon,
      this.isLeft = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: isLeft
          ? const EdgeInsets.only(left: 8)
          : const EdgeInsets.only(right: 8),
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(15)),
      child: Align(
        alignment: isLeft ? Alignment.centerLeft : Alignment.centerRight,
        child: Icon(icon),
      ),
    );
  }
}
