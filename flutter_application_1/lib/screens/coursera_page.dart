import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/coursera_controller.dart';
import 'package:flutter_application_1/service/auth_service.dart';
import 'package:flutter_application_1/widgets/wave_clipper.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../constants/constans.dart';
import '../widgets/coursera_card.dart';
import '../widgets/text_manager.dart';

class CourseraPage extends StatefulWidget {
  const CourseraPage({super.key});

  @override
  State<CourseraPage> createState() => _CourseraPageState();
}

class _CourseraPageState extends State<CourseraPage> {
  CourseraController courseraController = Get.put(CourseraController());
  AuthService _authService = AuthService();
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
        },
        child: Icon(
          Icons.add,
          size: 30,
        ),
        backgroundColor: kGoogleGreen,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            AppBar(
              title: Text(
                'Coursera Yardımlaşma Platformu',
                style: TextStyle(fontFamily: 'VarelaRound', fontSize: 16),
              ),
              backgroundColor: kGoogleGreen,
              elevation: 0,
              toolbarHeight: 50,
            ),
            MyWaveClipper(
              widget: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Bu kısıma değerlendirilmesini istediğin ödevinin linkini koyabilirsin!\nKoyduğun linkler Slack Botumuz tarafından kanallarda otomatik paylaşılacak.',
                      style: TextStyle(
                          fontFamily: 'VarelaRound',
                          color: Colors.white,
                          fontSize: 13),
                    ),
                  )
                ],
              ),
            ),
            TextManager(message: 'Güncel İlanlar'),
            SizedBox(
              width: Get.width,
              height: Get.height,
              child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('coursera')
                    .snapshots(),
                builder:
                    (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                  if (streamSnapshot.hasData) {
                    return ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: streamSnapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          final DocumentSnapshot documentSnapshot =
                              streamSnapshot.data!.docs[index];

                          return CourseraCard(
                            namesurname: documentSnapshot['name'],
                            link: documentSnapshot['odevLink'],
                            modulAdi: documentSnapshot['odevBaslik'],
                            backgroundColor: kGoogleBlue,
                          );
                        });
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                },
              ),
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
            onChanged: (String input) {
              courseraController.ogrenciAdi.value = input;
            },
            decoration: InputDecoration(hintText: 'İsim Soyisim'),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                //Text('Modül İsmini, kaçıncı haftada olduğunu belirtiniz.'),
                TextField(
                  onChanged: (String input) {
                    courseraController.odevBaslik.value = input;
                  },
                  decoration: InputDecoration(hintText: 'Dersin Adı'),
                ),
                SizedBox(
                  height: 15,
                ),
                // Text('Coursera Linkini Girin.'),
                TextField(
                  decoration: InputDecoration(hintText: 'Ödev Linkini'),
                  onChanged: (String input) {
                    courseraController.odevLink.value = input;
                  },
                ),
              ],
            ),
          ),

          //TextField(decoration: InputDecoration(hintText: 'Coursera Linkini Girin'),),
          actions: [
            TextButton(
                onPressed: () => Navigator.pop(context), child: Text('Cancel')),
            TextButton(
              onPressed: () async {
                Navigator.pop(context);
                courseraController.courseraIlanlari.add(CourseraCard(
                  backgroundColor: kGoogleBlue,
                  link: courseraController.odevLink.value,
                  namesurname: courseraController.ogrenciAdi.value,
                  modulAdi: courseraController.odevBaslik.value,
                ));
                _authService.createCourseraPost(
                    courseraController.odevBaslik.value,
                    courseraController.odevLink.value,
                    courseraController.ogrenciAdi.value,
                    DateTime.now());
                await sendMessageToSlackBot(
                  '${courseraController.odevBaslik}\n\n${courseraController.odevLink}\n\n${courseraController.ogrenciAdi}\n\nTeşekkürler\n\nÖdevinizin daha çok insana ulaşması için çabalıyoruz.Katılmak isterseniz AppJam F1 uygulamasını indirin🎉🎉🎉',
                  'APIKEY',
                  '#general',
                );
              },
              child: Text('Save'),
            )
          ],
          elevation: 10.0, shadowColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      );
}
