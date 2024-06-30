import 'package:flutter/material.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/github.dart';

class CodeDisplay extends StatelessWidget {
  final String text;
  const CodeDisplay({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: HighlightView(
        padding: const EdgeInsets.all(20),
        theme: githubTheme,
        text,
        language: "dart",
        textStyle: const TextStyle(fontFamily: 'Courier', fontSize: 14),
      ),
    );
  }
}
