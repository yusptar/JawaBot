import 'package:chat_bot/main.dart';
import 'package:chat_bot/pages/dashboard_page.dart';
import 'package:chat_bot/widgets/alert/alert_login.dart';
import 'package:chat_bot/widgets/alert/alert_login_failure.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:chat_bot/services/sign_in_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  final VoidCallback onClickedSignUp;

  const LoginPage({
    Key? key,
    required this.onClickedSignUp,
  }) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool passwordHidden = true;

  void _showPassword() {
    setState(() {
      passwordHidden = !passwordHidden;
    });
  }

  Future signIn() async {
    final isValid = formKey.currentState!.validate();
    if (!isValid) return;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(child: CircularProgressIndicator()),
    );
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
    } on FirebaseAuthException catch (e) {
      return e;
    }
    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
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
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (email) =>
                    email != null && !EmailValidator.validate(email)
                        ? 'Enter a valid email'
                        : null,
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
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (password) => password != null && password.length < 6
                    ? 'Enter min. 6 characters'
                    : null,
                decoration: InputDecoration(
                  hintText: 'Password',
                  suffixIcon: TextButton(
                    onPressed: () {
                      _showPassword();
                    },
                    child: (passwordHidden)
                        ? const Text(
                            'Show',
                            style: TextStyle(color: Colors.black),
                          )
                        : const Text(
                            'Hide',
                            style: TextStyle(color: Colors.black),
                          ),
                  ),
                  contentPadding:
                      const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0)),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(20),
              alignment: Alignment.center,
              child: RichText(
                text: TextSpan(
                  text: 'Belum mempunyai akun? ',
                  style: const TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                  children: [
                    TextSpan(
                      recognizer: TapGestureRecognizer()
                        ..onTap = widget.onClickedSignUp,
                      text: 'Daftar',
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                  ],
                ),
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
                    signIn();
                  } else {
                    AlertLoginFailure(context);
                  }
                },
              ),
            ),
            const SizedBox(
              height: 60,
            ),
            Row(
              children: [
                const Expanded(
                  child: Divider(
                    thickness: 0.5,
                    color: Colors.black,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  child: const Text(
                    'Or Log In with',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
                const Expanded(
                  child: Divider(
                    thickness: 0.5,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            IconButton(
              onPressed: () {
                signInWithGoogle().then(
                  (result) {
                    if (result != null) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return const DashboardPage();
                          },
                        ),
                      );
                      AlertLoginSucces(context);
                    }
                  },
                );
              },
              icon: Image.asset('assets/logo/google_logo.png'),
            ),
          ],
        ),
      ),
    );
  }
}
