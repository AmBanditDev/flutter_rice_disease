import 'package:flutter/material.dart';
import 'package:flutter_rice_disease/screens/splash_screen.dart';
import 'package:flutter_rice_disease/utils.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ตรวจโรคข้าว',
      theme: ThemeData(
        fontFamily: 'NotoSansThai',
        indicatorColor: Colors.black,
        progressIndicatorTheme: ProgressIndicatorThemeData(
          color: firstColor,
          refreshBackgroundColor: Colors.white,
        ),
      ),
      // home: const SearchScreen(),
      home: const SplashScreen(),
    );
  }
}
