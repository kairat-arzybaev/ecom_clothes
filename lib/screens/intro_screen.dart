import 'package:ecom_clothes/screens/home_screen.dart';
import 'package:ecom_clothes/widgets/image_list_view.dart';
import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../utils/utils.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Stack(
        alignment: Alignment.center,
        children: [
          // image transtition

          Positioned(
            top: -10,
            left: -150,
            child: Row(
              children: const [
                ImageListView(startIndex: 0),
                ImageListView(startIndex: 1),
                ImageListView(startIndex: 2),
              ],
            ),
          ),

          //title
          Positioned(
            top: MediaQuery.of(context).size.height * 0.08,
            child: const Text(
              'MNMLMANDI',
              textAlign: TextAlign.center,
              style: kTitleStyle,
            ),
          ),

          // information screen
          Positioned(
            bottom: 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.6,
              decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [
                  Colors.transparent,
                  Colors.white60,
                  Colors.white,
                  Colors.white
                ], begin: Alignment.topCenter, end: Alignment.center),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Your Appearance \nShows Your Quality',
                    style: kNormalStyle.copyWith(fontSize: 30),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Change the  Quality of Your \nAppearance with MNMLMANDI',
                    style: kNormalStyle.copyWith(
                        color: Colors.grey,
                        fontWeight: FontWeight.w400,
                        height: 1.5),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: buildIndicators(),
                  )
                ],
              ),
            ),
          ),

          // bottom button
          Positioned(
              bottom: 30,
              left: 20,
              right: 20,
              child: SizedBox(
                  height: 60,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomeScreen()));
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: kBackgroundColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30))),
                      child: Text('Sign Up with Email'))))
        ],
      ),
    );
  }
}
