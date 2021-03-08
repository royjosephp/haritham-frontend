import 'dart:convert';

import "package:http/http.dart" as http;

import "package:haritham_noel/global.dart";

class AuthService {
  static final String _baseUrl = SERVER_IP;
  
  Future<String> generatePassword(String phone) async {
    var res = await http.post(
      "$_baseUrl/auth/generate",
      body: jsonEncode({
        "phone": phone
      }),
      headers: {"Content-type": "application/json"}
    );
    if(res.statusCode == 200) {
      return res.body;
    }
    return throw Exception(res.body);
  }


  Future<String> verifyPassword(String phone, String otp) async {
    var res = await http.post(
      "$_baseUrl/auth/verify",
      body: jsonEncode({
        "phone": phone,
        "password": otp
      }),
      headers: {"Content-type": "application/json"}
    );
    if(res.statusCode == 201) return res.body;
    return throw Exception(res.body);
  }

  // // Get all the posts
  // Future<List<PostModel>> getPosts() async {
  //   final response = await http.get("$_baseUrl/posts");
  //   if (response.statusCode == 200) {
  //     final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
  //     return parsed.map<PostModel>((json) => PostModel.fromJson(json)).toList();
  //   } else {
  //     throw Exception(response.body);
  //   }
  // }

  // // Get all posts of a specific editor
  // Future<List<PostModel>> getSpecificEditorPosts(String userId) async {
  //   final response = await http.post(
  //     '$_baseUrl/posts/user',
  //     body: json.encode(
  //       {'id': '$userId'},
  //     ),
  //     headers: {'Content-Type': "application/json"},
  //   );

  //   if (response.statusCode == 200) {
  //     final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
  //     return parsed.map<PostModel>((json) => PostModel.fromJson(json)).toList();
  //   } else {
  //     throw Exception(response.body);
  //   }
  // }

  // // Get single post by ID
  // Future<PostModel> getSinglePost(String id) async {
  //   final response = await http.post(
  //     '$_baseUrl/posts/id',
  //     body: json.encode(
  //       {'id': '$id'},
  //     ),
  //     headers: {'Content-Type': "application/json"},
  //   );
  //   if (response.statusCode == 200) {
  //     return PostModel.fromJson(
  //       json.decode(response.body),
  //     );
  //   } else {
  //     throw Exception(response.body);
  //   }
  // }

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
