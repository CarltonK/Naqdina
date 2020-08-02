import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:naqdina/authentication/deactivated_user.dart';
import 'package:naqdina/authentication/registration_screen.dart';
import 'package:naqdina/transitions/transitions.dart';

class LoginScreen extends StatelessWidget {
  final String imgSrc = 'assets/logos/splash_logo.png';
  final _formKey = GlobalKey<FormState>();

  static String _email, _password;
  final FocusNode _focusPassword = FocusNode();

  Widget _appBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
    );
  }

  //Handle Phone Input
  void _handleSubmittedEmail(String value) {
    _email = value.trim();
    print('Email: ' + _email);
  }

  //Handle Password Input
  void _handleSubmittedPassword(String value) {
    _password = value.trim();
    print('Password: ' + _password);
  }

  String validateEmail(String value) {
    if (value.isEmpty) {
      return 'Field is required';
    }
    return null;
  }

  String validatePassword(String value) {
    if (value.isEmpty) {
      return 'Password is required';
    }
    return null;
  }

  Widget _emailTF(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        TextFormField(
            autofocus: false,
            keyboardType: TextInputType.emailAddress,
            style: GoogleFonts.raleway(textStyle: TextStyle()),
            onFieldSubmitted: (value) {
              FocusScope.of(context).requestFocus(_focusPassword);
            },
            validator: validateEmail,
            textInputAction: TextInputAction.next,
            onSaved: _handleSubmittedEmail,
            decoration: InputDecoration(
              errorBorder:
                  OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
              border: OutlineInputBorder(),
              labelText: 'Mobile Number or Email Address',
            ))
      ],
    );
  }

  Widget _passwordTF(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        TextFormField(
            autofocus: false,
            keyboardType: TextInputType.text,
            style: GoogleFonts.raleway(textStyle: TextStyle()),
            onFieldSubmitted: (value) {
              FocusScope.of(context).unfocus();
            },
            validator: validatePassword,
            obscureText: true,
            focusNode: _focusPassword,
            onSaved: _handleSubmittedPassword,
            decoration: InputDecoration(
              errorBorder:
                  OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
              border: OutlineInputBorder(),
              suffixIcon:
                  IconButton(icon: Icon(Icons.remove_red_eye), onPressed: null),
              labelText: 'Password',
            ))
      ],
    );
  }

  Widget _loginBtn(BuildContext context) {
    return MaterialButton(
      color: Theme.of(context).primaryColor,
      minWidth: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(12),
      height: 50,
      child: Center(
          child: Text(
        'LOG IN',
        style: GoogleFonts.raleway(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.5),
      )),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      onPressed: () => Navigator.of(context)
          .push(SlideLeftTransition(page: DeactivatedUser())),
    );
  }

  Widget _signUpBtn(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: FlatButton(
          onPressed: () => Navigator.of(context)
              .push(SlideLeftTransition(page: RegistrationScreen())),
          child: Text(
            'SIGN UP',
            style: GoogleFonts.raleway(
                color: Theme.of(context).primaryColor,
                fontSize: 22,
                fontWeight: FontWeight.w600),
          )),
    );
  }

  Widget _forgotPasswordBtn() {
    return Container(
      alignment: Alignment.center,
      child: FlatButton(
          onPressed: () => print('I want to reset my password'),
          child: Text(
            'Forgot your password?',
            style: GoogleFonts.raleway(fontSize: 20),
          )),
    );
  }

  Widget _backgroundColor() {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: Align(
          alignment: Alignment.topCenter,
          child: Image.asset(
            imgSrc,
            height: 75,
          )),
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.white, Colors.white],
              stops: [0.1, 0.9])),
    );
  }

  Widget _body(BuildContext context) {
    return Container(
      height: double.infinity,
      child: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 170),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Login to your account',
                style: GoogleFonts.raleway(
                    fontSize: 22, fontWeight: FontWeight.w600)),
            SizedBox(
              height: 30,
            ),
            _emailTF(context),
            SizedBox(
              height: 30,
            ),
            _passwordTF(context),
            SizedBox(
              height: 20,
            ),
            _loginBtn(context),
            SizedBox(
              height: 20,
            ),
            _signUpBtn(context),
            SizedBox(
              height: 10,
            ),
            _forgotPasswordBtn()
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
      appBar: _appBar(),
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
