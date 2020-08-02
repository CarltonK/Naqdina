import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DeactivatedUser extends StatelessWidget {
  Widget _appBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
          icon: Icon(
            Platform.isAndroid ? Icons.arrow_back : Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () => Navigator.of(context).pop()),
    );
  }

  Widget _bottomSheet(BuildContext context) {
    return Container(
      color: Theme.of(context).accentColor,
      height: 55,
      child: Center(
        child: Text('RECHARGE OFFLINE',
            style: GoogleFonts.raleway(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold)),
      ),
    );
  }

  final String imgSrc = 'assets/images/authentication/deactivate_account.png';

  Widget imgDeactivate() {
    return Image.asset(
      imgSrc,
      height: 200,
      width: 200,
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: _appBar(context),
      backgroundColor: Colors.white,
      body: Container(
        height: size.height,
        width: size.width,
        padding: EdgeInsets.symmetric(horizontal: 40),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          imgDeactivate(),
          Text('The account is deactivated',
              style: GoogleFonts.raleway(
                  fontWeight: FontWeight.w700, fontSize: 18)),
          SizedBox(
            height: 30,
          ),
          Text(
              'Unfortunately, your account is inactive.\n'
              'Please contact your administrator',
              textAlign: TextAlign.center,
              style: GoogleFonts.raleway(fontSize: 16)),
          SizedBox(
            height: 30,
          ),
          Text('Ahmad Jafari',
              style: GoogleFonts.raleway(
                  fontWeight: FontWeight.w700, fontSize: 20)),
          SizedBox(
            height: 30,
          ),
          Text('Ahmad_J@gmail.com',
              textAlign: TextAlign.center,
              style: GoogleFonts.raleway(
                  decoration: TextDecoration.underline,
                  fontSize: 18,
                  color: Theme.of(context).primaryColor)),
          SizedBox(
            height: 30,
          ),
          Text('+93 70 022 4848',
              textAlign: TextAlign.center,
              style: GoogleFonts.raleway(
                  decoration: TextDecoration.underline,
                  fontSize: 18,
                  color: Theme.of(context).primaryColor)),
          SizedBox(
            height: 150,
          ),
        ]),
      ),
      bottomSheet: _bottomSheet(context),
    );
  }
}
