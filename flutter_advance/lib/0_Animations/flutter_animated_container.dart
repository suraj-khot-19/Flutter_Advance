import 'package:flutter/material.dart';
import 'package:flutter_advance/utils/code_display.dart';
import 'package:flutter_advance/utils/codes/my_codes.dart';

class FlutterAnimatedContainer extends StatefulWidget {
  const FlutterAnimatedContainer({super.key});

  @override
  State<FlutterAnimatedContainer> createState() =>
      _FlutterAnimatedContainerState();
}

class _FlutterAnimatedContainerState extends State<FlutterAnimatedContainer> {
  bool selected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Animated Container"),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 500,
              width: MediaQuery.of(context).size.width,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    selected = !selected;
                  });
                },
                // Creates a container that animates its parameters implicitly
                child: Center(
                  child: AnimatedContainer(
                    height: selected ? 100 : 300,
                    width: selected ? 100 : 300,
                    duration: const Duration(seconds: 3),
                    alignment:
                        selected ? Alignment.center : Alignment.topCenter,
                    color: selected ? Colors.blue : Colors.green,
                    curve: Easing.legacy,
                    child: Center(
                      child: Text(
                        selected.toString(),
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            CodeDisplay(text: MyCodes().animatedContainer)
          ],
        ),
      ),
    );
  }
}
