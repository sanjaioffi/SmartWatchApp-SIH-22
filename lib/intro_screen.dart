import 'package:flutter/services.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:flutter/material.dart';
import 'package:smartwatch_application_sih/pages/mainpage.dart';
import 'package:lottie/lottie.dart';


class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    super.initState();
  }



  void _onIntroEnd(context) {
  //   Navigator.of(context).push(
  //     MaterialPageRoute(builder: (_) => PersonalDetailsPage()),
  //   );
  }

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      globalBackgroundColor: Colors.black,
      pages: [
        PageViewModel(
          title: "Title of first page",
          body:
              "Here you can write the description of the page, to explain someting...",
          image: const Center(child: Icon(Icons.android)),
          decoration: const PageDecoration(
            pageColor: Colors.black,
            titleTextStyle: TextStyle(color: Colors.orange),
            bodyTextStyle:
                TextStyle(fontWeight: FontWeight.w700, fontSize: 20.0, color: Colors.white),
          ),
        ),
        PageViewModel(
          title: "Title of second page",
          body:
              "Here you can write the description of the page, to explain someting...",
          image: Center(child: Lottie.asset('assets/heartbeat-ecg.json')),
          decoration: const PageDecoration(
            pageColor: Colors.black,
            titleTextStyle: TextStyle(color: Colors.orange),
            bodyTextStyle:
                TextStyle(fontWeight: FontWeight.w700, fontSize: 20.0, color: Colors.white),
          ),
        ),
        PageViewModel(
          title: "Title of third page",
          body:
              "Here you can write the description of the page, to explain someting...",
          image:  Center(child: Image.asset('assets/age.png')),
          decoration: const PageDecoration(
            pageColor: Colors.black,
            titleTextStyle: TextStyle(color: Colors.orange),
            bodyTextStyle:
                TextStyle(fontWeight: FontWeight.w700, fontSize: 20.0, color: Colors.white),
          ),
        ),
        PageViewModel(
          title: "Title of fourth page",
          body:
              "Here you can write the description of the page, to explain someting...",
          image: const Center(child: Icon(Icons.four_g_mobiledata)),
          decoration: const PageDecoration(
            pageColor: Colors.black,
            titleTextStyle: TextStyle(color: Colors.orange),
            bodyTextStyle:
                TextStyle(fontWeight: FontWeight.w700, fontSize: 20.0, color: Colors.white),
          ),
        )
      ],
      onDone: () {
        _onIntroEnd(context);
      },
      onSkip: () {
        _onIntroEnd(context);
      },
      showBackButton: false,
      showSkipButton: true,
      skip: const Text('Skip'),
      next: const Text('Next'),
      back: const Icon(Icons.skip_next),
      done: const Text("Get Started",
          style: TextStyle(fontWeight: FontWeight.w600)),
      dotsDecorator: DotsDecorator(
          size: const Size.square(10.0),
          activeSize: const Size(20.0, 10.0),
          activeColor: Colors.blue,
          color: Colors.black26,
          spacing: const EdgeInsets.symmetric(horizontal: 3.0),
          activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0))),
    );
  }
}
