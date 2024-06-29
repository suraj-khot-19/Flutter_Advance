import 'package:flutter/material.dart';

class ContainerWithTitle extends StatelessWidget {
  final String title;
  const ContainerWithTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white10, borderRadius: BorderRadius.circular(10)),
      child: Text(title),
    );
  }
}
