import 'package:flutter/material.dart';
import 'package:flutter_advance/utils/code_display.dart';
import 'package:flutter_advance/utils/codes/my_codes.dart';

class FlutterSnackBar extends StatelessWidget {
  const FlutterSnackBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Snack Bar"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(30),
              color: Colors.white10,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      //defining snackbar
                      final snackbar = SnackBar(
                        backgroundColor: Colors.white.withOpacity(0.3),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        behavior: SnackBarBehavior.floating,
                        duration: const Duration(seconds: 5),
                        showCloseIcon: true,
                        margin: const EdgeInsets.all(20),
                        action:
                            SnackBarAction(label: "close", onPressed: () {}),
                        content: const Text(
                          "My Snack Bar",
                        ),
                      );
                      //showing it using ScaffoldMessenger
                      ScaffoldMessenger.of(context).showSnackBar(snackbar);
                    },
                    child: const Text("SnackBar"),
                  ),
                ],
              ),
            ),
            CodeDisplay(text: MyCodes().snackbar),
          ],
        ),
      ),
    );
  }
}
