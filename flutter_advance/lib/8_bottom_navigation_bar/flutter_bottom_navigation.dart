import 'package:flutter/material.dart';
import 'package:flutter_advance/8_bottom_navigation_bar/screens/account_screen.dart';
import 'package:flutter_advance/8_bottom_navigation_bar/screens/code_screen.dart';
import 'package:flutter_advance/8_bottom_navigation_bar/screens/home_screen.dart';
import 'package:flutter_advance/8_bottom_navigation_bar/screens/setting_screen.dart';

class FlutterBottomNavigation extends StatefulWidget {
  const FlutterBottomNavigation({super.key});

  @override
  State<FlutterBottomNavigation> createState() =>
      _FlutterBottomNavigationState();
}

class _FlutterBottomNavigationState extends State<FlutterBottomNavigation> {
  final List<Widget> _list = [
    const CodeScreen(),
    const Home(),
    const SettingScreen(),
    const AccountScreen(),
  ];
  int selected = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bottom Nav Bar"),
      ),
      body: _list[selected],
      bottomNavigationBar: BottomNavigationBar(
        //type
        type: BottomNavigationBarType.fixed,
        // type: BottomNavigationBarType.shifting, which shitft when select
        //on tap
        onTap: (value) {
          setState(() {
            selected = value;
          });
        },
        //bg
        backgroundColor: Colors.pink.withOpacity(0.2),
        //index
        currentIndex: selected,
        //other
        showSelectedLabels: false,
        showUnselectedLabels: false,
        enableFeedback: true,
        selectedIconTheme: const IconThemeData(color: Colors.green),

        items: const [
          //0
          BottomNavigationBarItem(
            tooltip: "Code",
            icon: Icon(Icons.code),
            label: "Code",
          ),
          //1
          BottomNavigationBarItem(
            //when long press
            tooltip: "Home",
            // icon
            icon: Icon(
              Icons.home,
            ),
            // label
            label: "home",
          ),
          //2
          BottomNavigationBarItem(
            tooltip: "Setting",
            icon: Icon(Icons.settings),
            label: "setting",
          ),
          //3
          BottomNavigationBarItem(
            tooltip: "Account",
            icon: Icon(Icons.person),
            label: "Account",
          ),
        ],
      ),
    );
  }
}
