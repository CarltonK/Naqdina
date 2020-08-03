import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:naqdina/authentication/reset_password/code_page.dart';
import 'package:naqdina/authentication/reset_password/number_page.dart';
import 'package:naqdina/authentication/reset_password/reset_page.dart';

class ForgotPasswordScreen extends StatefulWidget {
  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  PageController _controller;
  int _currentPage = 0;
  int _numPages = 3;

  Widget _appBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      title: Text(
        'Password Recovery',
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

  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _numPages; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      margin: EdgeInsets.symmetric(horizontal: 8),
      height: 14,
      width: 14,
      decoration: BoxDecoration(
          color: isActive
              ? Theme.of(context).primaryColor
              : Theme.of(context).primaryColor.withOpacity(0.4),
          borderRadius: BorderRadius.circular(12)),
    );
  }

  Widget _indicatorTop(Size size) {
    return Container(
      height: size.height * 0.15,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: _buildPageIndicator(),
      ),
    );
  }

  changePage(int value) {
    setState(() {
      _currentPage = value;
      _controller.animateToPage(_currentPage,
          duration: Duration(milliseconds: 250), curve: Curves.easeInOut);
    });
  }

  Widget _pageViews() {
    return Expanded(
        child: PageView(
      controller: _controller,
      physics: NeverScrollableScrollPhysics(),
      onPageChanged: changePage,
      children: [
        NumberPage(
          controller: _controller,
        ),
        CodePage(
          controller: _controller,
        ),
        ResetPage(
          controller: _controller,
        )
      ],
    ));
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: _appBar(context),
      backgroundColor: Colors.white,
      body: Container(
        height: size.height,
        width: double.infinity,
        child: Column(
          children: [_indicatorTop(size), _pageViews()],
        ),
      ),
    );
  }
}
