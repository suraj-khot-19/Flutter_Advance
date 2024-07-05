import 'package:flutter/material.dart';
import 'package:flutter_advance/0_Animations/flutter_animated_builder.dart';
import 'package:flutter_advance/0_Animations/flutter_animated_container.dart';
import 'package:flutter_advance/10_stack_visa_card/stack_visa_card.dart';
import 'package:flutter_advance/11_tab_bar/flutter_tab_bar.dart';
import 'package:flutter_advance/12_image_picker/flutter_image_picker.dart';
import 'package:flutter_advance/13_carousel_slider/flutter_carusal_slider.dart';
import 'package:flutter_advance/14_form/flutter_forms.dart';
import 'package:flutter_advance/15_about_dialog/flutter_about_dialog.dart';
import 'package:flutter_advance/16_abosorb_pointer/absorb_pointer.dart';
import 'package:flutter_advance/1_stream/flutter_stream.dart';
import 'package:flutter_advance/2_broadcasting_stream/flutter_multi_stream.dart';
import 'package:flutter_advance/4_dismissible/flutter_dismissble.dart';
import 'package:flutter_advance/5_alert_dialog/flutter_alert_dialog.dart';
import 'package:flutter_advance/6_bottom_sheet/flutter_bottom_sheet.dart';
import 'package:flutter_advance/7_animated_text/flutter_animated_text.dart';
import 'package:flutter_advance/8_bottom_navigation_bar/flutter_bottom_navigation.dart';
import 'package:flutter_advance/9_drop_down_menue_button/flutter_drop_down_menue_button.dart';
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
    Widgets(widget: const FlutterAboutDialog(), name: "About Dialog"),
    Widgets(widget: const FlutterAbsorbPointer(), name: "Absorb Pointer"),
    Widgets(widget: const FlutterBottomSheet(), name: "Bottom Sheet"),
    Widgets(widget: const FlutterAnimatedText(), name: "Animated Text"),
    Widgets(widget: const FlutterBottomNavigation(), name: "Bottom Navigation"),
    Widgets(
        widget: const FlutterDropDownMenueButton(),
        name: "Drop Down Menue Buttom"),
    Widgets(widget: const StackVisaCard(), name: "Stack(Visa Card)"),
    Widgets(widget: const FlutterTabBar(), name: "Tab Bar"),
    Widgets(widget: const FlutterImagePicker(), name: "Image Picker"),
    Widgets(widget: const FlutterCarusalSlider(), name: "Carousel Slider"),
    Widgets(widget: const FlutterForms(), name: "Flutter Forms"),
    Widgets(widget: const FlutterAnimatedBuilder(), name: "Animated Builder"),
    Widgets(
        widget: const FlutterAnimatedContainer(), name: "Animated Container"),
  ];
  //getter
  List<Widgets> get widgets => _widget;
}
