import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:naqdina/authentication/reset_password/code_page.dart';
import 'package:naqdina/authentication/reset_password/number_page.dart';
import 'package:naqdina/authentication/sign_up/business_info.dart';
import 'package:naqdina/authentication/sign_up/credentials_info.dart';
import 'package:naqdina/authentication/sign_up/personal_info.dart';
import 'package:naqdina/authentication/sign_up/pin_info.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  PageController _controller;
  int _currentPage = 0;
  int _numPages = 5;

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
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: _buildPageIndicator(),
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
    return Container(
      color: Colors.white,
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: PageView(
        controller: _controller,
        // physics: NeverScrollableScrollPhysics(),
        onPageChanged: changePage,
        children: [
          CodePage(controller: _controller),
          PersonalInfo(
            controller: _controller,
          ),
          BusinessInfo(
            controller: _controller,
          ),
          CredentialsInfo(
            controller: _controller,
          ),
          PinInfo()
        ],
      ),
    );
  }

  Widget _appAnimation() {
    return SliverAppBar(
      backgroundColor: Colors.white,
      leading: IconButton(
        icon: Icon(Platform.isAndroid ? Icons.arrow_back : Icons.arrow_back_ios,
            color: Colors.black),
        onPressed: () => Navigator.of(context).pop(),
      ),
      floating: true,
      pinned: true,
      expandedHeight: 160,
      flexibleSpace: FlexibleSpaceBar(
        background: _indicatorTop(MediaQuery.of(context).size),
        collapseMode: CollapseMode.parallax,
        title: Text(
          'Sign Up',
          style: GoogleFonts.raleway(color: Colors.black),
        ),
        centerTitle: true,
      ),
    );
  }

  Widget _bodyAnimation() {
    return SliverFixedExtentList(
        delegate: SliverChildListDelegate([_pageViews()]), itemExtent: 500);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [_appAnimation(), _bodyAnimation()],
      ),
    );
  }
}
