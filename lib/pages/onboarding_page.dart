import '../pages/signin_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  OnBoardingPageState createState() => OnBoardingPageState();
}

class OnBoardingPageState extends State<OnBoardingPage> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => const SignInPage()),
    );
  }

  Widget _buildFullscreenImage(String assetName) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFFF2FBE2),
            Color(0xFFF7FBF0),
          ],
        ),
      ),
      child: Image.asset(
        assetName,
        fit: BoxFit.fitWidth,
        height: 400,
        width: double.infinity,
      ),
    );
  }

  Widget _buildImage(String assetName, [double width = 350]) {
    return Image.asset('assets/$assetName', width: width);
  }

  @override
  Widget build(BuildContext context) {
    final pageDecoration = PageDecoration(
      titleTextStyle: GoogleFonts.inter(
        color: const Color(0xFF114C3A),
        fontSize: 24.sp,
        fontWeight: FontWeight.w600,
      ),
      bodyTextStyle: GoogleFonts.inter(
        color: const Color(0xFF4D6322),
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
      ),
      titlePadding: const EdgeInsets.fromLTRB(16.0, 26.0, 16.0, 16.0),
      bodyPadding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      imagePadding: EdgeInsets.zero,
    );

    return IntroductionScreen(
      key: introKey,
      globalBackgroundColor: const Color(0xFFCCE59D),
      controlsPosition: Position(
        bottom: 60.h,
        right: 0,
        left: 0,
      ),
      globalHeader: Align(
        alignment: Alignment.topCenter,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 16, right: 16),
            child: Center(child: Text('')
                // _buildImage('Logo.png', 100),
                ),
          ),
        ),
      ),
      pages: [
        PageViewModel(
          title: "Protect Our Earth",
          body:
              "Make the earth a map to real life. Life can be better if it is in the right hands and free from air and factory pollution.",
          image: _buildFullscreenImage('assets/onboarding_one.png'),
          decoration: pageDecoration.copyWith(
            contentMargin: const EdgeInsets.symmetric(horizontal: 16),
            pageColor: const Color(0xFFCCE59D),
            bodyFlex: 3,
            imageFlex: 5,
          ),
          // reverse: true,
          footer: IntroButton(
            title: 'Next',
            fun: () => _onIntroEnd(context),
          ),
        ),
        PageViewModel(
          title: 'Planting One Tree',
          body:
              "Make our Earth grow with many plants starting from planting one tree with various types of plants on our earth.",
          image: _buildFullscreenImage('assets/onboarding_one.png'),
          decoration: pageDecoration.copyWith(
            contentMargin: const EdgeInsets.symmetric(horizontal: 16),
            pageColor: const Color(0xFFCCE59D),
            bodyFlex: 3,
            imageFlex: 5,
          ),
          footer: IntroButton(
            title: 'Next',
            fun: () => _onIntroEnd(context),
          ),
        ),
        PageViewModel(
          title: "Keep Plant Health",
          body:
              "Through plants that are fertile and growing on earth we will produce extraordinary benefits and produce clean and healthy air.",
          image: _buildFullscreenImage('assets/onboarding_one.png'),
          decoration: pageDecoration.copyWith(
            contentMargin: const EdgeInsets.symmetric(horizontal: 16),
            pageColor: const Color(0xFFCCE59D),
            bodyFlex: 3,
            imageFlex: 5,
          ),
          footer: IntroButton(
            title: 'Let’s Get Started',
            fun: () => _onIntroEnd(context),
          ),
        ),
      ],
      onDone: () => _onIntroEnd(context),
      curve: Curves.fastLinearToSlowEaseIn,
      showNextButton: false,
      showDoneButton: false,
      controlsMargin: const EdgeInsets.all(16),
      controlsPadding: const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Color(0xFF90AC5A),
        activeSize: Size(22.0, 10.0),
        activeColor: Color(0xFFFC865A),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(25.0),
          ),
        ),
      ),
    );
  }
}

class IntroButton extends StatelessWidget {
  String title;
  Function? fun;
  IntroButton({required this.title, this.fun});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        fun;
      },
      child: Container(
        margin: EdgeInsets.all(16.w),
        height: 50.h,
        decoration: BoxDecoration(
          color: const Color(0xFFFC865A),
          borderRadius: BorderRadius.circular(40.r),
        ),
        child: Center(
          child: Text(
            title,
            style: GoogleFonts.inter(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
