import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/route_manager.dart';

import '../../../consts/app_colors.dart';
import '../../../consts/app_defaults.dart';
import '../../../controllers/setting/settings_controller.dart';

class AppEntryPoint extends StatelessWidget {
  const AppEntryPoint({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Container(
          child: Stack(
            children: [
              GetBuilder<SettingsController>(
                initState: (val) {},
                builder: (controller) => PageTransitionSwitcher(
                  duration: AppDefaults.defaultDuration,
                  transitionBuilder: (child, animation, secondAnimation) {
                    return SharedAxisTransition(
                      child: child,
                      animation: animation,
                      secondaryAnimation: secondAnimation,
                      transitionType: SharedAxisTransitionType.horizontal,
                    );
                  },
                  child: controller.currentSelectedPage(),
                ),
              ),
              // Navigation Bar
              Positioned(
                bottom: 0,
                child: _CustomNavigationBar(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CustomNavigationBar extends StatelessWidget {
  /// Bottom Navigation Bar,
  /// Because we are going to use this a top
  const _CustomNavigationBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      decoration: BoxDecoration(
        color: AppColors.BLACK.withOpacity(0.8),
        borderRadius: AppDefaults.defaultBottomSheetRadius,
      ),
      child: GetBuilder<SettingsController>(
        builder: (controller) {
          return Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _MenuIcon(
                  iconData: FeatherIcons.home,
                  isActive: controller.currentIndex == 0,
                  onTap: () {
                    controller.changeHomeMenu(0);
                  },
                ),
                _MenuIcon(
                  iconData: FeatherIcons.grid,
                  isActive: controller.currentIndex == 1,
                  onTap: () {
                    controller.changeHomeMenu(1);
                  },
                ),
                _MenuIcon(
                  iconData: FeatherIcons.bookmark,
                  isActive: controller.currentIndex == 2,
                  onTap: () {
                    controller.changeHomeMenu(2);
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _MenuIcon extends StatelessWidget {
  const _MenuIcon({
    Key? key,
    required this.isActive,
    required this.iconData,
    required this.onTap,
  }) : super(key: key);

  final bool isActive;
  final IconData iconData;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Icon(
        iconData,
        color: isActive ? Colors.white : Colors.grey,
        size: 30,
      ),
    );
  }
}
