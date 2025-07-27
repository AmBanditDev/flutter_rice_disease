import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rice_disease/responsive/tablet_buttonMenu.dart';
import 'package:flutter_rice_disease/screens/setting_screen.dart';
import 'package:flutter_rice_disease/widgets/carouselIndicator.dart';

import '../utils.dart';

class TabletHomeScreen extends StatelessWidget {
  const TabletHomeScreen({key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        centerTitle: true,
        backgroundColor: firstColor,
        title: AutoSizeText(
          "ตรวจโรคข้าว",
          style: TextStyle(
            fontFamily: 'Sriracha',
            letterSpacing: 0.5,
          ),
          minFontSize: 28,
        ),
        leading: Padding(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Image.asset(
              "assets/images/logo/logo_main2.png",
              fit: BoxFit.cover,
            ),
          ),
        ),
        leadingWidth: screenWidth * 0.13,
        actions: [
          GestureDetector(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Icon(
                Icons.settings,
                size: screenWidth * 0.05,
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingScreen()),
              );
            },
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              "assets/images/bg/bg-rice3.png",
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            CustomIndicator(),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(40),
                child: GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 4,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    // crossAxisSpacing: 20,
                    mainAxisSpacing: 16,
                    childAspectRatio: 5 / 1,
                  ),
                  itemBuilder: (context, index) {
                    return TabletButtonMenu(
                      imgIcon: buttonIcon[index],
                      textButton: buttonText[index],
                      screen: buttonScreen[index],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
