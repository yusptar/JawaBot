import 'package:dialog_flowtter/dialog_flowtter.dart';
import 'package:flutter/material.dart';
import 'package:chat_bot/helper/messages.dart';
import 'package:intl/intl.dart';
import 'package:flutter/foundation.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ucup Chat Bot',
      theme: ThemeData(brightness: Brightness.dark),
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late DialogFlowtter dialogFlowtter;
  final _controller = TextEditingController();

  List<Map<String, dynamic>> messages = [];

  @override
  void initState() {
    DialogFlowtter.fromFile().then((instance) => dialogFlowtter = instance);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const CircleAvatar(
              radius: 18,
              backgroundImage: AssetImage(
                'assets/robot-no-bg.png',
              ),
              backgroundColor: Colors.white,
            ),
            Container(
              padding: const EdgeInsets.all(10.0),
              child: const Text(
                'Ucup Bot',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 12, bottom: 10),
              child: Text(
                "Today, ${DateFormat("Hm").format(DateTime.now())}",
                style: const TextStyle(fontSize: 12),
              ),
            ),
            Expanded(
              child: MessagesScreen(messages: messages),
            ),
            ListTile(
              leading: IconButton(
                icon: const Icon(
                  Icons.camera_alt,
                  color: Colors.greenAccent,
                  size: 35,
                ),
                onPressed: () {},
              ),
              title: Container(
                height: 35,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  color: Color.fromRGBO(220, 220, 220, 1),
                ),
                padding: const EdgeInsets.only(left: 15),
                child: TextFormField(
                  controller: _controller,
                  decoration: const InputDecoration(
                    hintText: "Enter a Message...",
                    hintStyle: TextStyle(color: Colors.black26),
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                  ),
                  style: const TextStyle(fontSize: 16, color: Colors.black),
                  onChanged: (value) {},
                ),
              ),
              trailing: IconButton(
                  icon: const Icon(
                    Icons.send,
                    size: 30.0,
                    color: Colors.greenAccent,
                  ),
                  onPressed: () {
                    sendMessage(_controller.text);
                    _controller.clear();
                  }),
            ),
            const SizedBox(
              height: 15.0,
            )
          ],
        ),
      ),
    );
  }

  Future<void> sendMessage(String text) async {
    if (text.isEmpty) {
      if (kDebugMode) {
        print('Message is empty');
      }
    } else {
      setState(() {
        addMessage(Message(text: DialogText(text: [text])), true);
      });

      DetectIntentResponse response = await dialogFlowtter.detectIntent(
          queryInput: QueryInput(text: TextInput(text: text)));
      if (response.message == null) return;
      setState(() {
        addMessage(response.message!);
      });
    }
  }

  void addMessage(Message message, [bool isUserMessage = false]) {
    messages.add({'message': message, 'isUserMessage': isUserMessage});
  }
}
