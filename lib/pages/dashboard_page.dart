import 'package:flutter/material.dart';
import 'package:chat_bot/pages/login_pages.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        actions: [
          Container(
            margin: const EdgeInsets.all(10),
            child: const CircleAvatar(
              radius: 18,
              backgroundImage: AssetImage(
                'assets/robot-no-bg.png',
              ),
              backgroundColor: Colors.white,
            ),
          )
        ],
      ),
      drawer: Drawer(
        elevation: 5.0,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.grey,
                image: DecorationImage(
                  image: NetworkImage(
                      'https://mmc.tirto.id/image/otf/880x495/2022/02/14/peta-pulau-jawa-istock_ratio-16x9.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  Container(
                    child: const CircleAvatar(
                      radius: 18,
                      backgroundImage: AssetImage(
                        'assets/robot-no-bg.png',
                      ),
                      backgroundColor: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    child: const Text(
                      'Hi!',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              title: const Text("MAIN MENU"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text("Home"),
              onTap: () {
                MaterialPageRoute route =
                    MaterialPageRoute(builder: (_) => HomePage());
                Navigator.push(context, route);
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text("Log Out"),
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
          ],
        ),
      ),
      body: Container(
        child: ListView(
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(16, 24, 16, 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Recommended for you',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
            for (int i = 0; i < 5; i++)
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: const Color(0xFFE6E6E6)),
                ),
                child: Column(
                  children: <Widget>[
                    Stack(
                      children: <Widget>[
                        Container(
                          height: 160,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(5),
                                topRight: Radius.circular(5)),
                            image: DecorationImage(
                                image: AssetImage(
                                    'assets/images/background$i.jpg'),
                                fit: BoxFit.cover),
                          ),
                        ),
                        Positioned(
                          right: 16,
                          top: 16,
                          child: Container(
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: const Color(0xFF7D59EE),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: const Text('9.1'),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 8),
                      child: Row(
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                'Iceland - 6D 5N',
                                style: TextStyle(color: Color(0xFF2A2A2A)),
                              ),
                              SizedBox(height: 3),
                              Text(
                                'Complete Guided Tour',
                                style: TextStyle(
                                    color: Color(0xFFA9A9BA), fontSize: 11.5),
                              ),
                            ],
                          ),
                          const Spacer(),
                          const Text(
                            '\$2,250',
                            style: TextStyle(
                                color: Color(0xFF2A2A2A),
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
          ],
        ),
      ),
    );
  }
}
