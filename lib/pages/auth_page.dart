import 'package:chat_bot/pages/login_pages.dart';
import 'package:chat_bot/pages/regis_pages.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool isLogin = true;

  @override
  Widget build(BuildContext context) => isLogin
      ? LoginPage(onClickedSignUp: toggle)
      : RegisPage(onClickedSignIn: toggle);
  void toggle() => setState(() => isLogin = !isLogin);
}
