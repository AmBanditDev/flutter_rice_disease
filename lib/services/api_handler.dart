import 'dart:convert';

import 'package:flutter_rice_disease/models/riceDiseaseModel.dart';
import 'package:flutter_rice_disease/models/riceVarietiesModel.dart';
import 'package:flutter_rice_disease/utils.dart';
import 'package:http/http.dart' as http;

class APIHandler {
  static Future<RiceDiseaseModel?> getDataRD() async {
    try {
      var client = http.Client();
      var uri = Uri.parse(api_hostinger_view);
      var response = await client.get(uri);
      var data = jsonDecode(response.body);
      if (response.statusCode != 200) {
        throw data["message"];
      }
      return RiceDiseaseModel.fromJson(data[0]);
    } catch (error) {
      throw error.toString();
    }
  }

  static Future<RiceDiseaseModel?> getDataRDByKeyword({
    required String keyword,
  }) async {
    try {
      var client = http.Client();
      var uri = Uri.parse('$api_search_rice_disease?keyword=$keyword');
      var response = await client.get(uri);
      var data = jsonDecode(response.body);
      if (response.statusCode != 200) {
        throw data["message"];
      }
      return RiceDiseaseModel.fromJson(data[0]);
    } catch (error) {
      throw error.toString();
    }
  }

  static Future<RiceVarietiesModel?> getDataRVByKeyword({
    required String keyword,
  }) async {
    try {
      var client = http.Client();
      var uri = Uri.parse('$api_search_rice_varieties?keyword=$keyword');
      var response = await client.get(uri);
      var data = jsonDecode(response.body);
      if (response.statusCode != 200) {
        throw data["message"];
      }
      return RiceVarietiesModel.fromJson(data[0]);
    } catch (error) {
      throw error.toString();
    }
  }

  // static Future<List<RiceDiseaseModel>?> searchGetData(String query) async {
  //   try {
  //     var client = http.Client();
  //     var uri = Uri.parse(api_hostinger_search);
  //     var response = await client.get(uri);

  //     if (response.statusCode == 200) {
  //       final List riceDiseases = json.decode(response.body);

  //       return riceDiseases
  //           .map((json) => RiceDiseaseModel.fromJson(json))
  //           .where((riceDisease) {
  //         final nameTHLower = riceDisease.nameTH!.toLowerCase();
  //         final causeLower = riceDisease.cause!.toLowerCase();
  //         final searchLower = query.toLowerCase();

  //         return nameTHLower.contains(searchLower) ||
  //             causeLower.contains(searchLower);
  //       }).toList();
  //       // var data = jsonDecode(response.body);
  //       // return RiceDiseaseModel.riceDiseaseFromSnapshot(data);
  //     }
  //   } catch (error) {
  //     throw error.toString();
  //   }
  // }

  // static Future<RiceDiseaseModel?> search({
  //   required String keyword,
  // }) async {
  //   try {
  //     var client = http.Client();
  //     var uri = Uri.parse('$api_hostinger_search?keyword=$keyword');
  //     var response = await client.get(uri);
  //     if (response.statusCode == 200) {
  //       var data = jsonDecode(response.body);
  //       return data.map((json) => RiceDiseaseModel.fromJson(json)).toList();

  //       // return RiceDiseaseModel.fromJson(data[0]);
  //     }
  //   } catch (error) {
  //     throw error.toString();
  //   }
  // }
}
