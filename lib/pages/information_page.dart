import 'package:flutter/material.dart';

class InformationPage extends StatefulWidget {
  const InformationPage({Key? key}) : super(key: key);

  @override
  State<InformationPage> createState() => _InformationPageState();
}

class _InformationPageState extends State<InformationPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          margin: const EdgeInsets.fromLTRB(16, 24, 16, 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'Informasi Sejarah Pulau Jawa',
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
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(5),
                            topRight: Radius.circular(5)),
                        image: DecorationImage(
                            image: NetworkImage(
                                'https://mmc.tirto.id/image/otf/880x495/2022/02/14/peta-pulau-jawa-istock_ratio-16x9.jpg'),
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  child: Row(
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Sejarah Pulau Jawa',
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
          ),
      ],
    );
  }
}
