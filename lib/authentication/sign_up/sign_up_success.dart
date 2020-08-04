import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:naqdina/authentication/login_screen.dart';
import 'package:naqdina/transitions/transitions.dart';

class SignUpSuccess extends StatelessWidget {
  final String imgSrc = 'assets/images/authentication/congrats.png';
  Widget _appBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
    );
  }

  Widget image(String url) {
    return Image.asset(
      url,
      fit: BoxFit.cover,
      height: 200,
      width: 200,
    );
  }

  Widget _continue(BuildContext context) {
    return MaterialButton(
      color: Theme.of(context).primaryColor,
      minWidth: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(12),
      height: 50,
      child: Center(
          child: Text(
        'CONTINUE',
        style: GoogleFonts.raleway(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.5),
      )),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      onPressed: () =>
          Navigator.of(context).push(SlideLeftTransition(page: LoginScreen())),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      backgroundColor: Colors.white,
      body: Container(
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            image(imgSrc),
            Text(
              'Congratulations!',
              textAlign: TextAlign.center,
              style: GoogleFonts.raleway(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              'Now you can sign in to your personal account in Naqdina Mobile App and Web Portal',
              textAlign: TextAlign.center,
              style: GoogleFonts.raleway(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w600),
            ),
            Text(
              'To get full access to all features you need to confirm your KYC. To upload documents you will be redirected to the page:',
              textAlign: TextAlign.center,
              style: GoogleFonts.raleway(
                fontSize: 18,
              ),
            ),
            Text(
              'My Account / My KYC',
              textAlign: TextAlign.center,
              style: GoogleFonts.raleway(
                  color: Theme.of(context).primaryColor,
                  fontSize: 20,
                  fontWeight: FontWeight.w700),
            ),
            Text(
              'Thank you for being with us!',
              textAlign: TextAlign.center,
              style: GoogleFonts.raleway(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w600),
            ),
            _continue(context)
          ],
        ),
      ),
    );
  }
}
