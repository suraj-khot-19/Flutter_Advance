import 'package:flutter/material.dart';
import 'package:flutter_advance/utils/code_display.dart';
import 'package:flutter_advance/utils/codes/my_codes.dart';

class FlutterTabBar extends StatelessWidget {
  const FlutterTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      initialIndex: 0,
      animationDuration: const Duration(milliseconds: 500),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Tab Bar"),
          backgroundColor: Colors.black26,

          elevation: 0,
          //tabs==>
          bottom: const TabBar(
            dividerColor: Colors.transparent,
            padding: EdgeInsets.zero,
            tabAlignment: TabAlignment.fill,
            tabs: [
              Tab(
                icon: Icon(Icons.code),
                text: "Code",
              ),
              Tab(
                icon: Icon(Icons.home_max_outlined),
                text: "Chat",
              ),
              Tab(
                icon: Icon(Icons.punch_clock_rounded),
                text: "Status",
              ),
              Tab(
                icon: Icon(Icons.call_outlined),
                text: "Calls",
              ),
              Tab(
                icon: Icon(Icons.settings_outlined),
                text: "Settings",
              )
            ],
          ),
        ),
        body: TabBarView(
          children: [
            //code
            SingleChildScrollView(
              child: Column(
                children: [
                  CodeDisplay(text: MyCodes().tab),
                ],
              ),
            ),

            //0
            Column(
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return const Text("Chats");
                  },
                )
              ],
            ),

            //1
            Column(
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return const Text("status");
                  },
                )
              ],
            ),

            //2
            Column(
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return const Text("calls");
                  },
                )
              ],
            ),

            ///3
            Column(
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return const Text("Settings");
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
