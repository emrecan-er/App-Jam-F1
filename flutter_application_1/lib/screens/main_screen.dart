import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/constans.dart';
import 'package:flutter_application_1/widgets/circular_percents.dart';
import 'package:flutter_application_1/widgets/coursera.dart';
import 'package:flutter_application_1/widgets/tasks.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import '../widgets/my_header.dart';
import 'package:appbar_animated/appbar_animated.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(
          Icons.notes,
        ),
        backgroundColor: Color(0xffe94235).withOpacity(0.9),
      ),
      backgroundColor: Colors.white,
      body: ScaffoldLayoutBuilder(
        appBarHeight: 70,
        backgroundColorAppBar: ColorBuilder(Colors.transparent, Colors.blue),
        textColorAppBar: ColorBuilder(Colors.white),
        appBarBuilder: _appBar,
        child: SingleChildScrollView(
          child: Column(
            children: [
              MyHeader(
                  image: 'assets/koy.png',
                  textTop: 'Hoşgeldin',
                  textBottom: 'Kullanıcı',
                  offset: 0),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [TextManager(message: "Yapılacaklar")],
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
          Icons.notifications,
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
