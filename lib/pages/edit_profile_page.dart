import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../widgets/alert/alert_update_profile.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({
    super.key,
    this.name,
    this.email,
    this.status,
    this.bio,
  });
  final String? name;
  final String? email;
  final String? status;
  final String? bio;

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController statusController = TextEditingController();
  TextEditingController bioController = TextEditingController();

  String? name;
  String? email;
  String? status;
  String? bio;

  @override
  void initState() {
    super.initState();

    name = widget.name;
    email = widget.email;
    status = widget.status;
    bio = widget.bio;

    nameController = TextEditingController(text: widget.name);
    emailController = TextEditingController(text: widget.email);
    statusController = TextEditingController(text: widget.status);
    bioController = TextEditingController(text: widget.bio);
  }

  void updateUser() {
    final docUser = FirebaseFirestore.instance
        .collection('users')
        .doc('joO85FtgqNPJrH8DWXQB');

    docUser.update({
      'name': nameController.text,
      'status': statusController.text,
      'bio': bioController.text,
    });
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
                  controller: nameController,
                  onChanged: (String n) {
                    setState(() {
                      name = n;
                    });
                  },
                  decoration: InputDecoration(
                    labelText: 'Name',
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
                  controller: emailController,
                  readOnly: true,
                  onChanged: (String e) {
                    setState(() {
                      email = e;
                    });
                  },
                  decoration: InputDecoration(
                    labelText: 'Email',
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
                  controller: statusController,
                  autofocus: false,
                  onChanged: (String s) {
                    setState(() {
                      status = s;
                    });
                  },
                  decoration: InputDecoration(
                    labelText: 'Status',
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
                  controller: bioController,
                  autofocus: false,
                  maxLines: 3,
                  onChanged: (String b) {
                    setState(() {
                      bio = b;
                    });
                  },
                  decoration: InputDecoration(
                    labelText: 'Bio',
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
                    updateUser();
                    AlertUpdateProfile(context);
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
