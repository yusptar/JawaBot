import 'package:chat_bot/pages/login_pages.dart';
import 'package:flutter/material.dart';

class RegisPage extends StatefulWidget {
  const RegisPage({Key? key}) : super(key: key);

  @override
  State<RegisPage> createState() => _RegisPage();
}

class _RegisPage extends State<RegisPage> {
  bool passwordHidden = true;
  bool isChecked = false;

  void _showPassword() {
    setState(() {
      passwordHidden = !passwordHidden;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        // key: formKey,
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
                  // controller: nameController,
                  autofocus: false,
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
                  // controller: usernameController,
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
                  // controller: passwordController,
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
                child: Row(
                  children: [
                    Checkbox(
                      value: isChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          isChecked = value!;
                        });
                      },
                    ),
                    const Text(
                      'I would like to receive your information',
                    ),
                  ],
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const LoginPage();
                        },
                      ),
                    );
                  },
                ),
              ),
              /* Container(
                margin: const EdgeInsets.all(10),
                child: TextButton(
                  child: const Text(
                    'Forgot Your Password',
                    style: TextStyle(color: Colors.black),
                  ),
                  onPressed: () {},
                ),
              ),*/
            ],
          ),
        ),
      ),
    );
  }
}