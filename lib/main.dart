import 'package:atalup_app/presentation/home_screen.dart';
import 'package:atalup_app/presentation/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // theme: Themes().lightTheme,
      title: 'Alatul',
      debugShowCheckedModeBanner: false,
      home: MaterialApp(
        initialRoute: '/splash',
        routes: {
          '/splash': (context) => SplashScreen(),
          '/home': (context) => HomeScreen(),
        },
        title: 'Alatul',
      ),
    );
  }
}
