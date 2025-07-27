import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter_rice_disease/components/accordian.dart';
import 'package:flutter_rice_disease/utils.dart';
import 'package:flutter_rice_disease/services/api_handler.dart';
import 'package:flutter_rice_disease/widgets/floatingButton.dart';

import '../models/riceVarietiesModel.dart';

class DetailsRVScreen extends StatefulWidget {
  const DetailsRVScreen({key, required this.keyword});
  final String? keyword;

  @override
  State<DetailsRVScreen> createState() => _DetailsRVScreenState();
}

class _DetailsRVScreenState extends State<DetailsRVScreen> {
  RiceVarietiesModel? riceVarietiesModel;
  bool isError = false;
  String errorStr = "";

  void getProductInfo() async {
    try {
      riceVarietiesModel =
          await APIHandler.getDataRVByKeyword(keyword: widget.keyword!);
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
    print("Data : $riceVarietiesModel");
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      body: SafeArea(
        child: isError
            ? Center(
                child: Text("เกิดข้อผิดพลาด"),
              )
            : riceVarietiesModel == null
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
                          height: MediaQuery.of(context).size.height * 0.35,
                          child: FancyShimmerImage(
                            imageUrl:
                                "$link_rice_varieties_img${riceVarietiesModel!.image}",
                            boxFit: BoxFit.fill,
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
                                        "${riceVarietiesModel!.nameTH}",
                                        style: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                          color: secondColor,
                                        ),
                                      ),
                                      Text(
                                        "(${riceVarietiesModel!.nameEN})",
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
                                      "ชนิด${riceVarietiesModel!.type}",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Colors.grey[700],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(height: 16),
                              Accordion(
                                title: "คู่ผสม",
                                content: "${riceVarietiesModel!.mating_couple}",
                              ),
                              Accordion(
                                title: "ประวัติพันธุ์ข้าว",
                                content: "${riceVarietiesModel!.history}",
                              ),
                              Accordion(
                                title: "การรับรองพันธุ์",
                                content: "${riceVarietiesModel!.cert}",
                              ),
                              Accordion(
                                title: "ผลผลิต",
                                content: "${riceVarietiesModel!.product}",
                              ),
                              Accordion(
                                title: "ลักษณะประจำพันธุ์",
                                content:
                                    "${riceVarietiesModel!.characteristics}",
                              ),
                              Accordion(
                                title: "ลักษณะเด่น",
                                content:
                                    "${riceVarietiesModel!.distinctive_feature}",
                              ),
                              Accordion(
                                title: "ข้อควรระวัง",
                                content: "${riceVarietiesModel!.caution}",
                              ),
                              Accordion(
                                title: "พื้นที่แนะนำ",
                                content: "${riceVarietiesModel!.recomd_area}",
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
