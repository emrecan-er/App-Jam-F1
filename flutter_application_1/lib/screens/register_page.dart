import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/constans.dart';
import 'package:flutter_application_1/widgets/custom_form_field.dart';
import 'package:get/get.dart';
import 'package:nice_buttons/nice_buttons.dart';

class RegisterPage extends StatelessWidget {
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
                    'Create an Account',
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
                'Personal Info',
                style: TextStyle(
                  fontFamily: 'VarelaRound',
                  color: Colors.grey,
                ),
              ),
            ),
            CustomFormField(
              lines: 1,
              type: TextInputType.name,
              icon: Icons.person,
              hint: 'Name',
              obscureText: false,
              onChanged: (input) {},
            ),
            CustomFormField(
              lines: 1,
              type: TextInputType.emailAddress,
              icon: Icons.person,
              hint: 'Surname',
              obscureText: false,
              onChanged: (input) {},
            ),
            CustomFormField(
              lines: 1,
              type: TextInputType.number,
              icon: Icons.numbers,
              hint: 'Age',
              obscureText: false,
              onChanged: (input) {},
            ),
            CustomFormField(
              lines: 3,
              type: TextInputType.name,
              icon: Icons.home,
              hint: '\nAddress',
              obscureText: false,
              onChanged: (input) {},
            ),
            CustomFormField(
              lines: 1,
              type: TextInputType.emailAddress,
              icon: Icons.mail,
              hint: 'E-Mail Address',
              obscureText: false,
              onChanged: (input) {},
            ),
            CustomFormField(
              lines: 1,
              type: TextInputType.emailAddress,
              icon: Icons.mail,
              hint: 'Password',
              obscureText: true,
              onChanged: (input) {},
            ),
            Row(
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
                Obx(
                  () => Checkbox(
                    side: BorderSide(
                      width: 2,
                      color: kGoogleBlue,
                    ),
                    value: true,
                    onChanged: (value) {},
                    activeColor: Colors.red,
                  ),
                )
              ],
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
                  print('On tap called');
                },
                child: Text(
                  'Register',
                  style: TextStyle(color: Colors.white, fontSize: 18),
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
