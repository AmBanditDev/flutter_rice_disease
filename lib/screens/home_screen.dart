import 'package:flutter/material.dart';
import 'package:flutter_rice_disease/screens/setting_screen.dart';
import 'package:flutter_rice_disease/utils.dart';
import 'package:flutter_rice_disease/widgets/buttonMenu.dart';
import 'package:flutter_rice_disease/widgets/carouselIndicator.dart';

import '../responsive/responsive_layout.dart';
import '../responsive/tablet_home.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileScaffold: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: firstColor,
          title: Text(
            "ตรวจโรคข้าว",
            style: TextStyle(
              fontSize: 24,
              fontFamily: 'Sriracha',
              letterSpacing: 0.5,
            ),
          ),
          leading: Container(
            padding: EdgeInsets.all(8),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.asset(
                "assets/images/logo/logo_main2.png",
                fit: BoxFit.cover,
              ),
            ),
          ),
          actions: [
            GestureDetector(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.settings,
                  size: 36,
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
                  padding: const EdgeInsets.all(20),
                  child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 4,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      // childAspectRatio: 1 / 1,
                    ),
                    itemBuilder: (context, index) {
                      return ButtonMenu(
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
      ),
      tabletScaffold: const TabletHomeScreen(),
    );
  }
}
