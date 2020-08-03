import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CodePage extends StatefulWidget {
  final PageController controller;
  CodePage({@required this.controller});

  @override
  _CodePageState createState() => _CodePageState();
}

class _CodePageState extends State<CodePage> {
  Widget _codeText() {
    return RichText(
        textAlign: TextAlign.center,
        text: TextSpan(children: [
          TextSpan(
              text: 'Enter the 6 digit code sent to\n',
              style: GoogleFonts.raleway(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 16)),
          TextSpan(
              text: '+93 01 23 45 67 89',
              style: GoogleFonts.raleway(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 16))
        ]));
  }

  Widget _phoneTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        TextFormField(
            autofocus: false,
            keyboardType: TextInputType.phone,
            style: GoogleFonts.raleway(textStyle: TextStyle()),
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              errorBorder:
                  OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
              border: OutlineInputBorder(),
              prefix: Text('+93 '),
              prefixStyle: GoogleFonts.raleway(fontSize: 20),
              labelText: 'Mobile Number',
            ))
      ],
    );
  }

  Widget _numberTwoNextBtn() {
    return MaterialButton(
      color: Theme.of(context).primaryColor,
      minWidth: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(12),
      height: 50,
      child: Center(
          child: Text(
        'NEXT',
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

  Widget _resendCode() {
    return FlatButton(
        onPressed: () => print('I want to resend the code'),
        child: Text('RESEND THE CODE',
            style: GoogleFonts.raleway(
                color: Colors.grey,
                fontWeight: FontWeight.w600,
                fontSize: 18,
                letterSpacing: 0.5)));
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
              _codeText(),
              SizedBox(
                height: 30,
              ),
              _phoneTF(),
              SizedBox(
                height: 20,
              ),
              _resendCode(),
              SizedBox(
                height: 20,
              ),
              _numberTwoNextBtn()
            ],
          ),
        ),
      ),
    );
  }
}
