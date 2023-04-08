import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/constans.dart';
import 'package:flutter_application_1/screens/login_page.dart';
import 'package:flutter_application_1/service/auth_service.dart';
import 'package:flutter_application_1/widgets/circular_percents.dart';
import 'package:flutter_application_1/widgets/coursera.dart';
import 'package:flutter_application_1/widgets/tasks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import '../widgets/my_header.dart';
import 'package:appbar_animated/appbar_animated.dart';

AuthService authService = AuthService();

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  Future<http.Response> sendMessageToSlack(
      String message, String channel, String botToken) async {
    final response = await http.post(
      Uri.parse('https://slack.com/api/chat.postMessage'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $botToken',
      },
      body: jsonEncode(<String, dynamic>{
        'channel': channel,
        'text': message,
      }),
    );

    return response;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          sendMessageToSlack('deneme', '#general',
              'xapp-1-A052P6R2KG9-5077341632805-c26400d7dd75a15917c1b81ea5067d8937497a02848d8bb8a48da2d3c6d9de3e');
        },
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
                                print('Login Text Clicked');
                              }),
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
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextManager(message: "Aylık Görevler"),
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
                                print('Login Text Clicked');
                              }),
                      ]),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    FaIcon(
                      FontAwesomeIcons.dotCircle,
                      color: kGoogleYellow,
                      size: 15,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Flutter eğitimlerinin 7 modülünü tamamla veya Unity\n uzmanlık eğitimlerinin %70\'ini tamamla.',
                      overflow: TextOverflow.fade,
                      softWrap: false,
                      style: TextStyle(
                        fontFamily: 'VarelaRound',
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    FaIcon(
                      FontAwesomeIcons.dotCircle,
                      color: kGoogleYellow,
                      size: 15,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Coursera 4. kursu tamamla.',
                      overflow: TextOverflow.fade,
                      softWrap: false,
                      style: TextStyle(
                        fontFamily: 'VarelaRound',
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    FaIcon(
                      FontAwesomeIcons.dotCircle,
                      color: kGoogleYellow,
                      size: 15,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'App Jam yarışmasını kazan.',
                      overflow: TextOverflow.fade,
                      softWrap: false,
                      style: TextStyle(
                        fontFamily: 'VarelaRound',
                      ),
                    ),
                  ],
                ),
              ),
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
                                print('Login Text Clicked');
                              }),
                      ]),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                      ),
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.white),
                  width: 250,
                  height: 200,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'YAPILACAKLAR LİSTESİ',
                          style: TextStyle(
                              fontFamily: 'VarelaRound', color: Colors.black),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [],
                      )
                    ],
                  ),
                ),
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
      IconButton(
        onPressed: () {},
        icon: Icon(
          Icons.logout,
          size: 20,
          color: colorAnimated.color,
        ),
      ),
    ],
  );
}

class TextManager extends StatelessWidget {
  String message;
  TextManager({required this.message});

  @override
  Widget build(BuildContext context) {
    return Text(message,
        style: TextStyle(
          fontFamily: 'VarelaRound',
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ));
  }
}
