import 'package:flutter/material.dart';
import 'package:flutter_advance/18_dark_light_theme_provider/themes/dark_theme.dart';
import 'package:flutter_advance/18_dark_light_theme_provider/themes/light_theme.dart';

/*
A class that can be extended or mixed in that provides a change notification API 
using [VoidCallback] for notifications.It is O(1) for adding listeners and O(N)
 for removing listeners and dispatching notifications (where N is the number of 
 listeners).
 */
class ThemeProvider extends ChangeNotifier {
//initaily dark theme
  ThemeData _themeData = darkTheme;
//geter
  ThemeData get themeData => _themeData;
  //check for ligght theme
  bool get isLight => _themeData == lightTheme;
//if not then set
  set themeData(ThemeData newThemeData) {
    _themeData = newThemeData;
    /*
    Call all the registered listeners.Call this method whenever the object changes,
     to notify any clients the object may have changed. Listeners that are added 
     during this iteration will not be visited. Listeners that are removed during
      this iteration will not be visited after they are removed.
     */
    notifyListeners();
  }

//toggle theme
  void togleTheme() {
    if (_themeData == darkTheme) {
      themeData = lightTheme;
    } else {
      themeData = darkTheme;
    }
    /*
    Call all the registered listeners.Call this method whenever the object changes,
     to notify any clients the object may have changed. Listeners that are added 
     during this iteration will not be visited. Listeners that are removed during 
     this iteration will not be visited after they are removed.
     */
    notifyListeners();
  }
}
