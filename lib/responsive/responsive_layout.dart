import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget mobileScaffold;
  final Widget tabletScaffold;

  ResponsiveLayout({
    required this.mobileScaffold,
    required this.tabletScaffold,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 576) {
          return mobileScaffold;
        } else {
          return tabletScaffold;
        }
      },
    );
  }
}
