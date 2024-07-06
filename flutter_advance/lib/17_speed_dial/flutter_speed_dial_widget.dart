import 'package:flutter/material.dart';
import 'package:flutter_advance/utils/code_display.dart';
import 'package:flutter_advance/utils/codes/my_codes.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

/*
pubspec.yaml
  flutter_speed_dial: ^7.0.0

 */
class FlutterSpeedDialWidget extends StatelessWidget {
  const FlutterSpeedDialWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber.shade300,
      appBar: AppBar(
        title: const Text("Speed Dial"),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CodeDisplay(text: MyCodes().speedDial),
          ],
        ),
      ),
      floatingActionButton: SpeedDial(
        animationDuration: const Duration(seconds: 1),
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 2),
          borderRadius: BorderRadius.circular(15),
        ),
        animatedIcon: AnimatedIcons.close_menu,
        // elevation: 0,
        backgroundColor: Colors.red,
        //Add a space at between speed dial and children
        spacing: 20,
        spaceBetweenChildren: 15,

        children: [
          SpeedDialChild(
            label: "copy",
            child: const Icon(Icons.copy),
          ),
          SpeedDialChild(
            label: "share",
            child: const Icon(Icons.share),
          ),
          SpeedDialChild(
            backgroundColor: Colors.white30,
            labelBackgroundColor: Colors.white30,
            // visible: false,
            onTap: () {
              ScaffoldMessenger.of(context)
                  .showSnackBar(const SnackBar(content: Text("Flutter")));
            },
            label: "flutter",
            child: const FlutterLogo(),
          ),
        ],
      ),
    );
  }
}
