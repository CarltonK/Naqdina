import 'package:flutter/material.dart';


class LayoutSizer extends StatelessWidget {
  final Widget largeScreen;
  final Widget mediumScreen;
  final Widget smallScreen;

  const LayoutSizer(
      {Key key,
        this.largeScreen,
        this.mediumScreen,
        @required this.smallScreen})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 800) return largeScreen;
        if (constraints.maxWidth < 1200 && constraints.maxWidth > 800)
          return mediumScreen ?? largeScreen;
        else
          return smallScreen ?? largeScreen;
      },
    );
  }
}
