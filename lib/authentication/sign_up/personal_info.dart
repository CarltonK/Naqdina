import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PersonalInfo extends StatefulWidget {
  final PageController controller;
  PersonalInfo({@required this.controller});
  @override
  _PersonalInfoState createState() => _PersonalInfoState();
}

class _PersonalInfoState extends State<PersonalInfo> {
  static String _country, _town;

  Widget _introText() {
    return RichText(
        textAlign: TextAlign.center,
        text: TextSpan(children: [
          TextSpan(
              text: 'Personal Information',
              style: GoogleFonts.raleway(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 16)),
        ]));
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

  List<DropdownMenuItem> towns = [
    DropdownMenuItem(value: 'lon', child: Text('London'))
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

  Widget _townSelector() {
    return Container(
      padding: EdgeInsets.all(6),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: Colors.black.withOpacity(0.4))),
      child: DropdownButton(
        items: towns,
        underline: Divider(color: Colors.transparent),
        value: _town,
        onChanged: (value) {
          _town = value;
        },
        isExpanded: true,
      ),
    );
  }

  Widget _firstNameTF() {
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
              labelText: 'First Name',
            ))
      ],
    );
  }

  Widget _lastNameTF() {
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
              labelText: 'Last Name',
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
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
          physics: AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [
              _introText(),
              SizedBox(
                height: 30,
              ),
              _firstNameTF(),
              SizedBox(
                height: 20,
              ),
              _lastNameTF(),
              SizedBox(
                height: 20,
              ),
              _countrySelector(),
              SizedBox(
                height: 20,
              ),
              _townSelector(),
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
