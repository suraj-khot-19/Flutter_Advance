import 'package:flutter/material.dart';
import 'package:flutter_advance/utils/code_display.dart';
import 'package:flutter_advance/utils/codes/my_codes.dart';

class FlutterAboutDialog extends StatelessWidget {
  const FlutterAboutDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("About Dialog"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.all(20),
              color: Colors.white12,
              child: Center(
                child: ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return const AboutDialog(
                          //The name of the application.Defaults to the value of [Title.title], if a [Title] widget can be found. Otherwise, defaults to [Platform.resolvedExecutable].
                          applicationName: "application Name",
                          applicationIcon: FlutterLogo(),
                          //A string to show in small print.Typically this is a copyright notice.Defaults to the empty string.
                          applicationLegalese: "application Legalese",
                          //The version of this build of the application.This string is shown under the application name.Defaults to the empty string.
                          applicationVersion: "application Version",
                        );
                      },
                    );
                  },
                  child: const Text(
                    "about dialog",
                  ),
                ),
              ),
            ),
            CodeDisplay(text: MyCodes().aboutDialog),
          ],
        ),
      ),
    );
  }
}
