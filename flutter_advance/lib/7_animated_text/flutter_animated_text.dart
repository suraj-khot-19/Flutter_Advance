import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advance/utils/code_display.dart';
import 'package:flutter_advance/utils/codes/my_codes.dart';

class FlutterAnimatedText extends StatelessWidget {
  const FlutterAnimatedText({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Animated Text"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.all(50),
              color: Colors.white10,
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
            CodeDisplay(text: MyCodes().animatedText),
          ],
        ),
      ),
    );
  }
}
