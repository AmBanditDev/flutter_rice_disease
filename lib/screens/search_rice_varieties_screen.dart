import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:flutter_rice_disease/screens/details_rv_screen.dart';
import 'package:flutter_rice_disease/utils.dart';
import 'package:flutter_rice_disease/widgets/search_widget.dart';

import '../models/riceVarietiesModel.dart';

class SearchRiceVarietiesScreen extends StatefulWidget {
  const SearchRiceVarietiesScreen({key});

  @override
  State<SearchRiceVarietiesScreen> createState() =>
      _SearchRiceVarietiesScreenState();
}

class _SearchRiceVarietiesScreenState extends State<SearchRiceVarietiesScreen> {
  List<RiceVarietiesModel> riceVarieties = [];
  String keyword = '';
  Timer? debouncer;

  // @override
  // void initState() {
  //   super.initState();

  //   getData();
  // }

  @override
  void dispose() {
    debouncer?.cancel();
    super.dispose();
  }

  void debounce(
    VoidCallback callback, {
    Duration duration = const Duration(milliseconds: 500),
  }) {
    if (debouncer != null) {
      debouncer!.cancel();
    }

    debouncer = Timer(duration, callback);
  }

  // Future getData() async {
  //   final riceVarieties = await APIHandler.searchGetData(query);

  //   setState(() => this.riceVarieties = riceVarieties!);
  // }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        buildSearch(),
        Padding(
          padding: const EdgeInsets.only(left: 16, bottom: 10),
          child: RichText(
            text: TextSpan(
              style: TextStyle(
                fontSize: 18,
                fontFamily: 'NotoSansThai',
                color: Colors.grey.shade600,
              ),
              children: [
                TextSpan(
                  text: 'ค้นหา',
                ),
                TextSpan(
                    text: ' "พันธุ์ข้าว" ',
                    style: TextStyle(
                        color: secondColor, fontWeight: FontWeight.w600)),
                TextSpan(
                  text: 'ที่คุณสนใจดูข้อมูล',
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: riceVarieties.length,
            itemBuilder: (context, index) {
              final riceVarietie = riceVarieties[index];
              return buildListriceVarietie(riceVarietie, index);
            },
          ),
        ),
      ],
    );
  }

  Widget buildSearch() => SearchWidget(
        text: keyword,
        hintText: 'ป้อนชื่อพันธุ์ข้าว หรือชนิดพันธุ์ข้าว',
        onChanged: searchRiceVarieties,
      );

  Future searchRiceVarieties(String keyword) async {
    debounce(() async {
      try {
        var client = http.Client();
        var uri = Uri.parse('$api_search_rice_varieties?keyword=$keyword');
        var response = await client.get(uri);
        if (response.statusCode == 200) {
          var data = jsonDecode(response.body);

          setState(() {
            riceVarieties = (data as List<dynamic>)
                .map((json) => RiceVarietiesModel.fromJson(json))
                .toList();
            print("Data = $riceVarieties");
          });
        } else {
          throw Exception('การค้นหาพันธุ์ข้าวล้มเหลว');
        }
      } catch (error) {
        throw error.toString();
      }
      if (!mounted) return;
    });
  }

  Widget buildListriceVarietie(RiceVarietiesModel riceVarietie, int index) =>
      InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  DetailsRVScreen(keyword: riceVarietie.nameTH!),
            ),
          );
        },
        child: ListTile(
          leading: Container(
            width: 55,
            height: 55,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: secondColor,
            ),
            child: Center(
              child: Text(
                "${index + 1}",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          title: Text(
            riceVarietie.nameTH!,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          subtitle: Text(
            "ชนิด : ${riceVarietie.type!}",
            style: const TextStyle(fontSize: 16),
          ),
        ),
      );
}
