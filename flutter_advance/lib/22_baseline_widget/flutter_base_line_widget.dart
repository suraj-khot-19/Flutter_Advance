import 'package:flutter/material.dart';

class FlutterBaseLineWidget extends StatelessWidget {
  const FlutterBaseLineWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BaseLine Widget"),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              color: Colors.red,
              height: 200,
              width: 200,
              //creates a widget that positions its child according to the child's baseline.
              child: const Baseline(
                  //The number of logical pixels from the ****top**** of this box at which to position the child's baseline.
                  baseline: 0,
                  //alphabetic:The horizontal line used to align the bottom of glyphs for alphabetic characters.
                  //ideographic:The horizontal line used to align ideographic characters.
                  baselineType: TextBaseline.alphabetic,
                  child: FlutterLogo(
                    size: 50,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
