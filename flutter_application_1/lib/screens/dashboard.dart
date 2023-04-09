import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_application_1/constants/constans.dart';
import 'package:flutter_application_1/screens/main_screen.dart';
import 'package:flutter_application_1/widgets/custom_form_field.dart';
import 'package:flutter_application_1/widgets/wave_clipper.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nice_buttons/nice_buttons.dart';
import 'package:http/http.dart' as http;

import '../widgets/text_manager.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  bool checkboxMeeting = false;
  bool checkboxAnnounce = false;
  bool checkboxAdvice = false;
  late String duyuruText;
  late String baslik;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Oyun ve Uygulama Akademisi Moderatör Portalı',
          style: TextStyle(fontFamily: 'VarelaRound', fontSize: 15),
        ),
        backgroundColor: kGoogleGreen,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            MyWaveClipper(
              widget: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'Merhaba, bu ekranda size özel geliştirdiğimiz bot ile slackte paylaşım yapabilirsiniz.',
                      style: TextStyle(
                        fontFamily: 'VarelaRound',
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Icon(
                        FontAwesomeIcons.meetup,
                        color: Colors.red,
                        size: 30,
                      ),
                      Row(
                        children: [
                          Checkbox(
                            activeColor: kGoogleRed,
                            value: checkboxMeeting,
                            onChanged: (value) {
                              setState(() {
                                checkboxMeeting = value!;
                                baslik = 'Buluşma';
                              });
                            },
                          ),
                          Text(
                            'Buluşma',
                            style: TextStyle(
                              fontFamily: 'VarelaRound',
                              fontSize: 16,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Icon(
                        Icons.announcement,
                        color: kGoogleYellow,
                        size: 30,
                      ),
                      Row(
                        children: [
                          Checkbox(
                            activeColor: kGoogleYellow,
                            value: checkboxAnnounce,
                            onChanged: (value) {
                              setState(() {
                                checkboxAnnounce = value!;
                                baslik = 'Duyuru';
                              });
                            },
                          ),
                          Text(
                            'Duyuru',
                            style: TextStyle(
                              fontFamily: 'VarelaRound',
                              fontSize: 16,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Icon(
                        Icons.school_outlined,
                        color: kGoogleBlue,
                        size: 30,
                      ),
                      Row(
                        children: [
                          Checkbox(
                            value: checkboxAdvice,
                            onChanged: (value) {
                              setState(() {
                                checkboxAdvice = value!;
                              });
                            },
                          ),
                          Text(
                            'Tavsiyeler',
                            style: TextStyle(
                              fontFamily: 'VarelaRound',
                              fontSize: 16,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child:
                  TextManager(message: 'Göndermek İstediğiniz Mesajı Giriniz.'),
            ),
            CustomFormField(
              hint:
                  'Örnek: Flutter Ankara buluşması bu cumartesi Tunalı\'da\n Buluşmanın meet up linki:www.meetup.com/asdgsda\nKatılmanızı Öneririm',
              icon: Icons.announcement_outlined,
              lines: 6,
              obscureText: false,
              onChanged: (String input) {
                setState(() {
                  duyuruText = input;
                });
              },
              type: TextInputType.name,
            ),
            SizedBox(
              height: 30,
            ),
            FloatingActionButton(
              backgroundColor: kGoogleGreen,
              onPressed: () {
                sendMessageToSlackBot(
                  '$duyuruText \n\n #$baslik',
                  'API KEY',
                  '#general',
                );
                AwesomeDialog(
                  context: context,
                  animType: AnimType.scale,
                  dialogType: DialogType.success,
                  body: Center(
                    child: Text(
                      'Mesajınız #general kanalına başarıyla gönderildi.',
                      style: TextStyle(
                        fontFamily: 'VarelaRound',
                        fontSize: 14,
                      ),
                    ),
                  ),
                  btnOkOnPress: () {},
                )..show();
              },
              child: Icon(
                FontAwesomeIcons.slack,
              ),
            ),
          ],
        ),
      ),
    );
  }

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
}
