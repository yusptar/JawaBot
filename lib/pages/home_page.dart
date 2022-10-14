import 'package:flutter/material.dart';
import 'package:chat_bot/widgets/background/paralax_bg.dart';
import 'package:chat_bot/services/sign_in_service.dart';
import 'package:chat_bot/widgets/alert/alert_logout.dart';
import 'package:chat_bot/pages/help_center_page.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double topEleven = 0;
  double topTen = 0;
  double topNine = 0;
  double topEight = 0;
  double topSeven = 0;
  double topSix = 0;
  double topFive = 0;
  double topFour = 0;
  double topThree = 0;
  double topTwo = 0;
  double topOne = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.black.withOpacity(0.1),
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
        actions: [
          Container(
            margin: const EdgeInsets.all(10),
            child: CircleAvatar(
              backgroundImage: NetworkImage(image!),
            ),
          )
        ],
      ),
      drawer: Drawer(
        elevation: 16.0,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.white,
                image: DecorationImage(
                  image: AssetImage('assets/logo/robot-no-bg.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                margin: const EdgeInsets.only(top: 100),
                child: const Text(
                  "Hi !",
                  style: TextStyle(fontWeight: FontWeight.w800, fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.help_outline_outlined),
              title: const Text("Help Center"),
              onTap: () {
                MaterialPageRoute route =
                    MaterialPageRoute(builder: (_) => const HelpCenterPage());
                Navigator.push(context, route);
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text("Log Out"),
              onTap: () {
                signOutGoogle();
                AlertLogOut(context);
              },
            ),
          ],
        ),
      ),
      body: NotificationListener(
        onNotification: (notif) {
          if (notif is ScrollUpdateNotification) {
            if (notif.scrollDelta == null) return true;
            setState(() {
              topEleven -= notif.scrollDelta! / 2.0;
              topTen -= notif.scrollDelta! / 1.9;
              topNine -= notif.scrollDelta! / 1.8;
              topEight -= notif.scrollDelta! / 1.7;
              topSeven -= notif.scrollDelta! / 1.6;
              topSix -= notif.scrollDelta! / 1.5;
              topFive -= notif.scrollDelta! / 1.4;
              topFour -= notif.scrollDelta! / 1.3;
              topThree -= notif.scrollDelta! / 1.2;
              topTwo -= notif.scrollDelta! / 1.2;
              topOne -= notif.scrollDelta! / 1;
            });
          }
          return true;
        },
        child: Stack(
          children: [
            ParalaxBackground(
              top: topEleven,
              asset: "assets/background/sky-bird.png",
            ),
            ParalaxBackground(
              top: topTen,
              asset: "assets/logo/circle-jawa-bot.png",
            ),
            ParalaxBackground(
              top: topNine,
              asset: "assets/background/borobudur-temple.png",
            ),
            ParalaxBackground(
              top: topEight,
              asset: "assets/background/top-paralax-8.png",
            ),
            ParalaxBackground(
              top: topSeven,
              asset: "assets/background/top-paralax-7.png",
            ),
            ParalaxBackground(
              top: topSix,
              asset: "assets/background/top-paralax-6.png",
            ),
            ParalaxBackground(
              top: topFive,
              asset: "assets/background/top-paralax-5.png",
            ),
            ParalaxBackground(
              top: topFour,
              asset: "assets/background/top-paralax-4.png",
            ),
            ParalaxBackground(
              top: topThree,
              asset: "assets/background/top-paralax-3.png",
            ),
            ParalaxBackground(
              top: topTwo,
              asset: "assets/background/top-paralax-2.png",
            ),
            ParalaxBackground(
              top: topOne,
              asset: "assets/background/top-paralax-1.png",
            ),
            SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              child: Column(
                children: [
                  const SizedBox(
                    height: 480,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    color: const Color(0xff372d3b),
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 300, bottom: 20),
                          child: const CircleAvatar(
                            radius: 40,
                            backgroundImage:
                                AssetImage("assets/logo/robot-bg.png"),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(bottom: 5),
                          child: Text(
                            "Introduction",
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall
                                ?.copyWith(color: Colors.white),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                              top: 20, right: 20, left: 20),
                          child: Text(
                            "JawaBot merupakan aplikasi edukasi sejarah yang berfokus pada sejarah pulau jawa, dengan fitur unik berupa chatbot yang digunakan untuk tanya jawab seputar sejarah pulau jawa.",
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1
                                ?.copyWith(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    color: const Color(0xff372d3b),
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        Container(
                          height: 100,
                          width: 330,
                          margin: const EdgeInsets.only(top: 150, bottom: 20),
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image:
                                  AssetImage("assets/images/jawa-island.png"),
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(bottom: 5),
                          child: Text(
                            "History of Java Island",
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall
                                ?.copyWith(color: Colors.white),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                              top: 20, right: 20, left: 20),
                          child: Text(
                            "Jawa adalah sebuah pulau di Indonesia yang terletak di kepulauan Sunda Besar dan merupakan pulau terluas ke-13 di dunia. Jumlah penduduk di Pulau Jawa sekitar 150 juta. "
                            "Jawa adalah pulau yang relatif muda dan sebagian besar terbentuk dari aktivitas vulkanik. Deretan gunung-gunung berapi membentuk jajaran yang terbentang dari timur hingga barat pulau ini, dengan dataran endapan aluvial sungai di bagian utara. Pulau Jawa dipisahkan oleh selat dengan beberapa pulau utama, yakni Pulau Sumatra di barat laut, Pulau Kalimantan di utara, Pulau Madura di timur laut, dan Pulau Bali di sebelah timur. Sementara itu di sebelah selatan pulau Jawa terbentang Samudra Hindia.",
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1
                                ?.copyWith(color: Colors.white),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                              top: 20, right: 20, left: 20),
                          child: InkWell(
                            child: Text(
                              "Sumber : id.wikipedia.org/wiki/jawa",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  ?.copyWith(color: Colors.white),
                            ),
                            onTap: () {},
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
