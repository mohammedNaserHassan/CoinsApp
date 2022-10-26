import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:platform_device_id/platform_device_id.dart';
import 'Constants.dart';
import 'Module/Splash/SplashScreen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    initPlatformState();
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            home: SplashScreen(),
          );
        });
  }

  Future<void> initPlatformState() async {
    String? deviceid;
    try {
      deviceid = await PlatformDeviceId.getDeviceId;
    } on PlatformException {
      deviceid = 'Failed to get deviceId.';
    }
    if (!mounted) return;

    setState(() {
      deviceId = deviceid ?? '';
    });
  }
}
