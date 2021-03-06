import 'dart:convert';

import 'package:haritham_noel/main.dart';
import 'package:haritham_noel/util/storage.dart';
import "package:http/http.dart" as http;

import "package:haritham_noel/global.dart";

import 'package:haritham_noel/models/report.dart';

class ReportService {
  static final String _baseUrl = SERVER_IP;

  LocalStorage storage = LocalStorage();

  // Get all the posts
  Future<List<ReportModel>> getReports() async {
    String jwt = await storage.jwtOrEmpty;
    print(jwt);
    final response = await http.get("$_baseUrl/reports",
      headers: {
        'Content-Type': "application/json",
        'Authorization': "Bearer $jwt"
        },
    );
    if (response.statusCode == 200) {
      final parsed = json.decode(response.body)["reports"].cast<Map<String, dynamic>>();
      return parsed.map<ReportModel>((json) => ReportModel.fromJson(json)).toList();
    } else {
      throw Exception(response.body);
    }
  }

  // // Get all posts of a specific editor
  // Future<List<ReportModel>> getSpecificEditorPosts(String userId) async {
  //   final response = await http.post(
  //     '$_baseUrl/posts/user',
  //     body: json.encode(
  //       {'id': '$userId'},
  //     ),
  //     headers: {'Content-Type': "application/json"},
  //   );

  //   if (response.statusCode == 200) {
  //     final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
  //     return parsed.map<ReportModel>((json) => ReportModel.fromJson(json)).toList();
  //   } else {
  //     throw Exception(response.body);
  //   }
  // }

  // Get single post by ID
  Future<ReportModel> getSingleReport(String id) async {
    String jwt = await storage.jwtOrEmpty;
    print(jwt);
    final response = await http.post(
      '$_baseUrl/reports/id',
      body: json.encode(
        {'id': '$id'},
      ),
      headers: {
        'Content-Type': "application/json",
        'Authentication': "Bearer $jwt"
        },
    );
    if (response.statusCode == 200) {
      return ReportModel.fromJson(
        json.decode(response.body),
      );
    } else {
      throw Exception(response.body);
    }
  }

  // // Get Single Editor
  // Future getEditor(String id) async {
  //   final response = await http.post(
  //     '$_baseUrl/editors/id',
  //     body: json.encode(
  //       {'id': '$id'},
  //     ),
  //     headers: {'Content-Type': "application/json"},
  //   );
  //   if (response.statusCode == 200) {
  //     return EditorModel.fromJson(json.decode(response.body));
  //   } else {
  //     throw Exception(response.body);
  //   }
  // }

  // // Get All Categories
  // Future getCategories() async {
  //   final response = await http.get('$_baseUrl/cat');
  //   if (response.statusCode == 200) {
  //     final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
  //     return parsed
  //         .map<CategoryModel>((json) => CategoryModel.fromJson(json))
  //         .toList();
  //   } else {
  //     throw Exception(response.body);
  //   }
  // }
}
