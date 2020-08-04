import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:naqdina/authentication/sign_up/sign_up_page.dart';
import 'package:naqdina/transitions/transitions.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final FocusNode _focusSecondary = FocusNode();
  static String _country, _primary, _secondary;

  Widget _appBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      title: Text(
        'Create a new agent\'s account',
        style: GoogleFonts.raleway(color: Colors.black),
      ),
      leading: IconButton(
          icon: Icon(
            Platform.isAndroid ? Icons.arrow_back : Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () => Navigator.of(context).pop()),
    );
  }

  Widget _backgroundColor() {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.white, Colors.white],
              stops: [0.1, 0.9])),
    );
  }

  Widget _primaryTF(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        TextFormField(
            autofocus: false,
            keyboardType: TextInputType.phone,
            style: GoogleFonts.raleway(textStyle: TextStyle()),
            onFieldSubmitted: (value) {
              FocusScope.of(context).requestFocus(_focusSecondary);
            },
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              errorBorder:
                  OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
              border: OutlineInputBorder(),
              prefix: Text('+93 '),
              prefixStyle: GoogleFonts.raleway(fontSize: 20),
              labelText: 'Primary Number',
            ))
      ],
    );
  }

  Widget _secondaryTF(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        TextFormField(
            autofocus: false,
            keyboardType: TextInputType.phone,
            style: GoogleFonts.raleway(textStyle: TextStyle()),
            onFieldSubmitted: (value) {
              FocusScope.of(context).unfocus();
            },
            focusNode: _focusSecondary,
            decoration: InputDecoration(
              errorBorder:
                  OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
              border: OutlineInputBorder(),
              prefix: Text('+93 '),
              prefixStyle: GoogleFonts.raleway(fontSize: 20),
              labelText: 'Secondary Number',
            ))
      ],
    );
  }

  Widget _registerBtn(BuildContext context) {
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
          Navigator.of(context).push(SlideLeftTransition(page: SignUpScreen())),
    );
  }

  Widget _loginInBtn(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: FlatButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(
            'LOG IN',
            style: GoogleFonts.raleway(
                color: Theme.of(context).primaryColor,
                fontSize: 22,
                fontWeight: FontWeight.w600),
          )),
    );
  }

  List<DropdownMenuItem> items = [
    DropdownMenuItem(
        value: 'uk',
        child: Row(
          children: [
            Image.asset('assets/images/language/uk_flag.png'),
            SizedBox(
              width: 10,
            ),
            Text('United Kingdom (UK)')
          ],
        ))
  ];

  Widget _countrySelector() {
    return Container(
      padding: EdgeInsets.all(6),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: Colors.black.withOpacity(0.4))),
      child: DropdownButton(
        items: items,
        underline: Divider(color: Colors.transparent),
        value: _country,
        onChanged: (value) {
          _country = value;
        },
        isExpanded: true,
        hint: Text('Please select your country'),
      ),
    );
  }

  Widget _body(BuildContext context) {
    return Container(
      height: double.infinity,
      child: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 30,
            ),
            _countrySelector(),
            SizedBox(
              height: 20,
            ),
            _primaryTF(context),
            SizedBox(
              height: 20,
            ),
            _secondaryTF(context),
            SizedBox(
              height: 20,
            ),
            Text(
                "Explanation of why the user needs a second phone number and investment account on two or maybe even three long string",
                textAlign: TextAlign.center,
                style: GoogleFonts.raleway(fontSize: 18)),
            SizedBox(
              height: 20,
            ),
            _registerBtn(context),
            SizedBox(
              height: 20,
            ),
            Text("Already have an account ?",
                textAlign: TextAlign.center,
                style: GoogleFonts.raleway(fontSize: 18)),
            _loginInBtn(context)
          ],
        ),
      ),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      backgroundColor: Colors.white,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Stack(
          children: [_backgroundColor(), _body(context)],
        ),
      ),
      bottomSheet: _bottomSheet(context),
    );
  }
}
