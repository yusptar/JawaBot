import 'package:chat_bot/main.dart';
import 'package:email_validator/email_validator.dart';
import 'package:chat_bot/widgets/alert/alert_register_failure.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:chat_bot/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RegisPage extends StatefulWidget {
  final Function() onClickedSignIn;
  const RegisPage({Key? key, required this.onClickedSignIn}) : super(key: key);

  @override
  State<RegisPage> createState() => _RegisPage();
}

class _RegisPage extends State<RegisPage> {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool passwordHidden = true;
  bool isChecked = false;

  // Show & Hide Password Method
  void _showPassword() {
    setState(() {
      passwordHidden = !passwordHidden;
    });
  }

  // Store to Firebase Method
  Future signUp(Users user) async {
    // Form Validation
    final isValid = formKey.currentState!.validate();
    if (!isValid) return;

    // Loading Dialog
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(child: CircularProgressIndicator()),
    );
    try {
      // Store user to Firebase Firestore
      final docUser = FirebaseFirestore.instance.collection('users').doc();
      user.id = docUser.id;

      final json = user.toJson();
      await docUser.set(json);

      // Store to Firebase Authentication
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
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
        child: Center(
          child: ListView(
            padding: const EdgeInsets.only(
                left: 24, right: 24, top: 80, bottom: 150),
            children: [
              Container(
                margin: const EdgeInsets.only(top: 100),
                child: const Text(
                  'Sign Up',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 50, bottom: 10),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  controller: nameController,
                  autofocus: false,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    hintText: 'Name',
                    contentPadding:
                        const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 10),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  controller: emailController,
                  autofocus: false,
                  textInputAction: TextInputAction.next,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (email) =>
                      email != null && !EmailValidator.validate(email)
                          ? 'Masukkan email dengan benar'
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
                  textInputAction: TextInputAction.next,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (password) =>
                      password != null && password.length < 6
                          ? 'Masukkan password minimal 6 karakter'
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
                    text: 'Sudah mempunyai akun? ',
                    style: const TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                    children: [
                      TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = widget.onClickedSignIn,
                        text: 'Log In',
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
                    "Sign Up",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {
                    if (emailController.text.isNotEmpty &&
                        passwordController.text.isNotEmpty) {
                      final user = Users(
                        name: nameController.text,
                        email: emailController.text,
                        password: passwordController.text,
                        status: 'Not Set',
                        bio: 'Not Set',
                      );
                      signUp(user);
                    } else {
                      AlertRegisterFailure(context);
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
