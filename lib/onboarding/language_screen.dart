import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:naqdina/layout.dart';
import 'package:naqdina/onboarding/onboarding_screen.dart';
import 'package:naqdina/transitions/transitions.dart';

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutSizer(smallScreen: MobileLanguage());
  }
}

class MobileLanguage extends StatelessWidget {
  Widget _appBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
    );
  }

  Widget _image() {
    return Image.asset(
      _imgSrc,
      height: 120,
      width: 120,
      fit: BoxFit.contain,
    );
  }

  Widget _introText() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('Welcome to Naqdina App',
            style:
                GoogleFonts.raleway(fontWeight: FontWeight.bold, fontSize: 25)),
        SizedBox(
          height: 20,
        ),
        Text('Choose your preferred language',
            style: GoogleFonts.raleway(fontSize: 18))
      ],
    );
  }

  final String _imgSrc = 'assets/images/language/language.png';
  final String _imgUk = 'assets/images/language/uk_flag.png';

  final List<String> _allLanguages = ['Dari (Farsi)', 'English', 'Pashtoo'];

  Widget _singleLanguage(int index) {
    return Column(
      children: [
        ListTile(
            leading: Image.asset(_imgUk),
            trailing: Container(
                padding: EdgeInsets.all(2),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.green,
                ),
                child: Icon(
                  Icons.done,
                  color: Colors.white,
                )),
            title: Text(
              _allLanguages[index],
              style: GoogleFonts.raleway(fontWeight: FontWeight.w600),
            )),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Divider(
            height: 2,
            color: Colors.black.withOpacity(0.4),
          ),
        )
      ],
    );
  }

  Widget _listLanguages(Size size) {
    return LimitedBox(
      maxHeight: size.height * 0.25,
      child: ListView.builder(
        itemCount: _allLanguages.length,
        itemBuilder: (context, index) => _singleLanguage(index),
      ),
    );
  }

  Widget _continueBtn(Size size, BuildContext context) {
    return MaterialButton(
      minWidth: size.width * 0.8,
      height: 50,
      // padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Text('CONTINUE',
          style: GoogleFonts.raleway(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      color: Colors.pink,
      onPressed: () => Navigator.of(context)
          .push(SlideLeftTransition(page: OnBoardingScreen())),
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: _appBar(),
      backgroundColor: Colors.white,
      body: Container(
        height: size.height,
        width: size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _image(),
            SizedBox(
              height: 40,
            ),
            _introText(),
            SizedBox(
              height: 40,
            ),
            _listLanguages(size),
            _continueBtn(size, context),
          ],
        ),
      ),
    );
  }
}
