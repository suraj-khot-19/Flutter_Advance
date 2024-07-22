import 'package:flutter/material.dart';
import 'package:flutter_advance/utils/code_display.dart';
import 'package:flutter_advance/utils/codes/my_codes.dart';
import 'package:flutter_advance/utils/widget_model.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Widgets> widgets = WidgetsData().widgets;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Drawer in flutter"),
      ),
      body: SingleChildScrollView(
        child: CodeDisplay(text: MyCodes().home),
      ),
      drawer: Drawer(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //drawer header
              DrawerHeader(
                padding: EdgeInsets.zero,
                child: Container(
                  padding: const EdgeInsets.all(15),
                  color: Colors.cyan.withOpacity(0.5),
                  child: Row(
                    children: [
                      Container(
                        decoration: const BoxDecoration(shape: BoxShape.circle),
                        child: Image.asset(
                          "assets/mi.png",
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Suraj khot",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          Text(
                            "Love Flutter",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              //contents
              ListView.builder(
                itemCount: widgets.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return widgets[index].widget;
                        },
                      ));
                    },
                    child: Card(
                      margin: const EdgeInsets.only(bottom: 5),
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero),
                      child: ListTile(
                        leading: Text(
                          "${index + 1}",
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        title: Text(
                          widgets[index].name,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        trailing: const Icon(Icons.keyboard_arrow_right),
                      ),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
