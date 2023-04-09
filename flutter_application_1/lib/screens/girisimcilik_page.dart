import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/main_screen.dart';
import 'package:flutter_application_1/widgets/modul_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../constants/constans.dart';
import '../widgets/wave_clipper.dart';

class GirisimcilikPage extends StatefulWidget {
  const GirisimcilikPage({super.key});

  @override
  State<GirisimcilikPage> createState() => _GirisimcilikPageState();
}

class _GirisimcilikPageState extends State<GirisimcilikPage> {
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
              modulSayisi: 9,
              modulAciklamasi:
                  'Yeni nesil girişim dünyasında var olmak için çıkacağın bu yolculukta ihtiyacın olacak tüm unsurları öğreneceksin.',
              modulAdi: 'Temel Girişimcilik',
              backgroundColor: kGoogleGreen,
              sure: '338',
            ),
            ModulCard(
              modulSayisi: 9,
              modulAciklamasi:
                  'Girişimcilerin faaliyette bulundukları Finansal Sistem , Finansal Araçlar, Muhasebe ve Vergi Uygulamaları hakkında bilgi sahibi olun.',
              modulAdi: 'Girişimciler için Finans',
              backgroundColor: kGoogleGreen,
              sure: '338',
            ),
            ModulCard(
              modulSayisi: 1,
              modulAciklamasi:
                  'İş hayatınızı yeniden  kazanacak,  bir profesyonel hayat için sağlık gibi konularda önemli ipuçlarına erişebileceksiniz.',
              modulAdi: 'Girişimciler için İK',
              backgroundColor: kGoogleGreen,
              sure: '77',
            ),
            ModulCard(
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
