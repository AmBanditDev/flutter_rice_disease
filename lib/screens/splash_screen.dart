import 'package:flutter/material.dart';
import 'package:flutter_rice_disease/responsive/responsive_layout.dart';
import 'package:flutter_rice_disease/responsive/tablet_splashScreen.dart';
import 'package:flutter_rice_disease/utils.dart';
import 'package:flutter_rice_disease/screens/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return ResponsiveLayout(
      mobileScaffold: Scaffold(
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
                    borderRadius: BorderRadius.circular(100),
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
                        spreadRadius: 4,
                        offset: const Offset(0, 0),
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.4,
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "ตรวจโรคข้าว",
                        style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Sriracha',
                          letterSpacing: 1,
                          color: firstColor,
                        ),
                      ),
                      Text(
                        "แอปพลิเคชั่นช่วยเหลือชาวนาในการจำแนก\nโรคข้าว วิธีการป้องกันโรคข้าว และระบุพันธุ์ข้าวแข็งแรงที่ใช้ปลูกทดแทนข้าวเดิมที่อ่อนแอ",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: fontColor,
                        ),
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
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: firstColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Text(
                            "เริ่มต้นใช้งาน",
                            style: TextStyle(
                              fontSize: 24,
                              color: Colors.white,
                            ),
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
      ),
      tabletScaffold: TabletSplashScreen(),
    );
  }
}
