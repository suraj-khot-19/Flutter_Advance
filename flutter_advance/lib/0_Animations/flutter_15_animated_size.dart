import 'package:flutter/material.dart';
import 'package:flutter_advance/utils/code_display.dart';
import 'package:flutter_advance/utils/codes/my_codes.dart';

class Flutter15AnimatedSize extends StatefulWidget {
  const Flutter15AnimatedSize({super.key});

  @override
  State<Flutter15AnimatedSize> createState() => _Flutter15AnimatedSizeState();
}

class _Flutter15AnimatedSizeState extends State<Flutter15AnimatedSize> {
  double size = 200;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Animated Size"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 230,
              color: Colors.white12,
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.all(20),
              child: Center(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      size = size == 200 ? size = 100 : size = 200;
                    });
                  },
                  child: AnimatedSize(
                    duration: const Duration(seconds: 1),
                    curve: Curves.easeInExpo,
                    child: FlutterLogo(
                      size: size,
                    ),
                  ),
                ),
              ),
            ),
            CodeDisplay(text: MyCodes().animatedSize)
          ],
        ),
      ),
    );
  }
}
