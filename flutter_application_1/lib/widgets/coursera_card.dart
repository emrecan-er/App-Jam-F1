import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/to_do_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../constants/constans.dart';

class CourseraCard extends StatelessWidget {
  String link;
  String modulAdi;
  Color backgroundColor;
  String namesurname;

  CourseraCard(
      {required this.backgroundColor,
      required this.link,
      required this.namesurname,
      required this.modulAdi});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: Get.width,
        height: 160,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black,
          ),
          color: backgroundColor.withOpacity(0.05),
          borderRadius: BorderRadius.circular(
            16,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                namesurname,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'VarelaRound',
                  color: Colors.black,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(18.0, 0.0, 8.0, 8.0),
              child: Text(
                modulAdi,
                style: TextStyle(
                  fontFamily: 'VarelaRound',
                  color: Colors.black,
                  fontSize: 13,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15.0, 8.0, 8.0, 0.0),
              child: Row(
                children: [
                  Text(
                    'Ödevin linki:',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      fontFamily: 'VarelaRound',
                      color: Colors.black,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TextButton(
                    child: Text(
                      link,
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: 'VarelaRound',
                        color: Colors.blue,
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ToDoPage()),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
