import 'package:flutter/material.dart';
import 'package:flutter_rice_disease/responsive/responsive_layout.dart';
import 'package:flutter_rice_disease/responsive/tablet_setting.dart';
import 'package:flutter_rice_disease/screens/aboutus_screen.dart';
import 'package:flutter_rice_disease/screens/howtouse_screen.dart';
import 'package:flutter_rice_disease/screens/license_screen.dart';
import 'package:flutter_rice_disease/utils.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileScaffold: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: firstColor,
          title: Text(
            "การตั้งค่า",
            style: TextStyle(fontSize: 20),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: ListView(
            children: [
              ListTile(
                title: Text("วิธีการใช้งานแอปพลิเคชันตรวจโรคข้าว"),
                trailing: Icon(Icons.arrow_forward_ios_outlined, size: 16),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HowToUseScreen(),
                    ),
                  );
                },
              ),
              ListTile(
                title: Text("ข้อตกลงในการใช้ซอฟต์แวร์"),
                trailing: Icon(Icons.arrow_forward_ios_outlined, size: 16),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LicenseScreen(),
                    ),
                  );
                },
              ),
              ListTile(
                title: Text("เกี่ยวกับเรา"),
                trailing: Icon(Icons.arrow_forward_ios_outlined, size: 16),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AboutUsScreen(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      tabletScaffold: TabletSettingScreen(),
    );
  }
}
