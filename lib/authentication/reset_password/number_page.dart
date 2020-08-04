import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NumberPage extends StatefulWidget {
  final PageController controller;
  NumberPage({@required this.controller});
  @override
  _NumberPageState createState() => _NumberPageState();
}

class _NumberPageState extends State<NumberPage> {
  String _country;

  Widget _supportText() {
    return RichText(
        textAlign: TextAlign.center,
        text: TextSpan(children: [
          TextSpan(
              text: 'To recover your password enter your\n',
              style: GoogleFonts.raleway(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 16)),
          TextSpan(
              text: 'mobile number or contact our ',
              style: GoogleFonts.raleway(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 16)),
          TextSpan(
              text: 'support',
              style: GoogleFonts.raleway(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 16))
        ]));
  }

  List<DropdownMenuItem> items = [
    DropdownMenuItem(
        value: 'uk',
        child: Row(
          children: [
            Image.asset('assets/images/language/uk_flag.png'),
          ],
        ))
  ];

  Widget _countryDropDown() {
    return Container(
      padding: EdgeInsets.all(6),
      width: MediaQuery.of(context).size.width * .25,
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
      ),
    );
  }

  Widget _phoneTF() {
    return TextFormField(
        autofocus: false,
        keyboardType: TextInputType.phone,
        style: GoogleFonts.raleway(textStyle: TextStyle()),
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          errorBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
          border: OutlineInputBorder(),
          prefix: Text('+93 '),
          prefixStyle: GoogleFonts.raleway(fontSize: 20),
          labelText: 'Mobile Number',
        ));
  }

  Widget _numberOneNextBtn() {
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

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Container(
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
          child: Column(
            children: [
              _supportText(),
              SizedBox(
                height: 30,
              ),
              SizedBox(
                height: 60,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    _countryDropDown(),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(child: _phoneTF())
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              _numberOneNextBtn()
            ],
          ),
        ),
      ),
    );
  }
}
