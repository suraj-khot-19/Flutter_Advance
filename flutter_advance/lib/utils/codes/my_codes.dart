class MyCodes {
  String stream1 = '''
import 'dart:async';
import 'package:flutter/material.dart';

class FlutterStream extends StatefulWidget {
  const FlutterStream({super.key});

  @override
  State<FlutterStream> createState() => _FlutterStreamState();
}

class _FlutterStreamState extends State<FlutterStream> {
  TextEditingController textEditingController = TextEditingController();
  String texting = "";
  StreamController<String> streamController = StreamController<String>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Single Stream"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /**
             * showing real time text 
             * using streamBuilder 
             */
            StreamBuilder<String>(
              // stream =>*output
              // sink =>*input
              stream: streamController.stream,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text(snapshot.data ?? "Null Data");
                } else {
                  return const Text("no data");
                }
              },
            ),
            SizedBox(
              width: 80,
              child: TextField(
                controller: textEditingController,
                onChanged: (value) {
                  setState(() {
                    texting = value;
                  });
                },
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            ElevatedButton(
              onPressed: () {
                streamController.add(textEditingController.text);
              },
              child: const Text("Done"),
            ),
            const SizedBox(
              height: 100,
            ),
            /*
            without using stream we 
            just use onChanged() in
            textfeild with setState()
             */
            Container(
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                shape: BoxShape.rectangle,
                color: Colors.white10,
              ),
              child: texting.isNotEmpty
                  ? Text("You Entered: \$texting")
                  : const Text("Please enter text in textfeild"),
            ),
          ],
        ),
      ),
    );
  }
}

''';
  String stream2 = '''
import 'dart:async';

import 'package:flutter/material.dart';

class FlutterMultiStream extends StatefulWidget {
  const FlutterMultiStream({super.key});

  @override
  State<FlutterMultiStream> createState() => _FlutterMultiStreamState();
}

class _FlutterMultiStreamState extends State<FlutterMultiStream> {
  TextEditingController textEditingController = TextEditingController();
  StreamController<String> streamController = StreamController<String>();
//using late to create stream
  late Stream<String> _stream;
  @override
  void initState() {
    super.initState();
    //creating broadcasting strean
    _stream = streamController.stream.asBroadcastStream();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Multi streams"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StreamBuilder<String>(
              // passing broadbrand stream
              stream: _stream,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text(snapshot.data ?? "Null Data");
                } else {
                  return const Text("No Data");
                }
              },
            ),
            StreamBuilder<String>(
              // passing broadbrand stream
              stream: _stream,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text(snapshot.data ?? "Null Data");
                } else {
                  return const Text("No Data");
                }
              },
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: 80,
              child: TextField(
                controller: textEditingController,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                streamController.add(textEditingController.text);
              },
              child: const Text("Done"),
            ),
          ],
        ),
      ),
    );
  }
}
''';
  String snackbar = '''
import 'package:flutter/material.dart';

class FlutterSnackBar extends StatelessWidget {
  const FlutterSnackBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Snack Bar"),
        centerTitle: true,
      ),
      body: Center(
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
                  action: SnackBarAction(label: "close", onPressed: () {}),
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
    );
  }
}

''';
  String dismissible1 = '''
class FlutterDismissble extends StatefulWidget {
  const FlutterDismissble({super.key});

  @override
  State<FlutterDismissble> createState() => _FlutterDismissbleState();
}

class _FlutterDismissbleState extends State<FlutterDismissble> {
  List<String> emails = [
    "figma",
    "noreplay",
    "Angle-one",
    "suk",
    "suraj",
    "kle",
    "dmat",
    "khot"
  ];
  List<String> archived = [];
  List<String> deleted = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dissmisable"),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              InkWell(
                onTap: () async {
                  //rebuilding UI when Navigate to screen
                  bool result = await Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Deleted(
                                deleted: deleted,
                                emails: emails,
                              )));
                  if (result == true) {
                    setState(() {});
                  }
                },
                child: const ContainerWithTitle(
                  title: "Deleted",
                ),
              ),
              InkWell(
                onTap: () async {
                  //rebuilding UI when Navigate to screen
                  bool result = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Archived(
                        archived: archived,
                        emails: emails,
                      ),
                    ),
                  );
                  if (result == true) {
                    setState(() {});
                  }
                },
                child: const ContainerWithTitle(
                  title: "Archived",
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: emails.length,
              itemBuilder: (context, index) {
                return Card(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  child: Dismissible(
                    key: Key(emails[index]),
                    //background for left->right
                    background: const BackgroundForDis(
                      color: Colors.green,
                      icon: Icons.archive_outlined,
                      isLeft: true,
                    ),
                    //secoundry background
                    secondaryBackground: const BackgroundForDis(
                      color: Color.fromARGB(255, 255, 17, 0),
                      icon: Icons.delete_forever_outlined,
                    ),
                    //function when dissmessed occurs
                    onDismissed: (direction) {
                      String removedEmail = emails[index];
                      setState(() {
                        emails.removeAt(index);
                      });
                      //left->right
                      if (direction == DismissDirection.startToEnd) {
                        setState(() {
                          archived.add(removedEmail);
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: Colors.green,
                            duration: const Duration(seconds: 3),
                            content: Text(
                              "\${emails[index]} archived",
                              style: const TextStyle(color: Colors.white),
                            ),
                            action: SnackBarAction(
                                label: "Undo",
                                onPressed: () {
                                  setState(() {
                                    emails.insert(index, removedEmail);
                                    archived.remove(removedEmail);
                                  });
                                }),
                          ),
                        );
                      }
                      //right to left
                      if (direction == DismissDirection.endToStart) {
                        setState(() {
                          deleted.add(removedEmail);
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            duration: const Duration(seconds: 3),
                            backgroundColor: Colors.red,
                            content: Text(
                              "\${emails[index]} deleted",
                              style: const TextStyle(color: Colors.black),
                            ),
                            action: SnackBarAction(
                                label: "Undo",
                                onPressed: () {
                                  setState(() {
                                    emails.insert(index, removedEmail);
                                    deleted.remove(removedEmail);
                                  });
                                }),
                          ),
                        );
                      }
                    },

                    ///returning
                    child: ListTile(
                      leading: const CircleAvatar(
                        backgroundColor: Colors.grey,
                      ),
                      title: Text(emails[index].toString()),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

''';
  String dismissble2 = '''
class Archived extends StatefulWidget {
  final List<String> archived;
  final List<String> emails;
  const Archived({super.key, required this.archived, required this.emails});

  @override
  State<Archived> createState() => _ArchivedState();
}

class _ArchivedState extends State<Archived> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Archived"),
      ),
      body: ListView.builder(
        itemCount: widget.archived.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.all(15),
            child: Dismissible(
              background: const BackgroundForDis(
                color: Colors.green,
                icon: Icons.undo_outlined,
                isLeft: true,
              ),
              secondaryBackground: const BackgroundForDis(
                  color: Colors.green, icon: Icons.undo_outlined),
              direction: DismissDirection.horizontal,
              onDismissed: (direction) {
                final String undoArchivedString = widget.archived[index];
                setState(() {
                  widget.emails.insert(index, undoArchivedString);
                  widget.archived.remove(undoArchivedString);
                });
                Navigator.pop(context, true);
              },
              key: Key(widget.emails[index]),
              child: ListTile(
                leading: const CircleAvatar(
                  backgroundColor: Colors.grey,
                ),
                title: Text(widget.archived[index]),
              ),
            ),
          );
        },
      ),
    );
  }
}

''';
  String dismissble3 = '''
import 'package:flutter/material.dart';
import 'package:flutter_advance/4_dismissible/widget/background_for_dis.dart';

class Deleted extends StatefulWidget {
  final List<String> deleted;
  final List<String> emails;
  const Deleted({
    super.key,
    required this.deleted,
    required this.emails,
  });

  @override
  State<Deleted> createState() => _DeletedState();
}

class _DeletedState extends State<Deleted> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Deleted"),
      ),
      body: ListView.builder(
        itemCount: widget.deleted.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.all(15),
            child: Dismissible(
              background: const BackgroundForDis(
                color: Colors.green,
                icon: Icons.undo_outlined,
                isLeft: true,
              ),
              secondaryBackground: const BackgroundForDis(
                  color: Colors.green, icon: Icons.undo_outlined),
              key: Key(widget.emails[index]),
              direction: DismissDirection.horizontal,
              onDismissed: (direction) {
                String deletedString = widget.deleted[index];
                setState(() {
                  widget.emails.insert(index, deletedString);
                  widget.deleted.remove(deletedString);
                });
                Navigator.pop(context, true);
              },
              child: ListTile(
                leading: const CircleAvatar(
                  backgroundColor: Colors.grey,
                ),
                title: Text(widget.deleted[index]),
              ),
            ),
          );
        },
      ),
    );
  }
}

''';
  String dismissble4 = '''
import 'package:flutter/material.dart';

class BackgroundForDis extends StatelessWidget {
  final Color color;
  final IconData icon;
  final bool isLeft;
  const BackgroundForDis(
      {super.key,
      required this.color,
      required this.icon,
      this.isLeft = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: isLeft
          ? const EdgeInsets.only(left: 8)
          : const EdgeInsets.only(right: 8),
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(15)),
      child: Align(
        alignment: isLeft ? Alignment.centerLeft : Alignment.centerRight,
        child: Icon(icon),
      ),
    );
  }
}

''';
  String dismissble5 = '''
import 'package:flutter/material.dart';

class ContainerWithTitle extends StatelessWidget {
  final String title;
  const ContainerWithTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white10, borderRadius: BorderRadius.circular(10)),
      child: Text(title),
    );
  }
}

''';
  String alertdialog = '''
import 'package:flutter/material.dart';
import 'package:flutter_advance/home.dart';

class FlutterAlertDialog extends StatelessWidget {
  const FlutterAlertDialog({super.key});

  @override
  Widget build(BuildContext context) {
    void showing() {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              //title
              title: const Text("Alert Dialog Box"),
              //background
              backgroundColor: Colors.pink,
              //content
              content: const Text("This is Content"),
              //actions
              actions: [
                TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text("Close")),
                TextButton(
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Home(),
                      )),
                  child: const Text("Home"),
                ),
              ],
              //icon top
              icon: const Icon(Icons.flutter_dash_outlined),
              //padding to content
              contentPadding: const EdgeInsets.all(20),
              //padding to action
              actionsPadding: const EdgeInsets.all(20),
            );
          });
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Alert Dialog"),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => showing(),
          child: const Text("Tap"),
        ),
      ),
    );
  }
}

''';
  String bottomsheet = '''
import 'package:flutter/material.dart';

class FlutterBottomSheet extends StatelessWidget {
  const FlutterBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bottom Sheet"),
        centerTitle: true,
      ),
      body: Container(
        color: const Color.fromARGB(255, 194, 72, 189),
        child: Center(
          child: ElevatedButton.icon(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                //bg
                backgroundColor: Colors.indigo,
                //shape and border
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                ),
                //if click outside dont pop
                isDismissible: false,
                //putting color outside
                barrierColor: Colors.black.withOpacity(0.4),
                builder: (context) {
                  return const Column(
                    //make it to take as as less as possible
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ListTile(
                        title: Text("suraj"),
                        subtitle: Text("Khot"),
                      ),
                      ListTile(
                        title: Text("adarsh"),
                        subtitle: Text("pujari"),
                      ),
                      ListTile(
                        title: Text("sohan"),
                        subtitle: Text("patil"),
                      ),
                      ListTile(
                        title: Text("shubh"),
                        subtitle: Text("hande"),
                      ),
                    ],
                  );
                },
              );
            },
            label: const Text("tap"),
          ),
        ),
      ),
    );
  }
}
''';
  String animatedText = '''
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class FlutterAnimatedText extends StatelessWidget {
  const FlutterAnimatedText({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Animated Text"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Fade and scale Animated
                const Text("1. Fade and scale Animated text"),
                SizedBox(
                  height: 60,
                  child: AnimatedTextKit(
                    repeatForever: true,
                    // totalRepeatCount: 10,
                    displayFullTextOnTap: true,
                    stopPauseOnTap: true,
                    animatedTexts: [
                      FadeAnimatedText('Fade First'),
                      ScaleAnimatedText('then Scale'),
                    ],
                  ),
                ),
                const SizedBox(height: 30),

                
                //TypewriterAnimatedText
                const Text("2. Type writerAnimatedText"),
                SizedBox(
                  height: 60,
                  child: AnimatedTextKit(
                    stopPauseOnTap: true,
                    isRepeatingAnimation: true,
                    // totalRepeatCount: 10,
                    animatedTexts: [
                      TypewriterAnimatedText("Type Writer Animated Text")
                    ],
                  ),
                ),
                const SizedBox(height: 30),


                //FlickerAnimatedText
                const Text("3. FlickerAnimatedText"),
                SizedBox(
                  height: 60,
                  child: AnimatedTextKit(
                    stopPauseOnTap: true,
                    // isRepeatingAnimation: true,
                    repeatForever: true,
                    // totalRepeatCount: 10,
                    animatedTexts: [
                      FlickerAnimatedText(
                        "Flicker Animated Text",
                        speed: const Duration(seconds: 1),
                        textStyle: const TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.red),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),


                //RotateAnimatedText
                const Text("4. RotateAnimatedText"),
                SizedBox(
                  height: 60,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text("Stady Text"),
                      const SizedBox(width: 3),
                      AnimatedTextKit(
                        animatedTexts: [
                          RotateAnimatedText("Rotate"),
                          RotateAnimatedText("Animated"),
                          RotateAnimatedText("Text"),
                        ],
                      ),
                    ],
                  ),
                ),


                //WavyAnimatedText
                const SizedBox(height: 30),
                const Text("4. WavyAnimatedText"),
                AnimatedTextKit(
                  repeatForever: true,
                  animatedTexts: [
                    WavyAnimatedText("wavy Animated Text"),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
''';
  String bottomNav = '''
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
//list of widgets
  final List<Widget> _list = [
    const CodeScreen(),
    const Home(),
    const SettingScreen(),
    const AccountScreen(),
  ];
  //currnet index
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
        //on tap changing state with selected
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

''';
  String dropDownMenueButton = '''
import 'package:flutter/material.dart';

class FlutterDropDownMenueButton extends StatefulWidget {
  const FlutterDropDownMenueButton({super.key});

  @override
  State<FlutterDropDownMenueButton> createState() =>
      _FlutterDropDownMenueButtonState();
}

class _FlutterDropDownMenueButtonState
    extends State<FlutterDropDownMenueButton> {
  //list
  List<String> items = [
    "suraj",
    "khot",
    "santosh",
    "aryan",
    "rohan",
  ];
  //initally
  String selectedValue = "suraj";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Drop Down Menue Button",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            DropdownButton<String>(
              //initial value
              value: selectedValue,
              //items
              items: items
                  .map<DropdownMenuItem<String>>(
                    (String value) => DropdownMenuItem<String>(
                      //need to add value here
                      value: value,
                      child: Text(value),
                    ),
                  )
                  .toList(),
              //on cahnged seting state with new value
              onChanged: (String? newvalue) {
                setState(() {
                  selectedValue = newvalue!;
                });
              },
              //color
              dropdownColor: const Color.fromARGB(255, 76, 101, 175),
              //expanded
              isExpanded: true,
              //radius
              borderRadius: BorderRadius.circular(20),
              //other
              icon: const Icon(Icons.swipe_left),
              underline: Container(
                height: 2,
                color: Colors.red,
              ),
              padding: const EdgeInsets.all(20),
              // menuMaxHeight: 30,
              // isDense: true,
            ),
             selectedValue.isNotEmpty
                      ? Text(
                          "Hello, \$selectedValue",
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        )
                      : const Text(""),
          ],
        ),
      ),
    );
  }
}
''';

  String stack = '''

import 'package:flutter/material.dart';

class StackVisaCard extends StatelessWidget {
  const StackVisaCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Stack"),
      ),
      body: Container(
        color: Colors.amber,
        child: Center(
          child: Stack(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                height: 250,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 15, 205, 100),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              Positioned(
                top: 40,
                left: 20,
                child: Image.asset(
                  "assets/1719892890657.png",
                  height: 30,
                  width: 100,
                  fit: BoxFit.contain,
                ),
              ),
              const Positioned(
                top: 80,
                left: 32,
                child: Text(
                  "it's where you want to be",
                  style: TextStyle(color: Colors.black),
                ),
              ),
              const Positioned(
                bottom: 45,
                left: 32,
                child: Text(
                  "9432  1123  9966  4555",
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const Positioned(
                bottom: 17,
                left: 32,
                child: Text(
                  "SURAJ KHOT",
                  style: TextStyle(
                      color: Colors.black87,
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Times'),
                ),
              ),
              Positioned(
                right: -120,
                left: 200,
                child: Container(
                  height: 300,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white.withOpacity(0.1),
                  ),
                ),
              ),
              Positioned(
                /*
              The child's width.
Only two out of the three horizontal values ([left], [right], [width]) can be set. The third must be null.
If all three are null, the [Stack.alignment] is used to position the child horizontally.
               */
                width: 500,
                bottom: -380,
                left: -100,
                child: Container(
                  height: 500,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white.withOpacity(0.1),
                  ),
                ),
              ),
              Positioned(
                right: 30,
                top: 30,
                child: Image.asset(
                  "assets/1719892890649.png",
                  height: 50,
                  width: 50,
                  fit: BoxFit.contain,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
''';
  String tab = '''
import 'package:flutter/material.dart';

class FlutterTabBar extends StatelessWidget {
  const FlutterTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      initialIndex: 0,
      animationDuration: const Duration(milliseconds: 500),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Tab Bar"),
          backgroundColor: Colors.black26,
          elevation: 0,
          //tabs==>
          bottom: const TabBar(
            tabs: [
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
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10),
          child: TabBarView(
            children: [
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
      ),
    );
  }
}
''';

  String imagePick = '''
import 'dart:io';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

/*
dependencies:
  flutter:
  image_picker:
  carousel_slider:
 */

class FlutterImagePicker extends StatefulWidget {
  const FlutterImagePicker({super.key});

  @override
  State<FlutterImagePicker> createState() => _FlutterImagePickerState();
}

class _FlutterImagePickerState extends State<FlutterImagePicker> {
  //x file for any cross paltform file type
  XFile? file;
  XFile? fileCam;
  List<XFile>? fileList;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Image picker"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //single image
          Center(
            child: Container(
              margin: const EdgeInsets.all(20),
              color: Colors.white10,
              height: 200,
              width: 200,
              child: file == null
                  ? const Center(
                      child: Text("No Image Picked!"),
                    )
                  //convering XFILE? to File
                  : Image.file(
                      File(file!.path),
                      fit: BoxFit.cover,
                    ),
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              final XFile? photo =
                  await ImagePicker().pickImage(source: ImageSource.gallery);
              setState(() {
                file = photo;
              });
            },
            child: const Text("Pick Single Image"),
          ),

         //single image camera
                  Center(
                    child: Container(
                      margin: const EdgeInsets.all(20),
                      color: Colors.white10,
                      height: 200,
                      width: 200,
                      child: fileCam == null
                          ? const Center(
                              child: Text("No Image Picked!"),
                            )
                          //convering XFILE? to File
                          : Image.file(
                              File(fileCam!.path),
                              fit: BoxFit.cover,
                            ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      final XFile? photo = await ImagePicker()
                          .pickImage(source: ImageSource.camera);
                      setState(() {
                        fileCam = photo;
                      });
                    },
                    child: const Text("Pick Image from camera"),
                  ),

          //multi images
          Center(
            child: Container(
              height: 200,
              width: 200,
              color: Colors.white24,
              child: fileList == null
                  ? const Center(
                      child: Text("Image not picked"),
                    )
//displaying images using   carousel_slider: package
                  : slider(fileList!),
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              final List<XFile> photListFile =
                  await ImagePicker().pickMultiImage();
              setState(() {
                fileList = photListFile;
              });
            },
            child: const Text("Pick Multi Image"),
          )
        ],
      ),
    );
  }
}

Widget slider(List<XFile> items) {
  return CarouselSlider(
    items: items
        .map(
          (image) => Builder(
            builder: (context) {
              return Image.file(
                File(image.path),
                fit: BoxFit.cover,
              );
            },
          ),
        )
        .toList(),
    options: CarouselOptions(
      height: 200,
      enableInfiniteScroll: false,
    ),
  );
}
''';

  String crousalSlider = '''
/*
dependencies:
  flutter:
  image_picker:
  carousel_slider:
 */


import 'dart:io';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class FlutterCarusalSlider extends StatefulWidget {
  const FlutterCarusalSlider({super.key});

  @override
  State<FlutterCarusalSlider> createState() => _FlutterCarusalSliderState();
}

class _FlutterCarusalSliderState extends State<FlutterCarusalSlider> {
  List<XFile>? file;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Carusal Slider"),
      ),
      body: Column(
        children: [
          Center(
            child: Container(
              margin: const EdgeInsets.all(20),
              color: Colors.white24,
              height: 400,
              width: 500,
              child: file == null
                  ? const Center(
                      child: Text("Pick Images"),
                    )
                  : Slider(items: file!),
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              final List<XFile> photos = await ImagePicker().pickMultiImage();
              setState(() {
                file = photos;
              });
            },
            child: const Text("Pick Images"),
          ),
        ],
      ),
    );
  }
}
''';
  String crousalSlider2 = '''

//CarouselSlider
class Slider extends StatefulWidget {
  final List<XFile> items;
  const Slider({super.key, required this.items});

  @override
  State<Slider> createState() => _SliderState();
}

class _SliderState extends State<Slider> {
  
  //method to show image big
  void showImage(XFile img) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Image.file(
            height: 420,
            width: 600,
            File(img.path),
            fit: BoxFit.cover,
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Close"),
            ),
            TextButton(
              onPressed: () {
                //removing image at object
                setState(() {
                  widget.items.remove(img);
                });
                Navigator.pop(context);
              },
              child: const Text("Delete"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: widget.items
          .map(
            (images) => Builder(
              builder: (context) {
                return Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: Stack(
                    children: [
                      GestureDetector(
                        onTap: () {
                          showImage(images);
                        },
                        child: Image.file(
                          height: 400,
                          File(images.path),
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        right: 10,
                        top: 10,
                        child: IconButton(
                          onPressed: () {
                            //removing image at object
                            setState(() {
                              widget.items.remove(images);
                            });
                          },
                          icon: const Icon(
                            Icons.remove_circle,
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          )
          .toList(),
      options: CarouselOptions(
        height: 250,
        enableInfiniteScroll: false,
      ),
    );
  }
}
''';
  String form = '''
import 'package:flutter/material.dart';

class FlutterForms extends StatefulWidget {
  const FlutterForms({super.key});

  @override
  State<FlutterForms> createState() => _FlutterFormsState();
}

class _FlutterFormsState extends State<FlutterForms> {
  //controllers
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  //form key
  final key = GlobalKey<FormState>();
  /*
  Discards any resources used by the object. After this is called, the object is not in a usable state and should be discarded (calls to [addListener] will throw after the object is disposed).
This method should only be called by the object's owner.
   */
  //disposing
  @override
  void dispose() {
    name.dispose();
    email.dispose();
    password.dispose();
    confirmPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Forms"),
      ),
      body: Form(
        //adding key
        key: key,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              TextFormField(
                controller: name,
                decoration: const InputDecoration(
                  hintText: "name",
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green)),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
                //validator
                validator: (value) {
                  if (value!.isEmpty || value.toString().isEmpty) {
                    return "enter name";
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: email,
                decoration: const InputDecoration(
                  hintText: "email",
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green)),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
                //validator
                validator: (value) {
                  if (value!.isEmpty || value.toString().isEmpty) {
                    return "enter email";
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                //secure
                obscureText: true,
                controller: password,
                decoration: const InputDecoration(
                  hintText: "password",
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green)),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
                //validator
                validator: (value) {
                  if (value!.isEmpty || value.toString().isEmpty) {
                    return "enter passowrd";
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                //secure
                obscureText: true,
                controller: confirmPassword,
                decoration: const InputDecoration(
                  hintText: "confirm password",
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green)),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
                //validator
                validator: (value) {
                  if (value!.isEmpty || value.toString().isEmpty) {
                    return "enter confirm password";
                  } else {
                    return null;
                  }
                },
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: TextButton(
                  onPressed: () {
                    if (password.text == confirmPassword.text) {
                      //using key
                      if (key.currentState!.validate()) {
                        //clear controllers
                        name.clear();
                        email.clear();
                        password.clear();
                        confirmPassword.clear();
                        //sanack bar
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              "Congrats Accout created!",
                            ),
                          ),
                        );
                      }
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          backgroundColor: Colors.red,
                          content: Text(
                            "Password Dont Match!",
                          ),
                        ),
                      );
                    }
                  },
                  child: const Text("Validate"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
''';
  String aboutDialog = '''
import 'package:flutter/material.dart';

class FlutterAboutDialog extends StatelessWidget {
  const FlutterAboutDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("About Dialog"),
      ),
      body: Column(
        children: [
          Center(
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
        ],
      ),
    );
  }
}
''';
  String absorbPointer = '''
import 'package:flutter/material.dart';

class FlutterAbsorbPointer extends StatelessWidget {
  const FlutterAbsorbPointer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Absorb Pointer"),
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            height: 200,
            width: 100,
            child: ElevatedButton(
              // clikable
              onPressed: () {},
              child: null,
            ),
          ),
          SizedBox(
            height: 100,
            width: 200,
            //creates a widget that absorbs pointers during hit testing.
            child: AbsorbPointer(
              //not clickable
              child: ElevatedButton(
                style:
                    ElevatedButton.styleFrom(backgroundColor: Colors.white30),
                onPressed: () {},
                child: null,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
''';
  String animatedBuilder = '''
import 'package:flutter/material.dart';
/*
impoting math
*/
import 'dart:math' as math;

class FlutterAnimatedBuilder extends StatefulWidget {
  const FlutterAnimatedBuilder({super.key});

  @override
  State<FlutterAnimatedBuilder> createState() => _FlutterAnimatedBuilderState();
}

//extends **TickerProviderStateMixin**
/*
Provides [Ticker] objects that are configured to only tick while the current tree is enabled, as defined by [TickerMode].To create an [AnimationController] in a class that uses this mixin, pass vsync: this to the animation controller constructor whenever you create a new animation controller.If you only have a single [Ticker] (for example only a single [AnimationController]) for the lifetime of your [State], then using a [SingleTickerProviderStateMixin] is more efficient. 
 */
class _FlutterAnimatedBuilderState extends State<FlutterAnimatedBuilder>
    with TickerProviderStateMixin {
  //creating controller
  late AnimationController animationController = AnimationController(
      vsync: this, duration: const Duration(seconds: 10))
    ..repeat(); //Starts running this animation in the forward direction, and restarts the animation when it completes.
  //must be dispose
  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Animated Builder",
        ),
      ),
      body: Center(
        child: Column(
          children: [
            const Text("rotate"),
            AnimatedBuilder(
              animation: animationController,
              child: const FlutterLogo(
                size: 60,
              ),
              builder: (context, child) {
                return Transform.rotate(
                  angle: animationController.value * 3.0 * math.pi,
                  child: child,
                );
              },
            ),
            const Text("Flip"),
            AnimatedBuilder(
              animation: animationController,
              child: const FlutterLogo(
                size: 60,
              ),
              builder: (context, child) {
                return Transform.flip(
                  flipX: true,
                  // flipY: true,
                  child: child,
                );
              },
            ),
            const Text("Scale"),
            AnimatedBuilder(
              animation: animationController,
              child: const FlutterLogo(
                size: 60,
              ),
              builder: (context, child) {
                return Transform.scale(
                  scaleX: 3,
                  // scaleY: 3,
                  child: child,
                );
              },
            ),
            const Text("Offset"),
            AnimatedBuilder(
              animation: animationController,
              child: const FlutterLogo(
                size: 60,
              ),
              builder: (context, child) {
                return Transform.translate(
                  offset: const Offset(30.30, 15.0),
                  child: child,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
''';
  String animatedContainer = '''
import 'package:flutter/material.dart';

class FlutterAnimatedContainer extends StatefulWidget {
  const FlutterAnimatedContainer({super.key});

  @override
  State<FlutterAnimatedContainer> createState() =>
      _FlutterAnimatedContainerState();
}

class _FlutterAnimatedContainerState extends State<FlutterAnimatedContainer> {
  bool selected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Animated Container"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                selected = !selected;
              });
            },
            // Creates a container that animates its parameters implicitly
            child: Center(
              child: AnimatedContainer(
                height: selected ? 100 : 300,
                width: selected ? 100 : 300,
                duration: const Duration(seconds: 3),
                alignment: selected ? Alignment.center : Alignment.topCenter,
                color: selected ? Colors.blue : Colors.green,
                curve: Easing.legacy,
                child: Center(
                  child: Text(
                    selected.toString(),
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
''';
  String animatedCrossFade = '''
import 'package:flutter/material.dart';

class Flutter03AnimatedCrossFade extends StatefulWidget {
  const Flutter03AnimatedCrossFade({super.key});

  @override
  State<Flutter03AnimatedCrossFade> createState() =>
      _Flutter03AnimatedCrossFadeState();
}

class _Flutter03AnimatedCrossFadeState
    extends State<Flutter03AnimatedCrossFade> {
  bool isSwitch = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Animated Cross Fade"),
      ),
      body: Center(
        child: Column(
          children: [

            /*
              Creates a cross-fade animation widget.
              The [duration] of the animation is the same for all components (fade in, fade out, and size), 
              and you can pass [Interval]s instead of [Curve]s in order to have finer control, e.g., 
              creating an overlap between the fades.
             */
            AnimatedCrossFade(
              firstChild: Image.asset(
                "assets/ram.jpg",
                height: 150,
                width: 150,
                fit: BoxFit.cover,
              ),
              secondChild: Image.asset(
                "assets/balaji.png",
                height: 150,
                width: 150,
                fit: BoxFit.cover,
              ),
              crossFadeState:
                  //using button
                  isSwitch
                      ? CrossFadeState.showFirst
                      : CrossFadeState.showSecond,
              duration: const Duration(seconds: 2),
              //The fade curve of the first child.Defaults to [Curves.linear].
              firstCurve: Curves.easeInOutCirc,
              //The fade curve of the second child.Defaults to [Curves.linear].
              secondCurve: Curves.easeInOutCubic,
              //The curve of the animation between the two children's sizes.Defaults to [Curves.linear].
              sizeCurve: Curves.bounceInOut,
            ),
            //button
            ElevatedButton(
              onPressed: () {
                setState(() {
                  isSwitch = !isSwitch;
                });
              },
              child: const Text("Switch"),
            ),
          ],
        ),
      ),
    );
  }
}
''';
  String animatedDefaultTextStyle = '''
import 'package:flutter/material.dart';

class Flutter04AnimatedDefaultTextStyle extends StatefulWidget {
  const Flutter04AnimatedDefaultTextStyle({super.key});

  @override
  State<Flutter04AnimatedDefaultTextStyle> createState() =>
      _Flutter04AnimatedDefaultTextStyleState();
}

class _Flutter04AnimatedDefaultTextStyleState
    extends State<Flutter04AnimatedDefaultTextStyle> {
  bool change = false;
  double fontsize = 16;
  Color color = Colors.tealAccent;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Animated Default Text style"),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 60,
              //Creates a widget that animates the default text style implicitly.
              child: AnimatedDefaultTextStyle(
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: fontsize,
                  color: color,
                ),
                duration: const Duration(seconds: 2),
                curve: Curves.easeInOutExpo,
                child: const Text("Jay shree Ram"),
              ),
            ),
            TextButton(
              onPressed: () {
                //using advantage of it using set state
                setState(() {
                  change ? fontsize = 30 : fontsize = 16;
                  change
                      ? color = const Color.fromARGB(255, 173, 89, 5)
                      : color = Colors.tealAccent;

                  change = !change;
                });
              },
              child: const Text("Change"),
            ),
          ],
        ),
      ),
    );
  }
}
''';
  String animatedIcon = '''
import 'package:flutter/material.dart';

class Flutter05AnimatedIcon extends StatefulWidget {
  const Flutter05AnimatedIcon({super.key});

  @override
  State<Flutter05AnimatedIcon> createState() => _Flutter05AnimatedIconState();
}

/*
Provides [Ticker] objects that are configured to only tick while the current tree is enabled, as defined by [TickerMode].
To create an [AnimationController] in a class that uses this mixin, pass vsync: this to the animation controller constructor whenever you create a new animation controller.
If you only have a single [Ticker] (for example only a single [AnimationController]) for the lifetime of your [State], then using a [SingleTickerProviderStateMixin] is more efficient. This is the common case.
*/

class _Flutter05AnimatedIconState extends State<Flutter05AnimatedIcon>
    with TickerProviderStateMixin {

  //for state
  bool isChange = false;

  //controller
  late AnimationController animationController;

  /*
==>>In [initState], subscribe to the object.
==>>In [didUpdateWidget] unsubscribe from the old object and subscribe to the new one if the updated widget configuration requires replacing the object.
==>>In [dispose], unsubscribe from the object.
   */

  
  /*
  Called when this object is inserted into the tree.The framework will call this method exactly once for each [State] object it creates.
   */
  @override
  void initState() {
    //initalising conteroller in initstate
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    super.initState();
  }

  //Called when this object is removed from the tree permanently.
  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Animated Icon"),
      ),
      body: Column(
        children: [
          Center(
            child: GestureDetector(
              onTap: () {
                //using isChange
                if (isChange == true) {
                  //Starts running this animation forwards (towards the end).
                  animationController.forward();
                  isChange = !isChange;
                } else if (isChange == false) {
                  //Starts running this animation in reverse (towards the beginning).
                  animationController.reverse();
                  isChange = !isChange;
                }
              },
              child: Column(
                children: [
                  AnimatedIcon(
                  
                   //initalizing controller
                    progress: animationController,
                    //icon is animated icon
                    icon: AnimatedIcons.close_menu,
                    size: 150,
                  ),
                  AnimatedIcon(
                  
                   //initalizing controller
                    progress: animationController,
                    //icon is animated icon
                    icon: AnimatedIcons.pause_play,
                    size: 150,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
''';
  String animatedAlign = '''
import 'package:flutter/material.dart';

class Flutter06AnimatedAlignWidget extends StatefulWidget {
  const Flutter06AnimatedAlignWidget({super.key});

  @override
  State<Flutter06AnimatedAlignWidget> createState() =>
      _Flutter06AnimatedAlignWidgetState();
}

class _Flutter06AnimatedAlignWidgetState
    extends State<Flutter06AnimatedAlignWidget> {
  //is tap
  bool isTap = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Animated align"),
      ),
      body: Column(
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                isTap = !isTap;
              });
            },
            child: Container(
              color: Colors.white24,
              margin: const EdgeInsets.all(10),
              width: double.infinity,
              height: 200,
              
              //Creates a widget that positions its child by an alignment that animates implicitly
              child: AnimatedAlign(
                alignment: isTap ? Alignment.topLeft : Alignment.bottomRight,
                duration: const Duration(seconds: 2),
                curve: Curves.fastOutSlowIn,
                child: const FlutterLogo(
                  size: 60,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
''';
  String animatedList = '''
import 'package:flutter/material.dart';

class Flutter07AnimatedList extends StatefulWidget {
  const Flutter07AnimatedList({super.key});

  @override
  State<Flutter07AnimatedList> createState() => _Flutter07AnimatedListState();
}

class _Flutter07AnimatedListState extends State<Flutter07AnimatedList> {
  //creating list of items
  final _items = [];
  //key for amimated list state
  final GlobalKey<AnimatedListState> _key = GlobalKey();

  //method to add item
  void add() {
    //item1
    //item2
    // ....
    _items.insert(0, "Item \${_items.length + 1}");
    //without using setstate we can rebuild widget using key
    _key.currentState!.insertItem(
      0, //index
      duration: const Duration(
        seconds: 2,
      ),
    ); /*Insert an item at [index] and start an animation that will be passed to
     [AnimatedList.itemBuilder] when the item is visible.*/
  }

//method to remove item
  void remove(int index) {
    _key.currentState!.removeItem(
      index,
      (_, animation) {
        // Creates a size transition.
        return SizeTransition(
          sizeFactor: animation,
          child: const Card(
            margin: EdgeInsets.all(10),
            color: Colors.red,
            child: ListTile(
              title: Text(
                "Deleted",
                style: TextStyle(fontSize: 24),
              ),
            ),
          ),
        );
      },
      duration: const Duration(seconds: 1),
    ); /*Remove the item at index and start an animation that will be passed to 
    builder when the item is visible.Items are removed immediately. After an 
    item has been removed, its index will no longer be passed to the itemBuilder. 
    However, the item will still appear for duration and during that time builder 
    must construct its widget as needed.*/

    //we removed item from current state but also need to remove forom list also
    _items.removeAt(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Animated List"),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          IconButton(
            onPressed: add,
            icon: const Icon(
              Icons.add,
              size: 50,
            ),
          ),
          Expanded(
            child: AnimatedList(
              //Creates a scrolling container that animates items when they are inserted or removed.
              key: _key,
              initialItemCount: 0,
              padding: const EdgeInsets.all(10),
              itemBuilder: (context, index, animation) {
                return SizeTransition(
                  sizeFactor: animation,
                  //Creates a key that is equal only to itself.
                  key: UniqueKey(),
                  child: Card(
                    color: Colors.blueAccent,
                    margin: const EdgeInsets.all(10),
                    child: ListTile(
                      title: Text(
                        _items[index],
                        style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      trailing: IconButton(
                        onPressed: () => remove(index),
                        icon: const Icon(Icons.delete_forever),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
''';
  String animatedListPractice = '''
import 'dart:async';

import 'package:flutter/material.dart';

class Flutter08PracticeAnimatedList extends StatefulWidget {
  const Flutter08PracticeAnimatedList({super.key});

  @override
  State<Flutter08PracticeAnimatedList> createState() =>
      _Flutter08PracticeAnimatedListState();
}

class _Flutter08PracticeAnimatedListState
    extends State<Flutter08PracticeAnimatedList> {
  final _items = [];
  final GlobalKey<AnimatedListState> _key = GlobalKey();
  Timer? timer;
  @override
  void initState() {
    startTimer();
    super.initState();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_items.length >= 10) {
        timer.cancel();
      } else {
        addItems();
      }
    });
  }

  void addItems() {
    _items.insert(0, "Item \${_items.length + 1}");
    _key.currentState!.insertItem(
      0,
      duration: const Duration(seconds: 2),
    );
  }

  void removeItem(int index) {
    _key.currentState!.removeItem(
      index,
      (context, animation) {
        return SizeTransition(
          sizeFactor: animation,
          child: const Card(
            color: Colors.red,
            child: ListTile(
              title: Text("Deleted"),
            ),
          ),
        );
      },
      duration: const Duration(seconds: 2),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Practice animated list"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            AnimatedList(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              key: _key,
              itemBuilder: (context, index, animation) {
                return SizeTransition(
                  sizeFactor: animation,
                  child: Card(
                    color: Colors.cyanAccent,
                    child: ListTile(
                      title: Text(
                        _items[index],
                        style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                      leading: Badge(
                        label: Text(
                          index.toString(),
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        child: const Icon(
                          Icons.blur_circular_rounded,
                          color: Colors.black,
                        ),
                      ),
                      trailing: IconButton(
                        onPressed: () => removeItem(index),
                        icon: const Icon(
                          Icons.delete_forever_outlined,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
''';
}
