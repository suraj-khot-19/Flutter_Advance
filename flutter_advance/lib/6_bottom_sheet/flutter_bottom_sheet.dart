import 'package:flutter/material.dart';
import 'package:flutter_advance/utils/code_display.dart';
import 'package:flutter_advance/utils/codes/my_codes.dart';

class FlutterBottomSheet extends StatelessWidget {
  const FlutterBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bottom Sheet"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.all(100),
              color: Colors.white10,
              child: Center(
                child: ElevatedButton.icon(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      //bg
                      backgroundColor: Colors.indigo,
                      //shape and border
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30)),
                      ),
                      //if click outside dont pop
                      isDismissible: false,
                      //putting color outside
                      barrierColor: Colors.black.withOpacity(0.4),
                      builder: (context) {
                        return const Column(
                          //make it to take as as less as possible
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ListTile(
                              title: Text("suraj"),
                              subtitle: Text("Khot"),
                            ),
                            ListTile(
                              title: Text("adarsh"),
                              subtitle: Text("pujari"),
                            ),
                            ListTile(
                              title: Text("sohan"),
                              subtitle: Text("patil"),
                            ),
                            ListTile(
                              title: Text("shubh"),
                              subtitle: Text("hande"),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  label: const Text("tap"),
                ),
              ),
            ),
            CodeDisplay(text: MyCodes().bottomsheet),
          ],
        ),
      ),
    );
  }
}
