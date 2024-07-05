import 'package:flutter/material.dart';
import 'package:flutter_advance/utils/code_display.dart';
import 'package:flutter_advance/utils/codes/my_codes.dart';

class Flutter06AnimatedAlignWidget extends StatefulWidget {
  const Flutter06AnimatedAlignWidget({super.key});

  @override
  State<Flutter06AnimatedAlignWidget> createState() =>
      _Flutter06AnimatedAlignWidgetState();
}

class _Flutter06AnimatedAlignWidgetState
    extends State<Flutter06AnimatedAlignWidget> {
  //is tap
  bool isTap = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Animated align"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.white38,
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.all(20),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    isTap = !isTap;
                  });
                },
                child: Container(
                  color: Colors.white24,
                  margin: const EdgeInsets.all(10),
                  width: double.infinity,
                  height: 200,
                  //Creates a widget that positions its child by an alignment that animates implicitly
                  child: AnimatedAlign(
                    alignment:
                        isTap ? Alignment.topLeft : Alignment.bottomRight,
                    duration: const Duration(seconds: 2),
                    curve: Curves.fastOutSlowIn,
                    child: const FlutterLogo(
                      size: 60,
                    ),
                  ),
                ),
              ),
            ),
            CodeDisplay(text: MyCodes().animatedAlign)
          ],
        ),
      ),
    );
  }
}
