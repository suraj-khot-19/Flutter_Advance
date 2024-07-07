import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advance/18_dark_light_theme_provider/theme_provider.dart';
import 'package:flutter_advance/utils/code_display.dart';
import 'package:flutter_advance/utils/codes/my_codes.dart';
import 'package:provider/provider.dart';

class DarkLightThemeProvider extends StatefulWidget {
  const DarkLightThemeProvider({super.key});

  @override
  State<DarkLightThemeProvider> createState() => _DarkLightThemeProviderState();
}

class _DarkLightThemeProviderState extends State<DarkLightThemeProvider> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: const Text("Provider"),
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Center(
                child: Column(
                  children: [
                    Container(
                      height: 200,
                      width: 200,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    const SizedBox(height: 50),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          Provider.of<ThemeProvider>(context, listen: false)
                                      .isLight ==
                                  true
                              ? "Light Theme"
                              : "dark theme",
                        ),
                        CupertinoSwitch(
                          value:
                              Provider.of<ThemeProvider>(context, listen: false)
                                  .isLight,
                          onChanged: (value) {
                            Provider.of<ThemeProvider>(context, listen: false)
                                .togleTheme();
                          },
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            const Text("Main.dart"),
            CodeDisplay(text: MyCodes().theme3),
            const Text("lightTheme.dart"),
            CodeDisplay(text: MyCodes().theme1),
            const Text("darkTheme.dart"),
            CodeDisplay(text: MyCodes().theme2),
            const Text("DarkLightThemeProvider.dart"),
            CodeDisplay(text: MyCodes().theme4),
          ],
        ),
      ),
    );
  }
}
