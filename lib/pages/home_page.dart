import 'package:flutter/material.dart';
import 'dart:convert' show json, base64, ascii;

import 'package:http/http.dart' as http;

import '../constants/strings.dart' show Strings;

class HomePage extends StatelessWidget {
  HomePage(this.jwt, this.payload);
  
  factory HomePage.fromBase64(String jwt) =>
    HomePage(
      jwt,
      json.decode(
        ascii.decode(
          base64.decode(base64.normalize(jwt.split(".")[1]))
        )
      )
    );

  final String jwt;
  final Map<String, dynamic> payload;

  @override
  Widget build(BuildContext context) =>
    Scaffold(
      appBar: AppBar(title: Text("Secret Data Screen")),
      body: Center(
        child: FutureBuilder(
          future: http.read('${Strings.SERVER_IP}/reports', headers: {"Authorization": "Bearer $jwt"}),
          builder: (context, snapshot) =>
            snapshot.hasData ?
            Column(children: <Widget>[
              Text("${payload['id']}, here's the data:"),
              Text(snapshot.data)
            ],)
            :
            snapshot.hasError ? Text("An error occurred") : CircularProgressIndicator()
        ),
      ),
    );
}