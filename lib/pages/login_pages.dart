import 'package:chat_bot/pages/dashboard_page.dart';
import 'package:chat_bot/widgets/alert/alert_login.dart';
import 'package:chat_bot/widgets/alert/alert_login_failure.dart';
import 'package:chat_bot/widgets/alert/alert_wrong_input.dart';
import 'package:flutter/material.dart';
import 'package:chat_bot/pages/regis_pages.dart';
import 'package:chat_bot/services/firebase_service.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool passwordHidden = true;

  void _showPassword() {
    setState(() {
      passwordHidden = !passwordHidden;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        child: ListView(
          padding:
              const EdgeInsets.only(left: 24, right: 24, top: 80, bottom: 150),
          children: [
            Container(
              margin: const EdgeInsets.only(top: 100),
              child: const Text(
                'Log In',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 50, bottom: 10),
              child: TextFormField(
                keyboardType: TextInputType.text,
                controller: emailController,
                autofocus: false,
                decoration: InputDecoration(
                  hintText: 'E-mail',
                  contentPadding:
                      const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 5),
              child: TextFormField(
                controller: passwordController,
                autofocus: false,
                obscureText: passwordHidden,
                decoration: InputDecoration(
                  hintText: 'Password',
                  suffixIcon: TextButton(
                    onPressed: () {
                      _showPassword();
                    },
                    child: (passwordHidden)
                        ? const Text('Show')
                        : const Text('Hide'),
                  ),
                  contentPadding:
                      const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0)),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(5),
              child: TextButton(
                child: const Text(
                  'Create an account',
                  style: TextStyle(color: Colors.black),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const RegisPage();
                      },
                    ),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.black,
                border: Border.all(color: Colors.black),
                borderRadius: const BorderRadius.all(
                  Radius.circular(50),
                ),
              ),
              child: ListTile(
                title: const Text(
                  "Log In",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  if (emailController.text.isNotEmpty &&
                      passwordController.text.isNotEmpty) {
                    signInWithEmail(
                            emailController.text, passwordController.text)
                        .then(
                      (result) {
                        if (result != null) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return const DashboardPage();
                              },
                            ),
                          );
                          AlertLoginSucces(context);
                        } else {
                          AlertWrongInput(context);
                        }
                      },
                    );
                  } else {
                    AlertLoginFailure(context);
                  }
                },
              ),
            ),
            /*Container(
              margin: const EdgeInsets.all(10),
              child: TextButton(
                child: const Text(
                  'Forgot your password ?',
                  style: TextStyle(color: Colors.black),
                ),
                onPressed: () {},
              ),
            ),*/
          ],
        ),
      ),
    );
  }
}
