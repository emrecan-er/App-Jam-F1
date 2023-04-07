import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/constans.dart';
import 'package:get/get.dart';

class MyWaveClipper extends StatelessWidget {
  late Widget widget;
  MyWaveClipper({required this.widget});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Opacity(
            opacity: 0.5,
            child: ClipPath(
              clipper: WaveClipper(),
              child: Container(
                color: kGoogleBlue,
                height: 150,
              ),
            ),
          ),
          ClipPath(
            clipper: WaveClipper(),
            child: Container(
              color: kGoogleBlue,
              height: 140,
              width: Get.width,
              child: Stack(
                children: [
                  widget,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    debugPrint(Get.width.toString());
    Path path = Path();
    path.lineTo(0, size.height);

    path.quadraticBezierTo(
        size.width / 5, size.height, size.width / 2.25, size.height - 50.0);
    path.quadraticBezierTo(size.width - (size.width / 3.24), size.height - 105,
        size.width, size.height - 10);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
