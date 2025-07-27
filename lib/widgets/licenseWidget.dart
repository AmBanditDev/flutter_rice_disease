import 'package:flutter/material.dart';
import 'package:flutter_rice_disease/utils.dart';

class LicenseInfo extends StatelessWidget {
  const LicenseInfo({
    Key? key,
    required this.info,
    required this.fontsize,
  }) : super(key: key);
  final String info;
  final double fontsize;

  @override
  Widget build(BuildContext context) {
    return Text(
      info,
      style: TextStyle(fontSize: fontsize),
      textAlign: TextAlign.justify,
    );
  }
}

class LicenseTitle extends StatelessWidget {
  const LicenseTitle({
    Key? key,
    required this.title,
    required this.fontsize,
  }) : super(key: key);
  final String title;
  final double fontsize;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: fontsize,
        fontWeight: FontWeight.w500,
        color: secondColor,
      ),
    );
  }
}
