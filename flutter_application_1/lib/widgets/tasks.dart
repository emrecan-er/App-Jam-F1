import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/constans.dart';
import 'package:flutter_application_1/controller/task_controller.dart';
import 'package:flutter_application_1/screens/flutter_page.dart';
import 'package:flutter_application_1/screens/girisimcilik_page.dart';
import 'package:flutter_application_1/screens/ingilizce_page.dart';
import 'package:flutter_application_1/screens/unity_page.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Tasks extends StatelessWidget {
  TaskController taskController = TaskController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                TaskManager(
                  onTap: () {
                    Get.to(FlutterPage());
                  },
                  color: kGoogleBlue,
                  ders: 'Flutter',
                  modulSayisi: taskController.flutterToplamModul.toString(),
                ),
                TaskManager(
                  onTap: () {
                    Get.to(
                      GirisimcilikPage(),
                    );
                  },
                  color: kGoogleGreen,
                  ders: 'Girişimcilik',
                  modulSayisi:
                      taskController.girisimcilikToplamModul.toString(),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                TaskManager(
                  onTap: () {
                    Get.to(
                      UnityPage(),
                    );
                  },
                  color: kGoogleRed,
                  ders: 'Unity',
                  modulSayisi: taskController.unityToplamModul.toString(),
                ),
                TaskManager(
                  onTap: () {
                    Get.to(IngilizcePage());
                  },
                  color: kGoogleYellow,
                  ders: 'İngilizce',
                  modulSayisi: taskController.ingilizceToplamModul.toString(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TaskManager extends StatelessWidget {
  String modulSayisi;
  String ders;
  Color color;
  Function() onTap;

  TaskManager({
    required this.onTap,
    required this.ders,
    required this.color,
    required this.modulSayisi,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: color.withOpacity(0.75),
              border: Border.all(
                color: Colors.black,
              ),
            ),
            width: Get.width,
            height: 110,
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Image.asset(
                      'assets/background.png',
                      color: Colors.white.withOpacity(0.2),
                    ),
                  ),
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text(
                            modulSayisi,
                            style: TextStyle(
                              fontSize: 25,
                              color: Colors.white,
                              fontFamily: 'VarelaRound',
                            ),
                          ),
                          Spacer(),
                          Icon(
                            Icons.arrow_circle_right_outlined,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text(
                            ders,
                            style: TextStyle(
                              fontSize: 19,
                              color: Colors.white,
                              fontFamily: 'VarelaRound',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            )),
      ),
    );
  }
}
