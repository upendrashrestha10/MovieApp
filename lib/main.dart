import 'package:flutter/material.dart';
import 'package:movieapp/Screen/splash_screen.dart';
import 'package:movieapp/widgets/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colours.scaffoldBgColor,
        useMaterial3: true,
      ),
      home: SplashScreen(),
    );
  }
}

