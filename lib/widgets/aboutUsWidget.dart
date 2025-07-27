import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rice_disease/utils.dart';

class AboutUsInfo extends StatelessWidget {
  const AboutUsInfo({
    Key? key,
    required this.info,
    required this.fontsize,
  }) : super(key: key);

  final String info;
  final double fontsize;

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      info,
      style: TextStyle(
        // fontSize: 16,
        fontWeight: FontWeight.w500,
        color: fontColor,
      ),
      textAlign: TextAlign.center,
      minFontSize: fontsize,
      maxLines: 3,
    );
  }
}

class AboutUsTitle extends StatelessWidget {
  const AboutUsTitle({
    Key? key,
    required this.title,
    required this.fontsize,
  }) : super(key: key);
  final String title;
  final double fontsize;

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      title,
      style: TextStyle(
        fontWeight: FontWeight.w600,
        color: secondColor,
      ),
      minFontSize: fontsize,
    );
  }
}
