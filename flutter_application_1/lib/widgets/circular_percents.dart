import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class CircularPercents extends StatefulWidget {
  const CircularPercents({
    super.key,
  });

  @override
  State<CircularPercents> createState() => _CircularPercentsState();
}

class _CircularPercentsState extends State<CircularPercents> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            children: [
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircularPercentManager(
                      name: "Flutter", yuzde: 70.6, renk: Color(0xff4285f4))),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircularPercentManager(
                      name: "Unity", yuzde: 65.0, renk: Color(0xff34a853))),
            ],
          ),
        ),
        Expanded(
          child: Column(
            children: [
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircularPercentManager(
                      name: "Girişimcilik",
                      yuzde: 100,
                      renk: Color(0xffe94235))),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircularPercentManager(
                    name: "İngilizce",
                    yuzde: 25,
                    renk: Color(0xfffabb05),
                  )),
            ],
          ),
        ),
      ],
    );
  }
}

class CircularPercentManager extends StatelessWidget {
  double yuzde;
  String name;
  Color renk;

  CircularPercentManager(
      {required this.name, required this.yuzde, required this.renk});

  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      radius: 50.0,
      lineWidth: 11.0,
      animation: true,
      percent: yuzde / 100,
      center: Text(
        "$yuzde%",
        style: TextStyle(fontFamily: 'VarelaRound', fontSize: 17.0),
      ),
      footer: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          name,
          style: TextStyle(fontFamily: 'VarelaRound', fontSize: 17.0),
        ),
      ),
      circularStrokeCap: CircularStrokeCap.round,
      progressColor: renk,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty('name', name));
  }
}
