import 'package:flutter/material.dart';
import 'package:flutter_rice_disease/responsive/responsive_layout.dart';
import 'package:flutter_rice_disease/responsive/tablet_license.dart';
import 'package:flutter_rice_disease/utils.dart';
import 'package:flutter_rice_disease/widgets/licenseWidget.dart';

class LicenseScreen extends StatelessWidget {
  const LicenseScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileScaffold: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: firstColor,
          title: Text(
            "ข้อตกลงในการใช้ซอฟต์แวร์",
            style: TextStyle(fontSize: 20),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: SizedBox(
                    child: Image.asset(
                        "assets/images/logo/logo_main_transparent.png"),
                    width: MediaQuery.of(context).size.width * 0.4,
                  ),
                ),
                LicenseTitle(title: "ข้อตกลงในการใช้ซอฟต์แวร์", fontsize: 20),
                LicenseInfo(
                  info:
                      "     ซอฟต์แวร์นี้เป็นผลงานที่พัฒนาขึ้นโดย นายปวริศ ปิ่นมณีวรรณ และ นายธันวบัณฑิต ยศคำลือ จาก มหาวิทยาลัยราชภัฏสวนสุนันทา ภายใต้การดูแลของ ผู้ช่วยศาสตราจารย์รุจิจันทร์ วิชิวานิเวศน์ภายใต้โครงการแข่งขันพัฒนาโปรแกรมคอมพิวเตอร์แห่งประเทศไทย ครั้งที่ 25 ประจำปีงบประมาณ 2566 ซึ่งสนับสนุนโดย ศูนย์เทคโนโลยีอิเล็กทรอนิกส์และคอมพิวเตอร์แห่งชาติโดยมีวัตถุประสงค์เพื่อส่งเสริมให้นักเรียนและนักศึกษาได้เรียนรู้และฝึกทักษะในการพัฒนาซอฟต์แวร์ลิขสิทธิ์ของซอฟต์แวร์นี้จึงเป็นของผู้พัฒนาซึ่งผู้พัฒนาได้อนุญาตให้ศูนย์เทคโนโลยีอิเล็กทรอนิกส์และคอมพิวเตอร์แห่งชาติเผยแพร่ซอฟต์แวร์นี้ตาม “ต้นฉบับ” โดยไม่มีการแก้ไขดัดแปลงใด ๆ ทั้งสิ้นให้แก่บุคคลทั่วไปได้ใช้เพื่อประโยชน์ส่วนบุคคลหรือประโยชน์ทางการศึกษาที่ไม่มีวัตถุประสงค์ในเชิงพาณิชย์โดยไม่คิดค่าตอบแทนการใช้ซอฟต์แวร์ดังนั้น ศูนย์เทคโนโลยีอิเล็กทรอนิกส์และคอมพิวเตอร์แห่งชาติจึงไม่มีหน้าที่ในการดูแล บํารุงรักษา จัดการอบรมการใช้งานหรือพัฒนาประสิทธิภาพซอฟต์แวร์รวมทั้งไม่รับรองความถูกต้องหรือประสิทธิภาพการทํางานของซอฟต์แวร์ตลอดจนไม่รับประกันความเสียหายต่าง ๆ อันเกิดจากการใช้ซอฟต์แวร์นี้ทั้งสิ้น",
                  fontsize: 16,
                ),
                SizedBox(height: 20),
                LicenseTitle(title: "License Agreement", fontsize: 20),
                LicenseInfo(
                  info:
                      "     This software is a work developed by Mr. Pawarit Pinmaneewan and Mr. Thanwabandit Yoschamlue from Suan Sunandha Rajabhat University under the provision of Assistant professor Rujijan Vichivanives under Search Engine of Rice Disease Information using Image Processing Technique, which has been supported by the National Electronics and Computer Technology Center (NECTEC), in order to encourage pupils and students to learn and practice their skills in developing software. Therefore, the intellectual property of this software shall belong to the developer and the developer gives NECTEC a permission to distribute this software as an “as is” and non-modified software for a temporary and non-exclusive use without remuneration to anyone for his or her own purpose or academic purpose, which are not commercial purposes. In this connection, NECTEC shall not be responsible to the user for taking care, maintaining, training or developing the efficiency of this software. Moreover, NECTEC shall not be liable for any error, software efficiency and damages in connection with or arising out of the use of the software.",
                  fontsize: 16,
                ),
              ],
            ),
          ),
        ),
      ),
      tabletScaffold: TabletLicenseScreen(),
    );
  }
}
