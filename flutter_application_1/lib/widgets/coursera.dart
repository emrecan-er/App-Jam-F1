import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/constans.dart';

class Coursera extends StatefulWidget {
  const Coursera({super.key});

  @override
  State<Coursera> createState() => _CourseraState();
}

class _CourseraState extends State<Coursera> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: CourseraManager(
                    message: "Ödevimi değerlendirir misiniz?",
                    name: "Emrecan Er"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: CourseraManager(
                  message: "Linke tıklayıp ödevime bakar mısınız?",
                  name: "Salih Büker",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: CourseraManager(
                    message: "Son bir kişi ödevime bakabilir mi?",
                    name: "Ömer Yılmaz"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CourseraManager extends StatelessWidget {
  String name;
  String message;

  CourseraManager({required this.name, required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
            color: kGoogleBlue,
          ),
          borderRadius: BorderRadius.circular(8),
          color: Colors.white),
      width: 250,
      height: 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              message,
              style: TextStyle(fontFamily: 'VarelaRound', color: Colors.black),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                name,
                style: TextStyle(fontFamily: 'VarelaRound', color: Colors.grey),
              ),
            ],
          )
        ],
      ),
    );
  }
}
