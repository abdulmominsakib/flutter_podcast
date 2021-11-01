import 'package:flutter/material.dart';
import 'views/root.dart';
import 'views/themes/themes.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/route_manager.dart';
import 'controllers/setting/settings_controller.dart';

void main() {
  runApp(FlutterPodcastAudioApp());
  Get.put(SettingsController());
}

/// This is just an app made for fun to do test with audio
/// This Architecture is used for small-medium sized app,
/// if you want to make something bigger you can use getXpattern with getX
///
class FlutterPodcastAudioApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Podcast App Demo',
      theme: AppThemes.lightTheme,
      home: AppRoot(),
      enableLog: false,
    );
  }
}
