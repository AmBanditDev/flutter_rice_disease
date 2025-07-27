import 'package:flutter/material.dart';
import 'package:flutter_rice_disease/utils.dart';
import 'package:flutter_rice_disease/widgets/myStepper.dart';

class TabletHowToUseScreen extends StatefulWidget {
  const TabletHowToUseScreen({Key? key}) : super(key: key);

  @override
  State<TabletHowToUseScreen> createState() => _TabletHowToUseScreenState();
}

class _TabletHowToUseScreenState extends State<TabletHowToUseScreen> {
  List<String> titles = <String>[
    'การถ่ายภาพ',
    'การเลือกภาพ',
    'ค้นหาทั่วไป',
  ];
  int tabsCount = 3;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: tabsCount,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: firstColor,
          title: Text(
            "วิธีการใช้งานแอปพลิเคชั่น",
            style: TextStyle(fontSize: 22),
          ),
          shadowColor: Theme.of(context).shadowColor,
          bottom: TabBar(
            labelStyle: TextStyle(
              fontSize: 20,
              fontFamily: 'NotoSansThai',
            ),
            unselectedLabelStyle: TextStyle(
              fontSize: 20,
              fontFamily: 'NotoSansThai',
            ),
            tabs: <Widget>[
              Tab(text: titles[0]),
              Tab(text: titles[1]),
              Tab(text: titles[2]),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            myStepper(
              title_stepper: [
                'เลือกเมนูการถ่ายภาพตรวจโรคข้าว',
                'เมื่อเข้าสู่หน้าเตรียมถ่ายภาพ ให้กดปุ่มถ่ายภาพ',
                'ส่องกล้องไปที่ใบข้าวที่ท่านต้องการตรวจโรคข้าว',
                'เมื่อถ่ายภาพเสร็จ จะมีปุ่มให้ยืนยันว่า จะใช้รูป ณ ที่ถ่ายนำไปประมวล ให้กด "ตกลง" หากต้องการถ่ายภาพใหม่ ให้กด "ลองใหม่" (หากถ่ายภาพไม่ชัดเจน)',
                'เมื่อแอปพลิเคชั่นประมวลภาพเสร็จสิ้น จะแสดงผลลัพธ์การทำนายโรคข้าวของภาพใบข้าวนั้น',
                'กดปุ่ม "ดูรายละเอียด" เพื่อดูข้อมูลโรคข้าวเพิ่มเติม\nกดปุ่ม "ถ่ายภาพ" เพื่อถ่ายภาพใหม่\nกดปุ่ม "ลูกศร" มุมซ้ายบน เพื่อกลับไปหน้าหลัก'
              ],
              img_stepper: [
                'assets/images/img_howtouse/menu_camera/step1-1.jpg',
                'assets/images/img_howtouse/menu_camera/step1-2.jpg',
                'assets/images/img_howtouse/menu_camera/step1-3.jpg',
                'assets/images/img_howtouse/menu_camera/step1-4.jpg',
                'assets/images/img_howtouse/menu_camera/step1-5.jpg',
                'assets/images/img_howtouse/menu_camera/step1-5.jpg',
              ],
            ),
            myStepper(
              title_stepper: [
                'เลือกเมนูการเลือกภาพตรวจโรคข้าว',
                'เมื่อเข้าสู่หน้าเตรียมเลือกภาพ ให้กดปุ่มเลือกภาพ',
                'การเลือกภาพ สามารถเลือกได้ทั้งจาก Google Drive หรือ แกลเลอรี่ โดยกดปุ่มสามขีดที่มุมซ้ายบนของหน้าจอโทรศัพท์ และเลือกไดร์ฟ หรือ แกลเลอรี่ (Photos)',
                'เลือกภาพใบข้าวที่ท่านต้องการตรวจโรคข้าว',
                'เมื่อแอปพลิเคชั่นประมวลภาพเสร็จสิ้น จะแสดงผลลัพธ์การทำนายโรคข้าวของภาพใบข้าวนั้น',
                'กดปุ่ม "ดูรายละเอียด" เพื่อดูข้อมูลโรคข้าวเพิ่มเติม\nกดปุ่ม "เลือกภาพ" เพื่อเลือกภาพใหม่\nกดปุ่ม "ลูกศร" มุมซ้ายบน เพื่อกลับไปหน้าหลัก'
              ],
              img_stepper: [
                'assets/images/img_howtouse/menu_gallery/step2-1.jpg',
                'assets/images/img_howtouse/menu_gallery/step2-2.jpg',
                'assets/images/img_howtouse/menu_gallery/step2-3.jpg',
                'assets/images/img_howtouse/menu_gallery/step2-4.jpg',
                'assets/images/img_howtouse/menu_gallery/step2-5.jpg',
                'assets/images/img_howtouse/menu_gallery/step2-5.jpg',
              ],
            ),
            myStepper(
              title_stepper: [
                'เลือกเมนูการค้นหาทั่วไป',
                'การค้นหาทั่วไป สามารถค้นหาข้อมูลได้ทั้งโรคข้าวและพันธุ์ข้าว',
                'กดที่ช่องค้นหา และป้อนชื่อโรคข้าวที่ต้องการดูข้อมูล',
                'หน้าจอจะแสดงผลการค้นหาโรคข้าว จากนั้นกดเลือกโรคข้าวใดก็ได้ที่ต้องการดูข้อมูลเพิ่มเติม',
                'หน้าจอจะแสดงผลลัพธ์ข้อมูลของโรคข้าวทั้งหมด',
                'ผู้ใช้สามารถกดพับ หรือซ่อนเนื้อหาของโรคข้าวได้ (เลือกดูเนื้อหาบางอย่างที่สนใจดู)\nกดปุ่ม "ลูกศร" มุมซ้ายบน เพื่อกลับไปหน้าหลัก',
              ],
              img_stepper: [
                'assets/images/img_howtouse/menu_search/step3-1.jpg',
                'assets/images/img_howtouse/menu_search/step3-2.jpg',
                'assets/images/img_howtouse/menu_search/step3-3.png',
                'assets/images/img_howtouse/menu_search/step3-4.png',
                'assets/images/img_howtouse/menu_search/step3-5.jpg',
                'assets/images/img_howtouse/menu_search/step3-6.png',
              ],
            ),
          ],
        ),
      ),
    );
  }
}
