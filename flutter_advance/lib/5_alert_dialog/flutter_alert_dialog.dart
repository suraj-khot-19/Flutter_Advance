import 'package:flutter/material.dart';
import 'package:flutter_advance/home.dart';

class FlutterAlertDialog extends StatelessWidget {
  const FlutterAlertDialog({super.key});

  @override
  Widget build(BuildContext context) {
    void showing() {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              //title
              title: const Text("Alert Dialog Box"),
              //background
              backgroundColor: Colors.pink,
              //content
              content: const Text("This is Content"),
              //actions
              actions: [
                TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text("Close")),
                TextButton(
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Home(),
                      )),
                  child: const Text("Home"),
                ),
              ],
              //icon top
              icon: const Icon(Icons.flutter_dash_outlined),
              //padding to content
              contentPadding: const EdgeInsets.all(20),
              //padding to action
              actionsPadding: const EdgeInsets.all(20),
            );
          });
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Alert Dialog"),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => showing(),
          child: const Text("Tap"),
        ),
      ),
    );
  }
}
