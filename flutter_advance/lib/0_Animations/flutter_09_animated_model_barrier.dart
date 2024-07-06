import 'package:flutter/material.dart';
import 'package:flutter_advance/utils/code_display.dart';
import 'package:flutter_advance/utils/codes/my_codes.dart';

class Flutter09AnimatedModelBarrier extends StatefulWidget {
  const Flutter09AnimatedModelBarrier({super.key});

  @override
  State<Flutter09AnimatedModelBarrier> createState() =>
      _Flutter09AnimatedModelBarrierState();
}

/*
Provides a single [Ticker] that is configured to only tick while the current tree is enabled, as defined by [TickerMode].
To create the [AnimationController] in a [State] that only uses a single [AnimationController], mix in this class, then pass vsync: this to the animation controller constructor.
This mixin only supports vending a single ticker. If you might have multiple [AnimationController] objects over the lifetime of the [State], use a full [TickerProviderStateMixin] instead.
 */
class _Flutter09AnimatedModelBarrierState
    extends State<Flutter09AnimatedModelBarrier>
    with SingleTickerProviderStateMixin {
  //for press
  bool isPressed = false;
  //defining widget animation and its color.
  late Widget animatedModalBarrier;
  late AnimationController animationController;
  late Animation<Color?> animationColor;
  @override
  void initState() {
    //An interpolation between two colors.(instance of color tween)
    ColorTween colorTween = ColorTween(
      /*
      The [begin] and [end] properties may be **null; the null value is treated as transparent.
We recommend that you do not pass [Colors.transparent] as [begin] or [end] if you want the 
effect of fading in or out of transparent. Instead prefer null. [Colors.transparent] refers to 
black transparent and thus will fade out of or into black which is likely unwanted.
       */
      begin: Colors.orangeAccent.withOpacity(0.5),
      end: Colors.blueGrey.withOpacity(0.5),
    );
    //inilalize controller
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );
    //using color tween for animated controller
    animationColor = colorTween.animate(
        animationController); /*Returns a new [Animation] that is driven by the given animation but that takes on values determined by this object.
                              Essentially this returns an [Animation] that automatically applies the [evaluate] method to the parent's value. */
    //now initalize animated barrier
    animatedModalBarrier = AnimatedModalBarrier(
      color: animationColor,
      //dismissible-Whether touching the barrier will pop the current route off the [Navigator].
      dismissible: true,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("animated model barrier"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Container(
                color: Colors.white24,
                width: 250,
                height: 250,
                child: Center(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      //text
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Text(isPressed ? "Pressed" : "not pressed"),
                      ),
                      // and then use animatedModalBarrier which make button unclickable for 3 secound after once click

                      if (isPressed) animatedModalBarrier,
                      //button
                      Align(
                        alignment: Alignment.center,
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              isPressed = true;
                            });
                            //Sets the controller's value to [lowerBound], stopping the animation (if in progress), and resetting to its beginning point, or dismissed state.
                            animationController.reset();
                            //Starts running this animation forwards (towards the end).Returns a [TickerFuture] that completes when the animation is complete.
                            animationController.forward();
                            //Creates a future that runs its computation after a delay.
                            Future.delayed(const Duration(seconds: 3), () {
                              setState(() {
                                isPressed = false;
                              });
                            });
                          },
                          child: const Text("Press me"),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              CodeDisplay(text: MyCodes().animatedModelBarrier)
            ],
          ),
        ),
      ),
    );
  }
}
