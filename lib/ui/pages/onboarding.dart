import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../theme/box_icons_icons.dart';
import 'navmenu/menu_dashboard_layout.dart';

class Onboarding extends StatefulWidget {
  static const routeName = '/onboarding';
  @override
  _OnboardingState createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  final PageController controller = PageController(initialPage: 0);
  int pageNumber;
  final List widgets = [];

  @override
  void initState() {
    pageNumber = 0;
    super.initState();
  }

  Widget getSizedContainer(double size, String text) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.6,
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontFamily: 'Red Hat Display',
          fontSize: size,
          color: Color(0xFFFFFFFF),
        ),
      ),
    );
  }

  Widget getIntroColumn(String img, String text) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image.asset(img),
        getSizedContainer(15, text),
      ],
    );
  }

  void createWidgets() {
    widgets.addAll([
      getIntroColumn(
        'assets/images/1.png',
        'Easy access to video lectures, & reading materials.',
      ),
      getIntroColumn(
        'assets/images/2.png',
        'Ask questions, earn coins and dominate the global leaderboard.',
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset('assets/images/logo.png'),
          getSizedContainer(30, 'E-Learn'),
          SizedBox(height: MediaQuery.of(context).size.height * 0.25),
          getSizedContainer(
            15,
            'The complete E-learning solution for students of all ages!\n\n\nJoin for FREE now!',
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.06),
          CupertinoButton(
            color: Color(0xFFFFFFFF),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  "Sign in with Google ➡",
                  style: TextStyle(
                    fontFamily: 'Red Hat Display',
                    fontSize: 16,
                    color: Color(0xFF7F00FF),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            onPressed: () {
              Navigator.of(context).popAndPushNamed(MenuDashboardLayout.routeName);
            },
          )
        ],
      ),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    createWidgets();
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF7F00FF),
                  Color(0xFFE100FF),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            child: Image.asset('assets/images/wave.png'),
          ),
          Align(
            alignment: Alignment.center,
            child: PageView.builder(
              controller: controller,
              onPageChanged: (value) {
                setState(() {
                  pageNumber = value;
                });
              },
              itemCount: 3,
              itemBuilder: (context, index) => widgets[index],
            ),
          ),
          pageNumber == 2
              ? Container()
              : Positioned(
                  bottom: 10,
                  right: 10,
                  child: CupertinoButton(
                    color: Colors.transparent,
                    child: Icon(
                      pageNumber == 1
                          ? BoxIcons.bx_check
                          : BoxIcons.bx_chevron_right,
                      color: Color(0xFFFFFFFF),
                      size: 30,
                    ),
                    onPressed: () {
                      controller.nextPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.fastOutSlowIn,
                      );
                    },
                  ),
                )
        ],
      ),
    );
  }
}
