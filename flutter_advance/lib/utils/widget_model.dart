import 'package:flutter/material.dart';
import 'package:flutter_advance/0_Animations/flutter_01_animated_builder.dart';
import 'package:flutter_advance/0_Animations/flutter_02_animated_container.dart';
import 'package:flutter_advance/0_Animations/flutter_03_animated_cross_fade.dart';
import 'package:flutter_advance/0_Animations/flutter_04_animated_default_text_style.dart';
import 'package:flutter_advance/0_Animations/flutter_05_animated_icon.dart';
import 'package:flutter_advance/0_Animations/flutter_06_animated_align_widget.dart';
import 'package:flutter_advance/0_Animations/flutter_07_animated_list.dart';
import 'package:flutter_advance/0_Animations/flutter_08_practice_animated_list.dart';
import 'package:flutter_advance/0_Animations/flutter_09_animated_model_barrier.dart';
import 'package:flutter_advance/0_Animations/flutter_10_animated_opacity.dart';
import 'package:flutter_advance/0_Animations/flutter_11_animated_padding.dart';
import 'package:flutter_advance/0_Animations/flutter_12_animated_physical_model.dart';
import 'package:flutter_advance/0_Animations/flutter_13_animated_positional.dart';
import 'package:flutter_advance/0_Animations/flutter_14_animation_rotation.dart';
import 'package:flutter_advance/0_Animations/flutter_15_animated_size.dart';
import 'package:flutter_advance/0_Animations/flutter_16_animated_switcher.dart';
import 'package:flutter_advance/10_stack_visa_card/stack_visa_card.dart';
import 'package:flutter_advance/11_tab_bar/flutter_tab_bar.dart';
import 'package:flutter_advance/12_image_picker/flutter_image_picker.dart';
import 'package:flutter_advance/13_carousel_slider/flutter_carusal_slider.dart';
import 'package:flutter_advance/14_form/flutter_forms.dart';
import 'package:flutter_advance/15_about_dialog/flutter_about_dialog.dart';
import 'package:flutter_advance/16_abosorb_pointer/absorb_pointer.dart';
import 'package:flutter_advance/17_speed_dial/flutter_speed_dial_widget.dart';
import 'package:flutter_advance/18_dark_light_theme_provider/dark_light_theme_provider.dart';
import 'package:flutter_advance/19_custom_paint_clock/flutter_custom_paint_clock.dart';
import 'package:flutter_advance/1_stream/flutter_stream.dart';
import 'package:flutter_advance/20_Auto_Complete/flutter_auto_complete.dart';
import 'package:flutter_advance/21_Image_Icon/flutter_image_icon.dart';
import 'package:flutter_advance/22_baseline_widget/flutter_base_line_widget.dart';
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
    Widgets(widget: const Home(), name: "App Drawer"),
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
    Widgets(widget: const FlutterImageIcon(), name: "Image Icon"),
    Widgets(widget: const FlutterCarusalSlider(), name: "Carousel Slider"),
    Widgets(widget: const FlutterForms(), name: "Flutter Forms"),
    Widgets(widget: const FlutterAnimatedBuilder(), name: "Animated Builder"),
    Widgets(
        widget: const FlutterAnimatedContainer(), name: "Animated Container"),
    Widgets(
        widget: const Flutter03AnimatedCrossFade(),
        name: "Animated Cross Fade"),
    Widgets(
        widget: const Flutter04AnimatedDefaultTextStyle(),
        name: "Animated Default Text Style"),
    Widgets(widget: const Flutter05AnimatedIcon(), name: "Animated Icon"),
    Widgets(
        widget: const Flutter06AnimatedAlignWidget(), name: "Animated Align"),
    Widgets(widget: const Flutter07AnimatedList(), name: "Animated List"),
    Widgets(
        widget: const Flutter08PracticeAnimatedList(),
        name: "Animated List(Automatic using Timer)"),
    Widgets(
        widget: const Flutter09AnimatedModelBarrier(),
        name: "Animated Model Barrier"),
    Widgets(widget: const Flutter10AnimatedOpacity(), name: "Animated Opacity"),
    Widgets(widget: const Flutter11AnimatedPadding(), name: "Animated Padding"),
    Widgets(widget: const Flutter15AnimatedSize(), name: "Animated Size"),
    Widgets(
        widget: const Flutter16AnimatedSwitcher(), name: "Animated Switcher"),
    Widgets(
        widget: const Flutter14AnimationRotation(), name: "Animated Rotation"),
    Widgets(
        widget: const Flutter13AnimatedPositional(),
        name: "Animated Positional"),
    Widgets(
        widget: const Flutter12AnimatedPhysicalModel(),
        name: "Animated physical model"),
    Widgets(
        widget: const FlutterSpeedDialWidget(), name: "Fluttter Speed Dial"),
    Widgets(
        widget: const DarkLightThemeProvider(),
        name: "Theme changer using provider"),
    Widgets(
        widget: const FlutterAutoComplete(),
        name: "Auto Complete(while search)"),
    Widgets(widget: const FlutterBaseLineWidget(), name: "Base Line Widget"),
    Widgets(
        widget: const FlutterCustomPaintClock(),
        name: "Custom paint \"Clock\""),
  ];
  //getter
  List<Widgets> get widgets => _widget;
}
