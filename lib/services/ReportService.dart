import 'dart:convert';

import 'package:haritham_noel/util/storage.dart';
import "package:http/http.dart" as http;

import 'package:http_parser/http_parser.dart' as http_parser;

import "package:haritham_noel/global.dart";

import 'package:haritham_noel/models/report_model.dart';

import 'package:mime/mime.dart';


class ReportService {
  static final String _baseUrl = SERVER_IP;

  LocalStorage storage = LocalStorage();

  // Get all the posts
  Future<List<ReportModel>> getReports() async {
    String jwt = await storage.jwtOrEmpty;
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

  // Add Report
  Future<ReportModel> addReport(ReportModel reportDetails, String imagePath) async {

    String jwt = await storage.jwtOrEmpty;

    var request = http.MultipartRequest('POST', Uri.parse('$_baseUrl/reports'));
    request.fields['state'] = reportDetails.state;
    request.fields['district'] = reportDetails.district;
    request.fields['type'] = reportDetails.type;
    request.fields['description'] = reportDetails.description;
    request.fields['location'] = json.encode(reportDetails.location.toJson());
    
    request.files.add(await http.MultipartFile.fromPath('image', imagePath, contentType: http_parser.MediaType.parse(lookupMimeType(imagePath))));
    
    request.headers['Content-Type'] = 'application/json';
    request.headers['Authorization'] = 'Bearer $jwt';


    var res = await request.send();

    if (res.statusCode == 201) {
      var responseBody = await res.stream.bytesToString();
      return ReportModel.fromJson(
        json.decode(responseBody)['report'],
      );
    } else {
      throw Exception(res.reasonPhrase);
    }
  }

  // Get single post by ID
  Future<ReportModel> getSingleReport(String id) async {
    String jwt = await storage.jwtOrEmpty;
    final response = await http.get(
      '$_baseUrl/reports/$id',
      headers: {
        'Content-Type': "application/json",
        'Authorization': "Bearer $jwt"
        },
    );
    if (response.statusCode == 200) {
      return ReportModel.fromJson(
        json.decode(response.body)["report"],
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
