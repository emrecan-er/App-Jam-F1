import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/task_controller.dart';
import 'package:flutter_application_1/screens/main_screen.dart';
import 'package:flutter_application_1/widgets/modul_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../constants/constans.dart';
import '../widgets/text_manager.dart';
import '../widgets/wave_clipper.dart';

class GirisimcilikPage extends StatefulWidget {
  const GirisimcilikPage({super.key});

  @override
  State<GirisimcilikPage> createState() => _GirisimcilikPageState();
}

class _GirisimcilikPageState extends State<GirisimcilikPage> {
  TaskController taskController = Get.put(TaskController());
  Color color = Colors.grey;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            AppBar(
              backgroundColor: kGoogleGreen,
              elevation: 0,
              toolbarHeight: 50,
              title: Text(
                'Girişimcilik Modülleri',
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
                taskController.girisimcilikTamamlananModul.value +=
                    int.parse(input);
                print(taskController.girisimcilikTamamlananModul);
                taskController.girisimcilikYuzde.value =
                    (taskController.girisimcilikTamamlananModul.value /
                            taskController.girisimcilikToplamModul.value) *
                        100;
                print(taskController.girisimcilikYuzde);
              },
              modulSayisi: 9,
              modulAciklamasi:
                  'Yeni nesil girişim dünyasında var olmak için çıkacağın bu yolculukta ihtiyacın olacak tüm unsurları öğreneceksin.',
              modulAdi: 'Temel Girişimcilik',
              backgroundColor: kGoogleGreen,
              sure: '338',
            ),
            ModulCard(
              onChanged: (String input) {
                taskController.girisimcilikTamamlananModul.value +=
                    int.parse(input);
                print(taskController.girisimcilikTamamlananModul);
                taskController.girisimcilikYuzde.value =
                    (taskController.girisimcilikTamamlananModul.value /
                            taskController.girisimcilikToplamModul.value) *
                        100;
                print(taskController.girisimcilikYuzde);
              },
              modulSayisi: 9,
              modulAciklamasi:
                  'Girişimcilerin faaliyette bulundukları Finansal Sistem , Finansal Araçlar, Muhasebe ve Vergi Uygulamaları hakkında bilgi sahibi olun.',
              modulAdi: 'Girişimciler için Finans',
              backgroundColor: kGoogleGreen,
              sure: '338',
            ),
            ModulCard(
              onChanged: (String input) {
                taskController.girisimcilikTamamlananModul.value +=
                    int.parse(input);
                print(taskController.girisimcilikTamamlananModul);
                taskController.girisimcilikYuzde.value =
                    (taskController.girisimcilikTamamlananModul.value /
                            taskController.girisimcilikToplamModul.value) *
                        100;
                print(taskController.girisimcilikYuzde);
              },
              modulSayisi: 1,
              modulAciklamasi:
                  'İş hayatınızı yeniden  kazanacak,  bir profesyonel hayat için sağlık gibi konularda önemli ipuçlarına erişebileceksiniz.',
              modulAdi: 'Girişimciler için İK',
              backgroundColor: kGoogleGreen,
              sure: '77',
            ),
            ModulCard(
              onChanged: (String input) {
                taskController.girisimcilikTamamlananModul += int.parse(input);
                print(taskController.girisimcilikTamamlananModul);
                taskController.girisimcilikYuzde.value =
                    (taskController.girisimcilikTamamlananModul.value /
                            taskController.girisimcilikToplamModul.value) *
                        100;
                print(taskController.girisimcilikYuzde);
              },
              modulSayisi: 3,
              modulAciklamasi:
                  'Girişimcilik dünyasına girmeden önce bilmeniz gereken temel hukuki bilgileri öğrenin.',
              modulAdi: 'Girişimciler için Hukuk',
              backgroundColor: kGoogleGreen,
              sure: '104',
            ),
          ],
        ),
      ),
    );
  }
}
