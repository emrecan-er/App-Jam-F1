import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/text_manager.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../constants/constans.dart';
import '../screens/main_screen.dart';

class AylikGorevler extends StatelessWidget {
  const AylikGorevler({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextManager(message: "Aylık Görevler"),
              RichText(
                text: TextSpan(children: []),
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
      ],
    );
  }
}
