import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CredentialsInfo extends StatefulWidget {
  final PageController controller;
  CredentialsInfo({@required this.controller});
  @override
  _CredentialsInfoState createState() => _CredentialsInfoState();
}

class _CredentialsInfoState extends State<CredentialsInfo> {
  static String _email;
  final FocusNode _focusPassword = FocusNode();
  bool _isObscured = true;
  bool _agreeTerms = false;

  static String _confirmPassword, _password;
  final TextEditingController _passwording = TextEditingController();
  final TextEditingController _confirmPass = TextEditingController();

  final FocusNode _focusConfirm = FocusNode();

  void _handleSubmittedPassword(String value) {
    _password = value.trim();
    print('New Password: ' + _password);
  }

  void _handleSubmittedConfirmPassword(String value) {
    _password = value.trim();
    print('Confirm Password: ' + _password);
  }

  String validatePassword(String value) {
    if (value.isEmpty) {
      return 'Password is required';
    }
    return null;
  }

  String validateConfirmPassword(String value) {
    if (value.isEmpty) {
      return 'Password is required';
    }
    if (value != _passwording.text) {
      return 'Passwords do not match';
    }
    return null;
  }

  Widget _passwordTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        TextFormField(
            autofocus: false,
            controller: _passwording,
            keyboardType: TextInputType.text,
            style: GoogleFonts.raleway(textStyle: TextStyle()),
            onFieldSubmitted: (value) {
              FocusScope.of(context).requestFocus(_focusConfirm);
            },
            textInputAction: TextInputAction.next,
            validator: validatePassword,
            obscureText: _isObscured,
            onSaved: _handleSubmittedPassword,
            decoration: InputDecoration(
              errorBorder:
                  OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
              border: OutlineInputBorder(),
              suffixIcon: IconButton(
                icon: Icon(Icons.remove_red_eye),
                onPressed: () {
                  setState(() {
                    _isObscured = !_isObscured;
                  });
                },
              ),
              labelText: 'New Password',
            ))
      ],
    );
  }

  Widget _confirmPasswordTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        TextFormField(
            autofocus: false,
            controller: _confirmPass,
            keyboardType: TextInputType.text,
            style: GoogleFonts.raleway(textStyle: TextStyle()),
            onFieldSubmitted: (value) {
              FocusScope.of(context).unfocus();
            },
            validator: validateConfirmPassword,
            obscureText: _isObscured,
            focusNode: _focusConfirm,
            onSaved: _handleSubmittedConfirmPassword,
            decoration: InputDecoration(
              errorBorder:
                  OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
              border: OutlineInputBorder(),
              suffixIcon: IconButton(
                icon: Icon(Icons.remove_red_eye),
                onPressed: () {
                  setState(() {
                    _isObscured = !_isObscured;
                  });
                },
              ),
              labelText: 'Confirm Password',
            ))
      ],
    );
  }

  Widget _introText() {
    return RichText(
        textAlign: TextAlign.center,
        text: TextSpan(children: [
          TextSpan(
              text: 'Enter Your Credentials',
              style: GoogleFonts.raleway(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 16)),
        ]));
  }

  void _handleSubmittedEmail(String value) {
    _email = value.trim();
    print('Email: ' + _email);
  }

  String validateEmail(String value) {
    if (value.isEmpty) {
      return 'Field is required';
    }
    return null;
  }

  Widget _emailTF() {
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
              labelText: 'Email Address (Optional)',
            ))
      ],
    );
  }

  Widget _nextBtn() {
    return MaterialButton(
      color: Theme.of(context).primaryColor,
      minWidth: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(12),
      height: 50,
      child: Center(
          child: Text(
        'SIGN UP',
        style: GoogleFonts.raleway(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.5),
      )),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      onPressed: () => widget.controller.nextPage(
          duration: Duration(milliseconds: 250), curve: Curves.decelerate),
    );
  }

  Widget _acceptTerms() {
    return Row(
      children: [
        Checkbox(
          value: _agreeTerms,
          onChanged: agreeTermsChanger,
          activeColor: Theme.of(context).primaryColor,
        ),
        SizedBox(width: 10),
        Expanded(child: _legalText())
      ],
    );
  }

  Widget _legalText() {
    return RichText(
        text: TextSpan(children: [
      TextSpan(
          text: 'By signing up to create an account, I accept Naqdina\'s ',
          style: GoogleFonts.raleway(
              color: Colors.black, fontWeight: FontWeight.w600, fontSize: 12)),
      TextSpan(
          text: 'Terms of Use',
          style: GoogleFonts.raleway(
            color: Theme.of(context).primaryColor,
            fontWeight: FontWeight.w600,
          )),
      TextSpan(
          text: ' and ',
          style: GoogleFonts.raleway(
              color: Colors.black, fontWeight: FontWeight.w600, fontSize: 12)),
      TextSpan(
          text: 'Privacy Policy',
          style: GoogleFonts.raleway(
            color: Theme.of(context).primaryColor,
            fontWeight: FontWeight.w600,
          )),
    ]));
  }

  agreeTermsChanger(bool value) {
    setState(() {
      _agreeTerms = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Container(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
          physics: AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [
              _introText(),
              SizedBox(
                height: 30,
              ),
              _emailTF(),
              SizedBox(
                height: 20,
              ),
              _passwordTF(),
              SizedBox(
                height: 20,
              ),
              _confirmPasswordTF(),
              SizedBox(
                height: 20,
              ),
              _acceptTerms(),
              SizedBox(
                height: 20,
              ),
              _nextBtn()
            ],
          ),
        ),
      ),
    );
  }
}
