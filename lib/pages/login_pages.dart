import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        // key: formKey,
        child: Center(
          child: ListView(
            padding: const EdgeInsets.only(left: 24, right: 24, top: 250),
            children: [
              Container(
                margin: const EdgeInsets.only(top: 5, bottom: 10),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  // controller: usernameController,
                  autofocus: false,
                  decoration: InputDecoration(
                    hintText: 'E-mail',
                    contentPadding:
                        const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0)),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 5),
                child: TextFormField(
                  // controller: passwordController,
                  autofocus: false,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Password',
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
                    'Create an Account',
                    style: TextStyle(color: Colors.black),
                  ),
                  onPressed: () {},
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
                  onTap: () {},
                ),
              ),
              Container(
                margin: const EdgeInsets.all(10),
                child: TextButton(
                  child: const Text(
                    'Forgot Your Password',
                    style: TextStyle(color: Colors.black),
                  ),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
