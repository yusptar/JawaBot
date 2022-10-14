import 'package:chat_bot/services/sign_in_service.dart';
import 'package:flutter/material.dart';
import 'package:chat_bot/widgets/alert/alert_logout.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int counter = 0;
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
                flex: 4,
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(

                      /*gradient: LinearGradient(
                      begin: Alignment(0.0, -1.0),
                      end: Alignment(0.0, 0.6),
                      colors: <Color>[
                        Color.fromARGB(255, 255, 4, 0),
                        Color.fromARGB(255, 255, 4, 0),
                        Color.fromARGB(255, 255, 255, 255),
                        Color.fromARGB(255, 255, 255, 255),
                      ],
                    ),*/
                      ),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 65.0,
                      ),
                      CircleAvatar(
                        radius: 65.0,
                        backgroundImage: NetworkImage(image!),
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      Text(
                        name!,
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
                          "Sign Out",
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
                        onPressed: () => AlertLogOut(context),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  color: Colors.grey[200],
                  child: Center(
                    child: Card(
                      child: Container(
                        margin: const EdgeInsets.all(10),
                        width: 310.0,
                        height: 100.0,
                        child: ListView(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Icon(
                                  FontAwesomeIcons.circleUser,
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
                                      name!,
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
                                  Icons.email_outlined,
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
                                      email!,
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
