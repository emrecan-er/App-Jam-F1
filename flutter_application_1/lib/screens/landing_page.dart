import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/constans.dart';
import 'package:flutter_application_1/screens/login_page.dart';
import 'package:flutter_application_1/widgets/slider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:slide_to_act/slide_to_act.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingState createState() => _LandingState();
}

class _LandingState extends State<LandingPage> {
  int _currentPage = 0;
  PageController _controller = PageController();
  final GlobalKey<SlideActionState> _key = GlobalKey();

  // ignore: prefer_final_fields
  List<Widget> _pages = [
    SliderPage(
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean lacus leo, porta sit amet libero quis, scelerisque blandit libero. Etiam in leo erat. Mauris rhoncus commodo elementum. Vivamus tristique urna ante',
      image: "assets/1.png",
      title: 'Akademiye Hoşgeldin!',
    ),
    SliderPage(
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean lacus leo, porta sit amet libero quis, scelerisque blandit libero. Etiam in leo erat. Mauris rhoncus commodo elementum. Vivamus tristique urna ante, a feugiat ante condimentum id',
      image: "assets/2.png",
      title: 'Ödevlerini Kontrol Et',
    ),
    SliderPage(
      description: 'Lorem ipsum dolor sit amet, ',
      image: "assets/koy.png",
      title: 'Slack Botumuzdan Faydalan',
    ),
  ];

  _onchanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xFFf5f5f5),
        body: Stack(
          children: <Widget>[
            PageView.builder(
              scrollDirection: Axis.horizontal,
              onPageChanged: _onchanged,
              controller: _controller,
              itemCount: _pages.length,
              itemBuilder: (context, int index) {
                return _pages[index];
              },
            ),
            Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List<Widget>.generate(
                    _pages.length,
                    (int index) {
                      return AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        height: 5,
                        width: (index == _currentPage) ? 20 : 10,
                        margin:
                            EdgeInsets.symmetric(horizontal: 5, vertical: 30),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: (index == _currentPage)
                              ? kGoogleRed
                              : kGoogleRed.withOpacity(0.5),
                        ),
                      );
                    },
                  ),
                ),
                Spacer(),
                Container(
                  child: (_currentPage == (_pages.length - 1))
                      ? Padding(
                          padding: const EdgeInsets.only(
                              top: 64, right: 32, left: 32),
                          child: SlideAction(
                            animationDuration: Duration(milliseconds: 700),
                            submittedIcon: Icon(
                              FontAwesomeIcons.google,
                              color: Colors.white,
                            ),
                            text: 'Başlayalım',
                            textStyle: TextStyle(
                              color: Colors.white,
                              fontFamily: 'VarelaRound',
                              fontSize: 18,
                            ),
                            elevation: 1,
                            sliderButtonIcon: FaIcon(
                              Icons.arrow_forward,
                              size: 22,
                              color: kGoogleRed,
                            ),
                            sliderButtonIconPadding: 10,
                            outerColor: kGoogleRed.withOpacity(0.8),
                            sliderButtonIconSize: 14,
                            height: 50,
                            key: _key,
                            onSubmit: () {
                              Get.off(LoginPage());
                            },
                          ),
                        )
                      : IconButton(
                          icon: Icon(
                            Icons.navigate_next,
                            size: 30,
                            color: kGoogleRed,
                          ),
                          onPressed: () {
                            _controller.nextPage(
                                duration: Duration(milliseconds: 800),
                                curve: Curves.easeInOutQuint);
                          },
                        ),
                ),
                SizedBox(
                  height: 30,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
