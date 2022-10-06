import 'package:chat_bot/pages/login_pages.dart';
import 'package:chat_bot/pages/splashscreen.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: MaterialApp(
        title: 'JawaBot',
        theme: ThemeData(
          primarySwatch: Colors.blueGrey,
          appBarTheme: const AppBarTheme(
            elevation: 0, // This removes the shadow from all App Bars.
          ),
          backgroundColor: Colors.transparent,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
