import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:naqdina/authentication/login_screen.dart';
import 'package:naqdina/transitions/transitions.dart';

class ResetSuccess extends StatelessWidget {
  final String imgSrc = 'assets/images/authentication/password.png';
  Widget _appBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
    );
  }

  Widget image(String url) {
    return Image.asset(
      url,
      height: 200,
      width: 200,
    );
  }

  Widget _gotoLogin(BuildContext context) {
    return MaterialButton(
      color: Theme.of(context).primaryColor,
      minWidth: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(12),
      height: 50,
      child: Center(
          child: Text(
        'GO TO LOG IN',
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
        padding: EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            image(imgSrc),
            Text(
              'Success!',
              style: GoogleFonts.raleway(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              'Your password has been updated.\n'
              'Please log in with your new password',
              textAlign: TextAlign.center,
              style: GoogleFonts.raleway(
                color: Colors.black,
                fontSize: 18,
              ),
            ),
            _gotoLogin(context)
          ],
        ),
      ),
    );
  }
}
