import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_rice_disease/screens/camera_screen.dart';
import 'package:flutter_rice_disease/screens/pickImage_screen.dart';
import 'package:flutter_rice_disease/widgets/floatingButton.dart';

import '../utils.dart';
import 'details_rd_screen.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({
    key,
    required this.image,
    required this.output,
    required this.function,
  }) : super(key: key);

  // final File? image;
  // final List? output;
  final image;
  final output;
  final Function function;

  @override
  Widget build(BuildContext context) {
    print(output!);
    final label = output[0]['label'];
    final confidence = (output![0]['confidence'] * 100).toStringAsFixed(2);
    final String? diseaseNameTH;
    final verifyImage = image!.path.endsWith(".jpg") ||
        image!.path.endsWith(".jpeg") ||
        image!.path.endsWith(".png");

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

    return Scaffold(
      body: Container(
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
            // ถ้ามีภาพเข้ามา (ไม่เป็นค่าว่าง)
            if (image != null)
              if (verifyImage)
                Image.file(
                  File(image!.path),
                  height: MediaQuery.of(context).size.height * 0.6,
                  width: double.infinity,
                  fit: BoxFit.cover,
                )
              else
                Container(
                  height: MediaQuery.of(context).size.height * 0.6,
                  color: Colors.grey.shade400,
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      verifyImage
                          ? Center(
                              child: Image.asset(
                                "assets/icons/image-processing.png",
                                width: 120,
                              ),
                            )
                          : Column(
                              children: [
                                Center(
                                  child: Image.asset(
                                    "assets/icons/image-processing.png",
                                    width: 120,
                                  ),
                                ),
                                Text(
                                  "ไม่พบรูปภาพ",
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white),
                                ),
                              ],
                            ),
                    ],
                  ),
                )
            else
              Container(),
            output != null
                ? Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        !verifyImage
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
                                                  fontWeight: FontWeight.w500,
                                                  color: firstColor,
                                                ),
                                              ),
                                              label != "Disease Free" &&
                                                      label != "General"
                                                  ? Text(
                                                      "คาดว่าเป็น $diseaseNameTH $confidence%",
                                                      style: TextStyle(
                                                          fontSize: 20),
                                                    )
                                                  : Text(
                                                      "ใบข้าวไม่เป็นโรค $confidence%",
                                                      style: TextStyle(
                                                          fontSize: 20),
                                                    ),
                                              label != "Disease Free"
                                                  ? Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 10),
                                                      child: ElevatedButton(
                                                        onPressed: () {
                                                          Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                              builder: (context) =>
                                                                  DetailsRDScreen(
                                                                      keyword:
                                                                          diseaseNameTH!),
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
                                                          primary: secondColor,
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
                      ],
                    ),
                  )
                : Center(child: CircularProgressIndicator()),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(16.0),
                        child: ElevatedButton(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.camera_alt,
                                size: 36,
                              ),
                              SizedBox(width: 10),
                              Text(
                                "ถ่ายภาพ",
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
                            primary: Colors.grey,
                            textStyle: const TextStyle(fontSize: 18),
                            padding: const EdgeInsets.all(10),
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(5), // <-- Radius
                            ),
                          ),
                          // onPressed: () {
                          //   // Navigator.push(
                          //   //   context,
                          //   //   MaterialPageRoute(
                          //   //     builder: (context) => CameraScreen(),
                          //   //   ),
                          //   // );
                          //   // Navigator.pop(context);
                          // },
                          onPressed: () => function,
                        ),
                      ),
                    ),
                    // SizedBox(width: 10),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(16.0),
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
                                  BorderRadius.circular(5), // <-- Radius
                            ),
                          ),
                          // onPressed: () {
                          //   Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //       builder: (context) => PickImageScreen(),
                          //     ),
                          //   );
                          // },
                          onPressed: () => function,
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
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      floatingActionButton: const MyFloatingActionButton(),
    );
  }
}
