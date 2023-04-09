import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/main_screen.dart';
import 'package:flutter_application_1/widgets/modul_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../constants/constans.dart';
import '../widgets/wave_clipper.dart';

class FlutterPage extends StatefulWidget {
  const FlutterPage({super.key});

  @override
  State<FlutterPage> createState() => _FlutterPageState();
}

class _FlutterPageState extends State<FlutterPage> {
  Color color = Colors.grey;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            AppBar(
              backgroundColor: kGoogleBlue,
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
            ModulCard(
              modulSayisi: 1,
              modulAciklamasi:
                  'Flutter ile mobil, web ve masaüstü uygulamaları geliştirmeye başlayın',
              modulAdi: 'Flutter Hazırlık',
              backgroundColor: kGoogleBlue,
              sure: '187',
            ),
            ModulCard(
              modulSayisi: 21,
              modulAciklamasi:
                  'Flutter ile Android ve iOS uygulamaları geliştirmeyi öğrenin.',
              modulAdi: 'Flutter ile Uygulama Geliştirme Eğitimleri',
              backgroundColor: kGoogleBlue,
              sure: '1358',
            ),
            ModulCard(
              modulSayisi: 3,
              modulAciklamasi:
                  'Flutter ile örnek projeler geliştirerek öğrendiklerinizi pekiştirin.',
              modulAdi:
                  'Flutter ile örnek projeler geliştirerek öğrendiklerinizi pekiştirin.',
              backgroundColor: kGoogleBlue,
              sure: '1679',
            ),
          ],
        ),
      ),
    );
  }
}
