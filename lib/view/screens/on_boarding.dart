import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:valorant/view/screens/home.dart';

import 'package:valorant/constant/constant.dart';
import 'package:valorant/data/model/onboarding_model.dart';

class OnBoarding extends StatefulWidget {
  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  int currentIndex = 0;
  late PageController pageController = PageController();

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  Container buildDot(int index, BuildContext context, Color color) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.0125,
      width: currentIndex == index
          ? MediaQuery.of(context).size.width * 0.060
          : MediaQuery.of(context).size.width * 0.025,
      margin: EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.0125),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width * 0.055),
        color: currentIndex == index ? Color(0xffBD3944) : Color(0xffD9D9D9),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: pageController,
              itemCount: contents.length,
              onPageChanged: (int index) {
                setState(() {
                  currentIndex = index;
                });
              },
              itemBuilder: (_, i) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Image.asset(
                            contents[i].image,
                            height: 370,
                            width: 320,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 37),
                          child: Text(contents[i].title,
                              style: Constant.onBoardingTitleTextStyle),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 32),
                          child: Text(contents[i].description,
                              textAlign: TextAlign.center,
                              style: Constant.onBoardingDescTextStyle),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                contents.length,
                (index) => buildDot(
                    index,
                    context,
                    currentIndex == pages.length - index
                        ? Constant.primaryColor
                        : Constant.onBoardingDotsColor),
              ),
            ),
          ),
          Container(
            height: 60,
            decoration: BoxDecoration(
                color: Constant.onBoardingButtonColor,
                borderRadius: BorderRadius.circular(8)),
            margin: EdgeInsets.all(40),
            width: 360,
            child: TextButton(
              child: Text(
                  currentIndex == contents.length - 1 ? "Continue" : "Next",
                  style: Constant.onBoardingButtonTextStyle),
              onPressed: () async {
                setState(() async {
                  if (currentIndex == contents.length - 1) {
                    SharedPreferences prefInst =
                        await SharedPreferences.getInstance();
                    prefInst.setBool('isIntroRead', true);

                    // ignore: use_build_context_synchronously
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (ctx) => const Home()));
                  }
                  pageController.nextPage(
                    duration: const Duration(milliseconds: 100),
                    curve: Curves.bounceIn,
                  );
                });
              },
            ),
          )
        ],
      ),
    );
  }
}
