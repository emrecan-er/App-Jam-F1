import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/task_controller.dart';
import 'package:flutter_application_1/screens/main_screen.dart';
import 'package:flutter_application_1/widgets/modul_card.dart';
import 'package:flutter_application_1/widgets/text_manager.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../constants/constans.dart';
import '../widgets/wave_clipper.dart';

class UnityPage extends StatefulWidget {
  const UnityPage({super.key});

  @override
  State<UnityPage> createState() => _UnityPageState();
}

class _UnityPageState extends State<UnityPage> {
  TaskController taskController = Get.put(TaskController());
  Color color = Colors.grey;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            AppBar(
              backgroundColor: kGoogleRed,
              elevation: 0,
              toolbarHeight: 50,
              title: Text(
                'Unity Modülleri',
                style: TextStyle(
                  fontFamily: 'VarelaRound',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  TextManager(
                    message: 'Modüller',
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  TextManager(
                    message: 'Tamamladığınız modüllerin sayısını giriniz.',
                  )
                ],
              ),
            ),
            ModulCard(
              onChanged: (String input) {
                taskController.unityTamamlananModul += int.parse(input);
                print(taskController.unityTamamlananModul);
                taskController.unityYuzde.value =
                    (taskController.unityTamamlananModul /
                            taskController.unityToplamModul.value) *
                        100;
                print(taskController.unityYuzde);
              },
              modulSayisi: 17,
              modulAciklamasi:
                  '2D ve 3D tasarım için en popüler uygulamaları kullanarak oyun sanatını öğrenin.',
              modulAdi: 'Unity ile Oyun Geliştirmeye Giriş',
              backgroundColor: kGoogleRed,
              sure: '1092',
            ),
            ModulCard(
              onChanged: (String input) {
                taskController.unityTamamlananModul += int.parse(input);
                print(taskController.unityTamamlananModul);
                taskController.unityYuzde.value =
                    (taskController.unityTamamlananModul /
                            taskController.unityToplamModul.value) *
                        100;
                print(taskController.unityYuzde);
              },
              modulSayisi: 35,
              modulAciklamasi:
                  'Unity kullanarak mobil ve PC platformları için oyun geliştirmede uzmanlaşın.',
              modulAdi: 'Unity ile Oyun Geliştirmede Uzmanlaşma',
              backgroundColor: kGoogleRed,
              sure: '1358',
            ),
          ],
        ),
      ),
    );
  }
}
