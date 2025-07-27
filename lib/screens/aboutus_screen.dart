import 'package:flutter/material.dart';
import 'package:flutter_rice_disease/responsive/responsive_layout.dart';
import 'package:flutter_rice_disease/responsive/tablet_aboutus.dart';
import 'package:flutter_rice_disease/utils.dart';
import 'package:flutter_rice_disease/widgets/aboutUsWidget.dart';

import '../widgets/floatingButton.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileScaffold: Scaffold(
        body: Container(
          padding: const EdgeInsets.symmetric(
            vertical: 30,
            horizontal: 20,
          ),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                "assets/images/bg/bg-rice4.jpg",
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white70,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.3,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(300),
                      child: Image.asset(
                        "assets/images/logo/logo_main2.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  AboutUsTitle(
                    title: "เกี่ยวกับเรา",
                    fontsize: 22,
                  ),
                  SizedBox(height: 10),
                  AboutUsInfo(
                    info:
                        '"ตรวจโรคข้าว" เป็นแอปพลิเคชันที่ช่วยเหลือชาวนาในการจำแนกโรคข้าว วิธีการป้องกันโรคข้าว และระบุพันธุ์ข้าวแข็งแรงที่ใช้ปลูกทดแทน\nพันธุ์ข้าวเดิมที่อ่อนแอ',
                    fontsize: 16,
                  ),
                  SizedBox(height: 10),
                  AboutUsTitle(
                    title: "ผู้พัฒนา",
                    fontsize: 22,
                  ),
                  AboutUsInfo(
                    info: "นาย ปวริศ ปิ่นมณีวรรณ\nนาย ธันวบัณฑิต ยศคำลือ",
                    fontsize: 16,
                  ),
                  SizedBox(height: 10),
                  AboutUsTitle(
                    title: "อาจารย์ที่ปรึกษา",
                    fontsize: 22,
                  ),
                  AboutUsInfo(
                    info: "ผู้ช่วยศาสตราจารย์ รุจิจันทร์ วิชิวานิเวศน์",
                    fontsize: 16,
                  ),
                  SizedBox(height: 30),
                  Text(
                    "มหาวิทยาลัยราชภัฏสวนสุนันทา",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  AboutUsInfo(
                    info: "เลขที่ 1 ถ.อู่ทองนอก เขตดุสิต\n กรุงเทพมหานคร 10300",
                    fontsize: 16,
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  RichText(
                    text: TextSpan(
                      text: "ขอบพระคุณข้อมูลจาก ",
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'NotoSansThai',
                        color: Colors.black,
                      ),
                      children: [
                        TextSpan(
                          text: "กรมการข้าว",
                          style: TextStyle(
                            color: secondColor,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
        floatingActionButton: const MyFloatingActionButton(),
      ),
      tabletScaffold: TabletAboutUsScreen(),
    );
  }
}
