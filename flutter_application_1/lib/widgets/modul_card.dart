import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class ModulCard extends StatelessWidget {
  String modulAdi;
  String modulAciklamasi;
  Color backgroundColor;
  int modulSayisi;
  String sure;

  ModulCard(
      {required this.backgroundColor,
      required this.modulAciklamasi,
      required this.sure,
      required this.modulSayisi,
      required this.modulAdi,
      });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: Get.width,
        height: 275,
        decoration: BoxDecoration(
          color: backgroundColor.withOpacity(0.4),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    '$sure dk',
                    style: TextStyle(
                      fontFamily: 'VarelaRound',
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  FaIcon(
                    FontAwesomeIcons.clock,
                    color: Colors.black,
                    size: 15,
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    'Eğitim:',
                    style: TextStyle(
                      fontFamily: 'VarelaRound',
                      color: Colors.black54,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                modulAdi,
                style: TextStyle(
                  fontFamily: 'VarelaRound',
                  color: Colors.black,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                modulAciklamasi,
                style: TextStyle(
                  fontFamily: 'VarelaRound',
                  color: Colors.black54,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    'Bitirdiğiniz Modül Sayısı :',
                    style: TextStyle(
                      fontFamily: 'VarelaRound',
                      color: Colors.black,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 30,
                  height: 25,
                  child: TextField(
                    onChanged: (value) {

                      
                      //value kullanıcının girdiği değer oluyor.o değerleri ayrı ayrı tutup
                      //yüzde hesabına vurulacak

                      //burada ModulCardd çağırıldığında onChanged Fonksiyonunu iste

                      // Yukarıda Function() onChanged; yazım constructorda required this.onChanged yapılacak
                    },
                    keyboardType: TextInputType.number,
                    style: TextStyle(
                      fontFamily: 'VarelaRound',
                      fontSize: 15,
                      color: Colors.black,
                    ),
                  ),
                ),
                Text(
                  '/$modulSayisi',
                  style: TextStyle(
                    fontSize: 15,
                    fontFamily: 'VarelaRound',
                    color: Colors.black,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
