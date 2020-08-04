import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BusinessInfo extends StatefulWidget {
  final PageController controller;
  BusinessInfo({@required this.controller});
  @override
  _BusinessInfoState createState() => _BusinessInfoState();
}

class _BusinessInfoState extends State<BusinessInfo> {
  static String _type;

  Widget _introText() {
    return RichText(
        textAlign: TextAlign.center,
        text: TextSpan(children: [
          TextSpan(
              text: 'Business Information',
              style: GoogleFonts.raleway(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 16)),
        ]));
  }

  Widget _addressTF() {
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
              labelText: 'Address',
            ))
      ],
    );
  }

  Widget _nameTF() {
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
              labelText: 'Shop/Business Name',
            ))
      ],
    );
  }

  List<DropdownMenuItem> types = [
    DropdownMenuItem(value: 'ngo', child: Text('NGO'))
  ];

  Widget _typeSelector() {
    return Container(
      padding: EdgeInsets.all(6),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: Colors.black.withOpacity(0.4))),
      child: DropdownButton(
        items: types,
        underline: Divider(color: Colors.transparent),
        value: _type,
        onChanged: (value) {
          _type = value;
        },
        isExpanded: true,
        hint: Text('Type'),
      ),
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
              _addressTF(),
              SizedBox(
                height: 20,
              ),
              _nameTF(),
              SizedBox(
                height: 20,
              ),
              _typeSelector(),
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
