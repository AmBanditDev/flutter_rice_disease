import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rice_disease/utils.dart';

class TabletButtonMenu extends StatelessWidget {
  const TabletButtonMenu({
    key,
    // required this.icon,
    required this.imgIcon,
    required this.textButton,
    required this.screen,
  });

  // final IconData icon;
  final String imgIcon;
  final String textButton;
  final screen;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => screen),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.lightGreen[50],
          border: Border.all(color: firstColor, width: 5),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(
                5.0,
                5.0,
              ),
              blurRadius: 8.0,
              spreadRadius: 1.0,
            ), //BoxShadow
            BoxShadow(
              color: Colors.white,
              offset: Offset(0.0, 0.0),
              blurRadius: 0.0,
              spreadRadius: 0.0,
            ), //BoxShadow
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imgIcon,
              width: MediaQuery.of(context).size.width * 0.1,
            ),
            const SizedBox(width: 26),
            SizedBox(
              child: AutoSizeText(
                textButton,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
                minFontSize: 24,
                maxLines: 2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
