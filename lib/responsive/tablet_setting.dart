import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rice_disease/responsive/tablet_aboutus.dart';
import 'package:flutter_rice_disease/responsive/tablet_howToUse.dart';
import 'package:flutter_rice_disease/responsive/tablet_license.dart';
import 'package:flutter_rice_disease/screens/aboutus_screen.dart';
import 'package:flutter_rice_disease/screens/howtouse_screen.dart';
import 'package:flutter_rice_disease/screens/license_screen.dart';
import 'package:flutter_rice_disease/utils.dart';

class TabletSettingScreen extends StatelessWidget {
  const TabletSettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: firstColor,
        title: Text(
          "การตั้งค่า",
          style: TextStyle(fontSize: 22),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: ListView(
          children: [
            ListTileMenu(
              title: "วิธีการใช้งานแอปพลิเคชันตรวจโรคข้าว",
              screen: TabletHowToUseScreen(),
            ),
            ListTileMenu(
              title: "ข้อตกลงในการใช้ซอฟต์แวร์",
              screen: TabletLicenseScreen(),
            ),
            ListTileMenu(
              title: "เกี่ยวกับเรา",
              screen: TabletAboutUsScreen(),
            ),
          ],
        ),
      ),
    );
  }
}

class ListTileMenu extends StatelessWidget {
  const ListTileMenu({
    Key? key,
    required this.title,
    required this.screen,
  }) : super(key: key);
  final String title;
  final Widget screen;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: AutoSizeText(
        title,
        minFontSize: 18,
      ),
      trailing: Icon(Icons.arrow_forward_ios_outlined, size: 20),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => screen,
          ),
        );
      },
    );
  }
}
