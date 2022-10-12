import 'package:chat_bot/pages/chat_pages.dart';
import 'package:chat_bot/pages/help_center_page.dart';
import 'package:chat_bot/pages/information_page.dart';
import 'package:chat_bot/pages/profile_page.dart';
import 'package:chat_bot/widgets/alert/alert_logout.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static const List _pages = [
    InformationPage(),
    HelpCenterPage(),
    ProfilePage(),
  ];

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
              radius: 30,
              backgroundImage: AssetImage(
                'assets/robot-no-bg.png',
              ),
              backgroundColor: Colors.white,
            ),
          )
        ],
      ),
      drawer: Drawer(
        elevation: 0,
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
                children: const [
                  SizedBox(height: 20),
                  CircleAvatar(
                    radius: 18,
                    backgroundImage: AssetImage(
                      'assets/robot-no-bg.png',
                    ),
                    backgroundColor: Colors.white,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Hi!',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text("Log Out"),
              onTap: () {
                AlertLogOut(context);
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: _pages.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        elevation: 0,
        selectedFontSize: 12,
        selectedIconTheme: const IconThemeData(color: Colors.black, size: 35),
        selectedItemColor: Colors.black,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.help_rounded),
            label: 'Help Center',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_rounded),
            label: 'Profile',
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.chat_outlined),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return const ChatPage();
              },
            ),
          );
        },
      ),
    );
  }
}
