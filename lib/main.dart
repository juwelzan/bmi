import 'package:bmi/screens/home_screen.dart';
import 'package:bmi/screens/output_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() {
  runApp(
    ScreenUtilInit(
      ensureScreenSize: true,
      minTextAdapt: true,
      builder: (context, child) => MyApp(),
      designSize: Size(360, 690),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "home",
      routes: {
        "home": (context) => HomeScreen(),
        "/output": (context) => OutputScreen(),
      },
    );
  }
}
