import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/main_screen.dart';
import 'package:flutter_application_1/screens/register_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:nice_buttons/nice_buttons.dart';

import '../constants/constans.dart';
import '../widgets/custom_form_field.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: Get.height / 4,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Oyun ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'VarelaRound',
                      fontSize: 23,
                      color: kGoogleBlue,
                    ),
                  ),
                  Text(
                    've ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'VarelaRound',
                      fontSize: 23,
                      color: kGoogleYellow,
                    ),
                  ),
                  Text(
                    'Uygulama ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'VarelaRound',
                      fontSize: 23,
                      color: kGoogleRed,
                    ),
                  ),
                  Text(
                    'Akademisi',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'VarelaRound',
                      fontSize: 23,
                      color: kGoogleGreen,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              CustomFormField(
                  hint: 'Username',
                  lines: 1,
                  type: TextInputType.emailAddress,
                  obscureText: false,
                  onChanged: (input) {},
                  icon: FontAwesomeIcons.user),
              CustomFormField(
                hint: 'Password',
                lines: 1,
                type: TextInputType.name,
                obscureText: true,
                onChanged: (input) {},
                icon: Icons.password,
              ),
              SizedBox(
                height: 50,
              ),
              RichText(
                text: TextSpan(
                    text: 'Hesabın yok mu?',
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'VarelaRound',
                        fontSize: 13),
                    children: <TextSpan>[
                      TextSpan(
                          text: ' Kayıt ol',
                          style: TextStyle(
                              color: kGoogleBlue,
                              fontFamily: 'VarelaRound',
                              fontSize: 13),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Get.to(
                                RegisterPage(),
                              );
                              // navigate to desired screen
                            })
                    ]),
              ),
              SizedBox(
                height: 30,
              ),
              NiceButtons(
                height: 40,
                startColor: kGoogleRed,
                endColor: kGoogleRed.withOpacity(0.9),
                borderColor: kGoogleRed.withOpacity(0.5),
                stretch: false,
                progress: true,
                gradientOrientation: GradientOrientation.Horizontal,
                onTap: (finish) {
                  Timer(Duration(seconds: 5), () {
                    Get.off(MainScreen());
                  });
                },
                child: Text(
                  'Giriş Yap',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontFamily: 'VarelaRound'),
                ),
              ),
              SizedBox(
                height: 100,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image.asset(
                    'assets/girisim.png',
                    height: 21,
                  ),
                  Image.asset(
                    'assets/girvak-logo.png',
                    height: 21,
                  ),
                  Image.asset(
                    'assets/google-logo.png',
                    height: 21,
                  ),
                  Image.asset(
                    'assets/logo-2.png',
                    height: 21,
                  ),
                  Image.asset(
                    'assets/logo-3.png',
                    height: 21,
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  late String hint;
  CustomTextField({required this.hint});

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: Colors.red,
      onChanged: (value) {},
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(
          fontFamily: 'VarelaRound',
          fontSize: 13,
        ),
      ),
    );
  }
}
