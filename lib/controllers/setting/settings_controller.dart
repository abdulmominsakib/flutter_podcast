import 'package:flutter/widgets.dart';
import '../../views/pages/04_home/home_screen.dart';
import '../../views/pages/05_explore/explore_screen.dart';
import '../../views/pages/06_library/library_screen.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class SettingsController extends GetxController {
  /* <---- Entry Point Screen Navigation ----> */
  /// Used For EntryPoint in Views
  int currentIndex = 0;
  changeHomeMenu(int index) {
    currentIndex = index;
    update();
  }

  /// Decides Which Page to return based on the nav index
  Widget currentSelectedPage() {
    if (currentIndex == 0) {
      return HomeScreen();
    } else if (currentIndex == 1) {
      return ExploreScreen();
    } else if (currentIndex == 2) {
      return LibraryScreen();
    } else {
      return HomeScreen();
    }
  }
}
