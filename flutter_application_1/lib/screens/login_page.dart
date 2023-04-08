import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/dashboard.dart';
import 'package:flutter_application_1/screens/main_screen.dart';
import 'package:flutter_application_1/screens/register_page.dart';
import 'package:flutter_application_1/service/auth_service.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:nice_buttons/nice_buttons.dart';

import '../constants/constans.dart';
import '../controller/register_controller.dart';
import '../widgets/custom_form_field.dart';

class LoginPage extends StatelessWidget {
  AuthService authService = AuthService();
  RegisterController registerController = RegisterController();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: Get.height / 5,
              ),
              Image.asset(
                'assets/akademi.png',
                width: 50,
                height: 50,
              ),
              SizedBox(
                height: 10,
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
                  hint: 'Email',
                  lines: 1,
                  type: TextInputType.emailAddress,
                  obscureText: false,
                  onChanged: (input) {
                    registerController.logInEmail = input;
                  },
                  icon: FontAwesomeIcons.user),
              CustomFormField(
                hint: 'Şifre',
                lines: 1,
                type: TextInputType.name,
                obscureText: true,
                onChanged: (input) {
                  registerController.logInPassword = input;
                },
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
                  Timer(Duration(seconds: 2), () {
                    authService
                        .signIn(
                      registerController.logInEmail,
                      registerController.logInPassword,
                    )
                        .then((value) {
                      if (value?.uid == '9NxNtwGTmwd70yFSqlwJCWr5uFs2')
                        Get.off(Dashboard());
                      else {
                        Get.off(MainScreen());
                      }
                    });
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
                height: 110,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image.asset(
                      'assets/girisim.png',
                      height: 18,
                    ),
                    Image.asset(
                      'assets/girvak-logo.png',
                      height: 18,
                    ),
                    Image.asset(
                      'assets/google-logo.png',
                      height: 18,
                    ),
                    Image.asset(
                      'assets/logo-2.png',
                      height: 18,
                    ),
                    Image.asset(
                      'assets/logo-3.png',
                      height: 18,
                    ),
                  ],
                ),
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
