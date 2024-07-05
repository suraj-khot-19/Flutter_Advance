import 'package:flutter/material.dart';
import 'package:flutter_advance/utils/code_display.dart';
import 'package:flutter_advance/utils/codes/my_codes.dart';

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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.all(20),
              color: Colors.white24,
              child: Center(
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
                        progress: animationController,
                        //icon is animated icon
                        icon: AnimatedIcons.pause_play,
                        size: 150,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            CodeDisplay(text: MyCodes().animatedList)
          ],
        ),
      ),
    );
  }
}
