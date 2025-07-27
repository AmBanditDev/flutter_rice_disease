import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rice_disease/screens/home_screen.dart';
import 'package:flutter_rice_disease/utils.dart';

class TabletSplashScreen extends StatefulWidget {
  const TabletSplashScreen({Key? key}) : super(key: key);

  @override
  State<TabletSplashScreen> createState() => _TabletSplashScreenState();
}

class _TabletSplashScreenState extends State<TabletSplashScreen> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bg/bg-rice.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.5,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                  image: DecorationImage(
                    image: AssetImage(
                      "assets/images/bg/bg-farmer.jpg",
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                height: screenHeight * 0.2,
                child: ClipRRect(
                  child: Image.asset(
                    "assets/images/logo/logo_main2.png",
                    fit: BoxFit.cover,
                  ),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(300),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      blurRadius: 8,
                      spreadRadius: 6,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.4,
                padding: const EdgeInsets.all(40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AutoSizeText(
                      "ตรวจโรคข้าว",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Sriracha',
                        letterSpacing: 1,
                        color: firstColor,
                      ),
                      minFontSize: 42,
                    ),
                    AutoSizeText(
                      "แอปพลิเคชั่นช่วยเหลือชาวนาในการจำแนกโรคข้าว\nวิธีการป้องกันโรคข้าว และระบุพันธุ์ข้าวแข็งแรง\nที่ใช้ปลูกทดแทนข้าวเดิมที่อ่อนแอ",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: fontColor,
                      ),
                      minFontSize: 26,
                      maxLines: 3,
                    ),
                    const SizedBox(height: 10),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomeScreen(),
                          ),
                        );
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: double.infinity,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: firstColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: AutoSizeText(
                          "เริ่มต้นใช้งาน",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                          minFontSize: 26,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
