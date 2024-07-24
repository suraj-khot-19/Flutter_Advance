import 'package:flutter/material.dart';

class FlutterImageIcon extends StatelessWidget {
  const FlutterImageIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Image Icon"),
      ),
      body: const Column(
        children: [
          ImageIcon(
            AssetImage("assets/1719892890649.png"),
            size: 100,
            // color: Color(0xFF3A5A98),
          ),
        ],
      ),
    );
  }
}
