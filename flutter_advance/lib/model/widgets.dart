import 'package:flutter/material.dart';
import 'package:flutter_advance/1_stream/flutter_stream.dart';
import 'package:flutter_advance/2_broadcasting_stream/flutter_multi_stream.dart';
import 'package:flutter_advance/4_dismissible/flutter_dismissble.dart';
import 'package:flutter_advance/5_alert_dialog/flutter_alert_dialog.dart';
import 'package:flutter_advance/6_bottom_sheet/flutter_bottom_sheet.dart';
import 'package:flutter_advance/home.dart';

class Widgets {
  final Widget widget;
  final String name;

  Widgets({
    required this.widget,
    required this.name,
  });
}

class WidgetsData {
  final List<Widgets> _widget = [
    Widgets(widget: const Home(), name: "Home"),
    Widgets(widget: const FlutterStream(), name: "Single Stream"),
    Widgets(widget: const FlutterMultiStream(), name: "Multi Stream"),
    Widgets(widget: const FlutterDismissble(), name: "Dismissible"),
    Widgets(widget: const FlutterAlertDialog(), name: "Alert Dialog"),
    Widgets(widget: const FlutterBottomSheet(), name: "Bottom Sheet"),
  ];
  //getter
  List<Widgets> get widgets => _widget;
}
