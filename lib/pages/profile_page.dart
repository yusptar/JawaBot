import 'package:chat_bot/pages/edit_profile_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final user = FirebaseAuth.instance.currentUser!;
  String? photoURL;
  String? displayName;
  String? email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff372d3b),
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                flex: 3,
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.white,
                        Color.fromARGB(244, 37, 167, 228),
                      ],
                    ),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 50.0,
                      ),
                      const CircleAvatar(
                        radius: 65.0,
                        backgroundImage:
                            AssetImage("assets/images/default.png"),
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      Text(
                        user.email!,
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      ElevatedButton(
                        // ignore: sort_child_properties_last
                        child: const Text(
                          "Edit Profile",
                          style: TextStyle(fontSize: 12),
                        ),
                        style: ButtonStyle(
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.black),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              side: BorderSide(color: Colors.white),
                            ),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return const EditProfilePage();
                              },
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  color: Colors.grey[200],
                  child: Center(
                    child: Card(
                      child: Container(
                        margin: const EdgeInsets.all(10),
                        width: 310.0,
                        height: 200.0,
                        child: ListView(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Icon(
                                  FontAwesomeIcons.solidCircleUser,
                                  color: Colors.black,
                                  size: 30,
                                ),
                                const SizedBox(
                                  width: 20.0,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Name",
                                      style: TextStyle(
                                        fontSize: 15.0,
                                      ),
                                    ),
                                    Text(
                                      'Not Set',
                                      style: TextStyle(
                                        fontSize: 12.0,
                                        color: Colors.grey[400],
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Icon(
                                  Icons.email_rounded,
                                  color: Colors.black,
                                  size: 30,
                                ),
                                const SizedBox(
                                  width: 20.0,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "E-mail",
                                      style: TextStyle(
                                        fontSize: 15.0,
                                      ),
                                    ),
                                    Text(
                                      user.email!,
                                      style: TextStyle(
                                        fontSize: 12.0,
                                        color: Colors.grey[400],
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Icon(
                                  FontAwesomeIcons.userGroup,
                                  color: Colors.black,
                                  size: 30,
                                ),
                                const SizedBox(
                                  width: 20.0,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Status",
                                      style: TextStyle(
                                        fontSize: 15.0,
                                      ),
                                    ),
                                    Text(
                                      "Not Set",
                                      style: TextStyle(
                                        fontSize: 12.0,
                                        color: Colors.grey[400],
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Icon(
                                  FontAwesomeIcons.userTag,
                                  color: Colors.black,
                                  size: 30,
                                ),
                                const SizedBox(
                                  width: 20.0,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Bio",
                                      style: TextStyle(
                                        fontSize: 15.0,
                                      ),
                                    ),
                                    Text(
                                      "Not Set",
                                      style: TextStyle(
                                        fontSize: 12.0,
                                        color: Colors.grey[400],
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
