import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:naqdina/authentication/reset_password/reset_success_page.dart';
import 'package:naqdina/transitions/transitions.dart';

class ResetPage extends StatefulWidget {
  final PageController controller;
  ResetPage({@required this.controller});

  @override
  _ResetPageState createState() => _ResetPageState();
}

class _ResetPageState extends State<ResetPage> {
  bool _isObscured = true;
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

  Widget _resetBtn() {
    return MaterialButton(
      color: Theme.of(context).primaryColor,
      minWidth: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(12),
      height: 50,
      child: Center(
          child: Text(
        'RESET',
        style: GoogleFonts.raleway(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.5),
      )),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      onPressed: () =>
          Navigator.of(context).push(SlideUpTransition(page: ResetSuccess())),
    );
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
              _passwordTF(),
              SizedBox(
                height: 20,
              ),
              _confirmPasswordTF(),
              SizedBox(
                height: 20,
              ),
              _resetBtn()
            ],
          ),
        ),
      ),
    );
  }
}
