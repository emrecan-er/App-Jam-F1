import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/main_screen.dart';
import 'package:flutter_application_1/widgets/modul_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../constants/constans.dart';
import '../widgets/wave_clipper.dart';

class IngilizcePage extends StatefulWidget {
  const IngilizcePage({super.key});

  @override
  State<IngilizcePage> createState() => _IngilizcePageState();
}

class _IngilizcePageState extends State<IngilizcePage> {
  Color color = Colors.grey;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            AppBar(
              backgroundColor: kGoogleYellow,
              elevation: 0,
              toolbarHeight: 50,
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
              modulSayisi: 8,
              modulAciklamasi:
                  'Kariyerini teknoloji sektöründe kurarken faydalanabileceğin, oyun ve uygulama geliştirme alanında uluslararası standart ve trendleri takip edebilmeni kolaylaştıracak İngilizce eğitimlerine katıl.',
              modulAdi: 'Yazılımcılar İçin İngilizce Eğitimi',
              backgroundColor: kGoogleYellow,
              sure: '1693',
            ),
          ],
        ),
      ),
    );
  }
}
