import 'dart:async';
import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rice_disease/components/prepare_select_img.dart';
import 'package:flutter_rice_disease/screens/details_rd_screen.dart';

import 'package:flutter_rice_disease/utils.dart';
import 'package:flutter_rice_disease/widgets/floatingButton.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';

class PickImageScreen extends StatefulWidget {
  const PickImageScreen({key});

  @override
  State<PickImageScreen> createState() => _PickImageScreenState();
}

class _PickImageScreenState extends State<PickImageScreen> {
  bool loading = true; // ใช้เพื่อตรวจสอบว่ารูปภาพถูกเลือกหรือไม่
  File? image; // รูปภาพที่เลือก
  List? output; // ทำนายแล้ว
  final picker = ImagePicker(); // เลือกภาพจากแกลเลอรี่หรือกล้อง

  bool verifyImage = true;
  String? diseaseNameTH;
  String? label;

  @override
  void initState() {
    super.initState();
    loadModel().then((value) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    Tflite.close();
  }

  Future<void> classifyImage(File image) async {
    var _output = await Tflite.runModelOnImage(
      path: image.path,
      numResults: 5,
      threshold: 0.5,
      imageMean: 127.5,
      imageStd: 127.5,
    );
    if (_output == null) return;
    setState(() {
      output = _output;
      label = output![0]['label'];
      loading = false;
    });
    print("Label is = $label");
    checkLabel(label.toString());
  }

  // function loadmodel
  Future<void> loadModel() async {
    await Tflite.loadModel(
      model: 'assets/myModel/tflite_model.tflite',
      labels: 'assets/myModel/labels.txt',
    );
  }

  pickGalleryImage() async {
    var _image = await picker.pickImage(source: ImageSource.gallery);
    if (_image == null) return null;

    setState(() {
      image = File(_image.path);
      // ต้องกำหนดให้ output เป็น null เพื่อให้โปรแกรมเริ่มทำนายใหม่
      output = null;
      // เมื่อเลือกรูปใหม่ให้กำหนด loading เป็น true เพื่อแสดงว่าโปรแกรมกำลังทำงาน
      loading = true;
    });
    final fileType = _image.path.split('.').last.toLowerCase();
    if (fileType != 'jpg' && fileType != 'jpeg' && fileType != 'png') {
      verifyImage = false;
    }
    classifyImage(image!);
    diseaseNameTH = null;
  }

  checkLabel(String label) {
    if (label == "Bacterial Blight")
      diseaseNameTH = bacterial_blight;
    else if (label == "Blast")
      diseaseNameTH = blast;
    else if (label == "Brown Spot")
      diseaseNameTH = brown_spot;
    else if (label == "Disease Free")
      diseaseNameTH = diseaseFree;
    else
      diseaseNameTH = general;
  }

  @override
  Widget build(BuildContext context) {
    print("Image value is $image");
    print("Output value is $output");

    late String label = output![0]['label'];
    late String confidence =
        (output![0]['confidence'] * 100).toStringAsFixed(2);

    return Scaffold(
      body: image == null
          ? PrepareSelectImageScreen(
              function: pickGalleryImage,
              textButton: "เลือกภาพ",
              icon: Icons.insert_photo_outlined,
            )
          : loading
              ? Scaffold(
                  backgroundColor: lightGreen,
                  body: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: 240.0,
                        child: Stack(
                          children: [
                            Center(
                              child: Container(
                                width: 240,
                                height: 240,
                                child: CircularProgressIndicator(
                                  strokeWidth: 16,
                                  backgroundColor: Colors.white,
                                ),
                              ),
                            ),
                            Center(
                              child: Text(
                                "กำลังประมวลผล\nโปรดรอสักครู่..",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontFamily: 'NotoSansThai',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              : Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/bg-rice1.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  height: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.6,
                        color: Colors.grey.shade400,
                        width: double.infinity,
                        child: Image.file(
                          File(image!.path),
                          height: MediaQuery.of(context).size.height * 0.6,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.25,
                        child: Center(
                          child: !verifyImage
                              ? Padding(
                                  padding: EdgeInsets.symmetric(vertical: 16),
                                  child: Text(
                                    "ไม่รับรองไฟล์ภาพประเภทนี้\nกรุณาลองใหม่อีกครั้ง",
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.red,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                )
                              : Padding(
                                  padding: EdgeInsets.symmetric(vertical: 16),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      label == "General"
                                          ? Text(
                                              "ภาพนี้$diseaseNameTH\nกรุณาลองใหม่อีกครั้ง",
                                              style: TextStyle(
                                                fontSize: 24,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.red,
                                              ),
                                              textAlign: TextAlign.center,
                                            )
                                          : Column(
                                              children: [
                                                Text(
                                                  "ผลลัพธ์",
                                                  style: TextStyle(
                                                    fontSize: 32,
                                                    fontWeight: FontWeight.w600,
                                                    color: firstColor,
                                                  ),
                                                ),
                                                SizedBox(height: 10),
                                                label != "Disease Free" &&
                                                        label != "General"
                                                    ? AutoSizeText(
                                                        "คาดว่าเป็น $diseaseNameTH $confidence%",
                                                        minFontSize: 20,
                                                        maxFontSize: 22,
                                                      )
                                                    : AutoSizeText(
                                                        "ใบข้าวไม่เป็นโรค $confidence%",
                                                        minFontSize: 20,
                                                        maxFontSize: 22,
                                                      ),
                                                label != "Disease Free"
                                                    ? Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(top: 16),
                                                        child: ElevatedButton(
                                                          onPressed: () {
                                                            Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                builder: (context) =>
                                                                    DetailsRDScreen(
                                                                        keyword:
                                                                            diseaseNameTH),
                                                              ),
                                                            );
                                                          },
                                                          child: Text(
                                                            "ดูรายละเอียด",
                                                            style: TextStyle(
                                                                fontSize: 20),
                                                          ),
                                                          style: ElevatedButton
                                                              .styleFrom(
                                                            primary:
                                                                secondColor,
                                                            elevation: 6,
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                              vertical: 10,
                                                              horizontal: 36,
                                                            ),
                                                            shape:
                                                                RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                40,
                                                              ), // <-- Radius
                                                            ),
                                                          ),
                                                        ),
                                                      )
                                                    : Container()
                                              ],
                                            )
                                    ],
                                  ),
                                ),
                        ),
                      ),
                      Expanded(
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            padding: const EdgeInsets.all(16.0),
                            width: double.infinity,
                            child: ElevatedButton(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.insert_photo_outlined,
                                    size: 36,
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    "เลือกภาพ",
                                    style: TextStyle(
                                      fontFamily: 'NotoSansThai',
                                      fontSize: 22,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                              style: ElevatedButton.styleFrom(
                                elevation: 10,
                                primary: firstColor,
                                textStyle: const TextStyle(fontSize: 18),
                                padding: const EdgeInsets.all(10),
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(10), // <-- Radius
                                ),
                              ),
                              onPressed: () => pickGalleryImage(),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      floatingActionButton: const MyFloatingActionButton(),
    );
  }
}
