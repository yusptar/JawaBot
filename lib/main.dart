import 'package:chat_bot/pages/splashscreen.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UcupBot',
      theme: ThemeData(brightness: Brightness.dark),
      home: const SplashScreen(),
    );
  }
}
