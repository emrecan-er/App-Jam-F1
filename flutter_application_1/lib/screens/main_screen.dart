import 'dart:developer';
import 'package:flutter_application_1/controller/task_controller.dart';
import 'package:flutter_application_1/screens/coursera_page.dart';
import 'package:flutter_application_1/screens/to_do_page.dart';
import 'package:flutter_application_1/widgets/task_list_item.dart';
import 'package:flutter_application_1/widgets/text_manager.dart';
import 'package:http/http.dart' as http;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/constans.dart';
import 'package:flutter_application_1/service/auth_service.dart';
import 'package:flutter_application_1/widgets/circular_percents.dart';
import 'package:flutter_application_1/widgets/coursera.dart';
import 'package:flutter_application_1/widgets/tasks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../widgets/aylik_gorevler.dart';
import '../widgets/my_header.dart';
import 'package:appbar_animated/appbar_animated.dart';

AuthService authService = AuthService();

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  TaskController taskController = Get.put(TaskController());
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
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(ToDoPage());
        },
        /*() async {
          await sendMessageToSlackBot('asd', 'SLACK_TOKEN', '#general');
          
        },*/
        child: Icon(
          Icons.notes,
        ),
        backgroundColor: Color(0xffe94235).withOpacity(0.9),
      ),
      backgroundColor: Colors.white,
      body: ScaffoldLayoutBuilder(
        appBarHeight: 60,
        backgroundColorAppBar: ColorBuilder(Colors.transparent, Colors.blue),
        textColorAppBar: ColorBuilder(Colors.white),
        appBarBuilder: _appBar,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                width: Get.width,
                height: 250,
                child: StreamBuilder(
                  stream: authService.getUser(),
                  builder: (context, snapshot) {
                    return !snapshot.hasData
                        ? CircularProgressIndicator()
                        : SizedBox(
                            width: 50,
                            height: 50,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: snapshot.data?.docs.length,
                                itemBuilder: (context, index) {
                                  DocumentSnapshot documentSnapshot =
                                      snapshot.data!.docs[index];

                                  return MyHeader(
                                      image: 'assets/koy.png',
                                      textTop: 'Hoşgeldin',
                                      textBottom: documentSnapshot['name'],
                                      offset: 0);
                                }),
                          );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [TextManager(message: "Eğitimler")],
                ),
              ),
              Tasks(),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    TextManager(message: "İlerlemem"),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              CircularPercents(),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextManager(message: "Coursera Yardımlaşma Platformu"),
                    RichText(
                      text: TextSpan(children: [
                        TextSpan(
                          text: 'Tamamını Gör',
                          style: TextStyle(
                            color: kGoogleRed,
                            fontFamily: 'VarelaRound',
                            fontSize: 12,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Get.to(
                                CourseraPage(),
                              );
                            },
                        ),
                      ]),
                    ),
                  ],
                ),
              ),
              Coursera(),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  width: Get.width,
                  height: 100,
                  decoration: BoxDecoration(
                    color: kGoogleBlue,
                    gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                        kGoogleBlue.withOpacity(0.2),
                        kGoogleRed.withOpacity(0.2),
                        kGoogleYellow.withOpacity(0.2),
                        kGoogleGreen.withOpacity(0.2),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            'Coursera ödevlerinde zorlanıyor musun?',
                            style: TextStyle(
                              fontFamily: 'VarelaRound',
                              color: Colors.black,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            'Geliştirdiğimiz bot sayesinde ödevlerin otomatikmen Slackte paylaşılacak.Böylece ödevlerini daha çok kişi görünecek',
                            style: TextStyle(
                              fontFamily: 'VarelaRound',
                              color: Colors.black54,
                              fontSize: 13,
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            width: 30,
                            height: 30,
                            child: Image.asset('assets/slack.png'),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              AylikGorevler(),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextManager(message: "Yapılacaklar Listem"),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                              text: 'Tamamını Gör',
                              style: TextStyle(
                                color: kGoogleRed,
                                fontFamily: 'VarelaRound',
                                fontSize: 12,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Get.to(ToDoPage());
                                }),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: Get.width,
                height: 75,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: taskController.allTasks.isEmpty
                        ? 1
                        : taskController.allTasks.length,
                    itemBuilder: (context, index) {
                      return taskController.allTasks.isEmpty
                          ? Center(
                              child: SizedBox(
                                  width: Get.width,
                                  height: 15,
                                  child: Text(
                                    'Buralar Henüz Boş...',
                                    style: TextStyle(
                                      fontFamily: 'VarelaRound',
                                      fontStyle: FontStyle.italic,
                                    ),
                                    textAlign: TextAlign.center,
                                  )),
                            )
                          : SizedBox(
                              width: Get.width,
                              child: TaskItem(
                                task: taskController.allTasks[index],
                              ),
                            );
                    }),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _appBar(BuildContext context, ColorAnimated colorAnimated) {
  return AppBar(
    backgroundColor: colorAnimated.background,
    elevation: 0,
    title: Text(
      "Oyun ve Uygulama Akademisi",
      style: TextStyle(
        color: colorAnimated.color,
        fontSize: 15,
        fontFamily: 'VarelaRound',
      ),
    ),
    actions: [
      SizedBox(
        width: 70,
        height: 70,
        child: Image.asset(
          'assets/icons.png',
        ),
      ),
    ],
  );
}
