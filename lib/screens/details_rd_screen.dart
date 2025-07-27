import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter_rice_disease/components/accordian.dart';
import 'package:flutter_rice_disease/utils.dart';
import 'package:flutter_rice_disease/services/api_handler.dart';
import 'package:flutter_rice_disease/widgets/floatingButton.dart';

import '../models/riceDiseaseModel.dart';

class DetailsRDScreen extends StatefulWidget {
  const DetailsRDScreen({key, required this.keyword});
  final String? keyword;

  @override
  State<DetailsRDScreen> createState() => _DetailsRDScreenState();
}

class _DetailsRDScreenState extends State<DetailsRDScreen> {
  RiceDiseaseModel? riceDiseasesModel;
  bool isError = false;
  String errorStr = "";

  void getProductInfo() async {
    try {
      riceDiseasesModel =
          await APIHandler.getDataRDByKeyword(keyword: widget.keyword!);
    } catch (error) {
      isError = true;
      errorStr = error.toString();
      log("error $error");
    }
    setState(() {});
  }

  @override
  void didChangeDependencies() {
    getProductInfo();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    print("Key = ${widget.keyword}");
    print("KeyType = ${widget.keyword.runtimeType}");
    print("Data : $riceDiseasesModel");
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      body: SafeArea(
        child: isError
            ? Center(
                child: Text("เกิดข้อผิดพลาด"),
              )
            : riceDiseasesModel == null
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          color: Colors.grey[100],
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height * 0.5,
                          child: FancyShimmerImage(
                            imageUrl:
                                "$link_rice_disease_img${riceDiseasesModel!.image}",
                            boxFit: BoxFit.cover,
                            errorWidget:
                                Image.asset('assets/images/no_image.png'),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black54,
                                blurRadius: 2.0,
                                offset: Offset(0.0, 0.1),
                              ),
                            ],
                          ),
                          width: double.infinity,
                          child: Text(
                            "ข้อมูลจาก กองวิจัยและพัฒนาข้าว กรมการข้าว",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey.shade600,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "${riceDiseasesModel!.nameTH}",
                                        style: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                          color: secondColor,
                                        ),
                                      ),
                                      Text(
                                        "(${riceDiseasesModel!.nameEN})",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.grey.shade600,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 8, horizontal: 16),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      border: Border.all(
                                        width: 2,
                                        color: thirdColor,
                                      ),
                                      color: Colors.white,
                                    ),
                                    child: Text(
                                      "เกิดจาก${riceDiseasesModel!.cause}",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Colors.grey[700],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              // SizedBox(height: 16),
                              // Text(
                              //   "พันธุ์ข้าวที่แนะนำให้ปลูกทดแทน ...",
                              //   style: TextStyle(fontSize: 16),
                              // ),
                              SizedBox(height: 16),
                              Accordion(
                                title: "แหล่งที่พบ",
                                content: "${riceDiseasesModel!.source}",
                              ),
                              Accordion(
                                title: "รายละเอียดโรคข้าว",
                                content: "${riceDiseasesModel!.details}",
                              ),
                              Accordion(
                                title: "การแพร่ระบาด",
                                content: "${riceDiseasesModel!.epidemic}",
                              ),
                              Accordion(
                                title: "การป้องกันและกำจัด",
                                content: "${riceDiseasesModel!.methods}",
                              ),
                              Accordion(
                                title: "ข้อควรระวัง",
                                content: "${riceDiseasesModel!.caution}",
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      floatingActionButton: const MyFloatingActionButton(),
    );
  }
}
