import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_application_1/screens/to_do_page.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;

import '../constants/constans.dart';
import '../widgets/coursera_card.dart';
import '../widgets/text_manager.dart';
import 'main_screen.dart';

class CourseraPage extends StatefulWidget {
  const CourseraPage({super.key});

  @override
  State<CourseraPage> createState() => _CourseraPageState();
}

class _CourseraPageState extends State<CourseraPage> {
  Future<void> sendMessageToSlackBot(
      String message, String botToken, String channel) async {
    final response = await http.post(
      Uri.parse('https://slack.com/api/chat.postMessage'),
      headers: {
        'Content-Type': 'application/json; charset=utf-8',
        'Authorization': 'Bearer $botToken',
      },
      body: '{ "text": "$message", "channel": "$channel" }',
    );
    if (response.statusCode == 200) {
      print('Message sent successfully');
    } else {
      print('Failed to send message: ${response.statusCode}');
    }
  }

  @override
  Color color = Colors.grey;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          openDialog();
          await sendMessageToSlackBot(
            'Ödevimi değerlendirir misiniz ? \n İrem Pekkıyak \n https://www.coursera.org/learn/bitirme-projesi ',
            'API_KEY',
            '#random',
          );
        },
        child: Icon(
          Icons.add,
          size: 30,
        ),
        backgroundColor: kGoogleBlue,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            AppBar(
              backgroundColor: kGoogleBlue,
              elevation: 0,
              toolbarHeight: 50,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  TextManager(
                    message: 'Coursera Ödev Linkleri',
                  )
                ],
              ),
            ),
            CourseraCard(
              namesurname: 'Irem Pekkıyak',
              link: 'https://www.coursera.org/learn/bitirme-projesi',
              modulAdi:
                  'Peer-graded Assignment: Etkinlik: Değerlendirme bulgularını sunun',
              backgroundColor: kGoogleBlue,
            ),
            CourseraCard(
              namesurname: 'Irem Pekkıyak',
              link: 'https://www.coursera.org/learn/bitirme-projesi',
              modulAdi:
                  'Peer-graded Assignment: Etkinlik: Değerlendirme bulgularını sunun',
              backgroundColor: kGoogleBlue,
            ),
            CourseraCard(
              namesurname: 'Irem Pekkıyak',
              link: 'https://www.coursera.org/learn/bitirme-projesi',
              modulAdi:
                  'Peer-graded Assignment: Etkinlik: Değerlendirme bulgularını sunun',
              backgroundColor: kGoogleBlue,
            ),
            CourseraCard(
              namesurname: 'Irem Pekkıyak',
              link: 'https://www.coursera.org/learn/bitirme-projesi',
              modulAdi:
                  'Peer-graded Assignment: Etkinlik: Değerlendirme bulgularını sunun',
              backgroundColor: kGoogleBlue,
            ),
          ],
        ),
      ),
    );
  }

  Future openDialog() => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: TextField(
            decoration: InputDecoration(hintText: 'İsim Soyisim'),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                //Text('Modül İsmini, kaçıncı haftada olduğunu belirtiniz.'),
                TextField(
                  decoration: InputDecoration(hintText: 'Dersin Adı'),
                ),
                SizedBox(
                  height: 15,
                ),
                // Text('Coursera Linkini Girin.'),
                TextField(
                  decoration: InputDecoration(hintText: 'Ödev Linkini'),
                ),
              ],
            ),
          ),

          //TextField(decoration: InputDecoration(hintText: 'Coursera Linkini Girin'),),
          actions: [
            TextButton(
                onPressed: () => Navigator.pop(context), child: Text('Cancel')),
            TextButton(
                onPressed: () => Navigator.pop(context), child: Text('Save'))
          ],
          elevation: 10.0, shadowColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      );
}
