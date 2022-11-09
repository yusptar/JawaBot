import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final user = FirebaseAuth.instance.currentUser!;

  String? photoURL;
  String? displayName;
  String? email;

  final TextEditingController _statusController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();

  Future<void> _addStatus() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      prefs.setString('status', _statusController.text);
    });
  }

  Future<void> _loadStatus() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _statusController.text = (prefs.getString('status') ?? '');
    });
  }

  Future<void> _addBio() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      prefs.setString('bio', _bioController.text);
    });
  }

  Future<void> _loadBio() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _bioController.text = (prefs.getString('bio') ?? '');
    });
  }

  @override
  void initState() {
    _loadStatus();
    _loadBio();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff372d3b),
        elevation: 0,
      ),
      body: ListView(
        children: [
          Column(
            children: [
              const SizedBox(
                height: 60,
              ),
              const CircleAvatar(
                radius: 65,
                backgroundImage: AssetImage("assets/images/default.png"),
              ),
              Container(
                margin: const EdgeInsets.only(
                    top: 50, bottom: 10, right: 15, left: 15),
                child: TextFormField(
                  readOnly: true,
                  decoration: InputDecoration(
                    hintText: 'Not Set',
                    contentPadding:
                        const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                    top: 5, bottom: 10, right: 15, left: 15),
                child: TextFormField(
                  readOnly: true,
                  decoration: InputDecoration(
                    hintText: user.email!,
                    contentPadding:
                        const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                    top: 5, bottom: 10, right: 15, left: 15),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  controller: _statusController,
                  autofocus: false,
                  decoration: InputDecoration(
                    labelText: 'Status',
                    hintText: 'student, lecturer, etc..',
                    contentPadding:
                        const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                    bottom: 5, top: 5, right: 15, left: 15),
                child: TextFormField(
                  controller: _bioController,
                  autofocus: false,
                  maxLines: 3,
                  decoration: InputDecoration(
                    labelText: 'Bio',
                    hintText: 'hi im student, ..',
                    contentPadding:
                        const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0)),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                margin: const EdgeInsets.only(right: 100, left: 100),
                decoration: BoxDecoration(
                  color: Colors.black,
                  border: Border.all(color: Colors.black),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(50),
                  ),
                ),
                child: ListTile(
                  title: const Text(
                    "Update",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {
                    _addStatus();
                    _addBio();
                    /*const snackBar = SnackBar(
                      content: Text('Berhasil update.'),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);*/
                  },
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
