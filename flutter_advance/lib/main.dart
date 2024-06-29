// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_advance/1_stream/flutter_stream.dart';
import 'package:flutter_advance/2_broadcasting_stream/flutter_multi_stream.dart';
import 'package:flutter_advance/3_snack_bar/flutter_snack_bar.dart';
import 'package:flutter_advance/4_dismissible/flutter_dismissble.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
      ),
      // home: const FlutterStream(),
      // home: const FlutterMultiStream(),
      // home: const FlutterSnackBar(),
      home: const FlutterDismissble(),
    );
  }
}
