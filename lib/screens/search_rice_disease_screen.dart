import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_rice_disease/utils.dart';
import 'package:flutter_rice_disease/models/riceDiseaseModel.dart';
import 'package:flutter_rice_disease/screens/details_rd_screen.dart';
import 'package:flutter_rice_disease/services/api_handler.dart';
import 'package:flutter_rice_disease/widgets/search_widget.dart';

import 'package:http/http.dart' as http;

class SearchRiceDiseaseScreen extends StatefulWidget {
  const SearchRiceDiseaseScreen({key});

  @override
  State<SearchRiceDiseaseScreen> createState() =>
      _SearchRiceDiseaseScreenState();
}

class _SearchRiceDiseaseScreenState extends State<SearchRiceDiseaseScreen> {
  late List<RiceDiseaseModel> riceDiseases = [];
  String keyword = '';
  Timer? debouncer;

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
                    text: ' "โรคข้าว" ',
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
            itemCount: riceDiseases.length,
            itemBuilder: (context, index) {
              final riceDisease = riceDiseases[index];
              print("$riceDisease");
              return buildListRiceDisease(riceDisease, index);
            },
          ),
        ),
      ],
    );
  }

  Widget buildSearch() => SearchWidget(
        text: keyword,
        hintText: 'ป้อนชื่อโรคข้าว หรือ สาเหตุการเกิดโรค',
        onChanged: searchRiceDisease,
      );

  void searchRiceDisease(String keyword) async {
    debounce(() async {
      try {
        var client = http.Client();
        var uri = Uri.parse('$api_search_rice_disease?keyword=$keyword');
        var response = await client.get(uri);
        if (response.statusCode == 200) {
          var data = jsonDecode(response.body);

          setState(() {
            riceDiseases = (data as List<dynamic>)
                .map((json) => RiceDiseaseModel.fromJson(json))
                .toList();
            print("Data = $riceDiseases");
          });
        } else {
          throw Exception('การค้นหาโรคข้าวล้มเหลว');
        }
      } catch (error) {
        throw error.toString();
      }
      if (!mounted) return;
    });
  }

  Widget buildListRiceDisease(RiceDiseaseModel riceDisease, int index) =>
      InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  DetailsRDScreen(keyword: riceDisease.nameTH.toString()),
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
            riceDisease.nameTH!,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          subtitle: Text(
            "สาเหตุการเกิดโรค : ${riceDisease.cause!}",
            style: const TextStyle(fontSize: 16),
          ),
        ),
      );
}
