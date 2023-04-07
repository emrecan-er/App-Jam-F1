import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/constans.dart';
import 'package:flutter_application_1/controller/register_controller.dart';
import 'package:flutter_application_1/screens/login_page.dart';
import 'package:flutter_application_1/service/auth_service.dart';
import 'package:flutter_application_1/widgets/custom_form_field.dart';
import 'package:get/get.dart';
import 'package:nice_buttons/nice_buttons.dart';

class RegisterPage extends StatelessWidget {
  RegisterController registerController = RegisterController();
  AuthService authService = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 60,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Hesap Oluştur',
                    style: TextStyle(
                      fontFamily: 'VarelaRound',
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Kişisel Bilgilerin',
                style: TextStyle(
                  fontFamily: 'VarelaRound',
                  color: Colors.grey,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            CustomFormField(
              lines: 1,
              type: TextInputType.name,
              icon: Icons.person,
              hint: 'Adın',
              obscureText: false,
              onChanged: (input) {
                registerController.name = input;
                print(registerController.name);
              },
            ),
            SizedBox(
              height: 10,
            ),
            CustomFormField(
              lines: 1,
              type: TextInputType.emailAddress,
              icon: Icons.person,
              hint: 'Soyadın',
              obscureText: false,
              onChanged: (input) {
                registerController.surname = input;
              },
            ),
            SizedBox(
              height: 10,
            ),
            CustomFormField(
              lines: 1,
              type: TextInputType.emailAddress,
              icon: Icons.mail,
              hint: 'Akademiye kayıtlı olduğun mailin',
              obscureText: false,
              onChanged: (input) {
                registerController.email = input;
              },
            ),
            SizedBox(
              height: 10,
            ),
            CustomFormField(
              lines: 1,
              type: TextInputType.emailAddress,
              icon: Icons.password_sharp,
              hint: 'Şifre',
              obscureText: true,
              onChanged: (input) {
                registerController.password = input;
              },
            ),
            SizedBox(
              height: Get.height / 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RichText(
                      text: TextSpan(
                        text: 'I have read and accept the ',
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'VarelaRound',
                            fontSize: 13),
                        children: <TextSpan>[
                          TextSpan(
                              text: 'Terms',
                              style: TextStyle(
                                  color: Colors.red,
                                  fontFamily: 'VarelaRound',
                                  fontSize: 13),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  showDialog(
                                      context: context,
                                      builder: ((context) {
                                        return AlertDialog(
                                          title: Text('Legal Consent'),
                                          content: Column(
                                            children: [
                                              Text(
                                                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras rhoncus, orci id lobortis auctor, ante magna semper odio, sed pulvinar nisi turpis eget sem. Morbi porttitor aliquam metus, ut feugiat ipsum aliquet vitae. Interdum et malesuada fames ac ante ipsum primis in faucibus. Etiam pretium justo vitae lorem dictum, ut feugiat mi convallis. Mauris dui nisi, imperdiet vel odio id, porttitor mattis justo. Duis dapibus lorem enim. Donec placerat, enim nec pulvinar faucibus, dui ex suscipit dui, id consectetur eros orci id mauris. Nulla ac tincidunt magna, vel egestas tortor. Suspendisse dictum mauris id consequat feugiat. Aenean eu libero sit amet risus facilisis ultricies. Aenean dictum ex mauris, vitae congue magna sagittis sed. Integer sodales auctor molestie. Aliquam non eros nisi. Ut accumsan id ante id finibus.'),
                                            ],
                                          ),
                                        );
                                      }));
                                }),
                        ],
                      ),
                    ),
                  ),
                  Checkbox(
                    side: BorderSide(
                      width: 2,
                      color: kGoogleBlue,
                    ),
                    value: true,
                    onChanged: (value) {},
                    activeColor: Colors.red,
                  ),
                ],
              ),
            ),
            Center(
              child: NiceButtons(
                startColor: Colors.red,
                endColor: Colors.red.withOpacity(0.7),
                borderColor: Colors.red.withOpacity(0.5),
                height: 40,
                stretch: false,
                borderRadius: 30,
                gradientOrientation: GradientOrientation.Horizontal,
                onTap: (finish) {
                  authService.createPerson(
                      registerController.email,
                      registerController.password,
                      registerController.name,
                      registerController.surname);
                  Get.off(LoginPage());
                },
                child: Text(
                  'Kayıt Ol',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontFamily: 'VarelaRound',
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 60,
            ),
          ],
        ),
      ),
    );
  }

  TextStyle RegisterStyle() {
    return TextStyle(
        fontFamily: 'VarelaRound',
        fontSize: 12,
        color: kGoogleBlue.withOpacity(0.5));
  }
}
