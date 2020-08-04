import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:naqdina/authentication/sign_up/sign_up_success.dart';
import 'package:naqdina/transitions/transitions.dart';

class PinInfo extends StatefulWidget {
  @override
  _PinInfoState createState() => _PinInfoState();
}

class _PinInfoState extends State<PinInfo> {
  Widget _introText() {
    return RichText(
        textAlign: TextAlign.center,
        text: TextSpan(children: [
          TextSpan(
              text:
                  'Create your PIN for Transaction authorization in Naqdina System',
              style: GoogleFonts.raleway(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 16)),
        ]));
  }

  Widget _pinTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        TextFormField(
            autofocus: false,
            keyboardType: TextInputType.text,
            style: GoogleFonts.raleway(textStyle: TextStyle()),
            textInputAction: TextInputAction.done,
            decoration: InputDecoration(
              errorBorder:
                  OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
              border: OutlineInputBorder(),
              prefixStyle: GoogleFonts.raleway(fontSize: 20),
              labelText: 'PIN',
            ))
      ],
    );
  }

    Widget _completeBtn() {
    return MaterialButton(
      color: Theme.of(context).primaryColor,
      minWidth: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(12),
      height: 50,
      child: Center(
          child: Text(
        'COMPLETE',
        style: GoogleFonts.raleway(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.5),
      )),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      onPressed: () => Navigator.of(context).push(SlideUpTransition(page: SignUpSuccess())),
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
              _introText(),
              SizedBox(
                height: 30,
              ),
              _pinTF(),
              SizedBox(
                height: 20,
              ),
              _completeBtn()
            ],
          ),
        ),
      ),
    );
  }
}
