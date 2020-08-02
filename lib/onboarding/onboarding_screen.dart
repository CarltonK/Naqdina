import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:naqdina/authentication/login_screen.dart';
import 'package:naqdina/transitions/transitions.dart';

class OnBoardingScreen extends StatefulWidget {
  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  PageController _controller;
  int _index = 0;

  Widget _appBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
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

  changePage(int index) {
    setState(() {
      _index = index;
      _controller.animateToPage(_index,
          duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
    });
  }

  Widget firstHalf() {
    return Expanded(
      child: PageView.builder(
        controller: _controller,
        onPageChanged: changePage,
        itemCount: onBoardingItemsList.length,
        itemBuilder: (context, index) =>
            Image.asset(onBoardingItemsList[index].asset),
      ),
    );
  }

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < onBoardingItemsList.length; i++) {
      list.add(i == _index ? _indicator(true) : _indicator(false));
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

  Widget secondHalf() {
    return Expanded(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          onBoardingItemsList[_index].title,
          style: GoogleFonts.raleway(
              fontSize: 24, letterSpacing: 0.5, fontWeight: FontWeight.w700),
        ),
        SizedBox(
          height: 40,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: _buildPageIndicator(),
        ),
        SizedBox(
          height: 40,
        ),
        RaisedButton(
            onPressed: () =>
                Navigator.of(context).push(SizeRoute(page: LoginScreen())),
            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
            color: Theme.of(context).primaryColor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            child: Text("Let's get started",
                style: GoogleFonts.raleway(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 18)))
      ],
    ));
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: _appBar(),
      backgroundColor: Colors.white,
      body: Container(
        height: size.height,
        width: size.width,
        child: Column(
          children: [firstHalf(), secondHalf()],
        ),
      ),
    );
  }
}

class OnBoardingItems {
  String title;
  String asset;

  OnBoardingItems({@required this.title, @required this.asset});
}

OnBoardingItems recharge = new OnBoardingItems(
    title: 'Recharge', asset: 'assets/images/onboarding/recharge.png');
OnBoardingItems bills = new OnBoardingItems(
    title: 'Pay Bills', asset: 'assets/images/onboarding/bills.png');
OnBoardingItems business = new OnBoardingItems(
    title: 'Business Overview', asset: 'assets/images/onboarding/business.png');
OnBoardingItems support = new OnBoardingItems(
    title: 'User Support', asset: 'assets/images/onboarding/support.png');

List<OnBoardingItems> onBoardingItemsList = [
  recharge,
  bills,
  business,
  support
];
