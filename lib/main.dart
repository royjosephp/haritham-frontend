import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'dart:convert' show json, base64, ascii;


import 'pages/login_page.dart';
import 'pages/home_page.dart';

final storage = FlutterSecureStorage();

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  Future<String> get jwtOrEmpty async {
    var jwt = await storage.read(key: "jwt");
    if(jwt == null) return "";
    return jwt;
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Haritham',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FutureBuilder(
        future: jwtOrEmpty,            
        builder: (context, snapshot) {
          if(!snapshot.hasData) return CircularProgressIndicator();
          if(snapshot.data != "") {
            var str = snapshot.data;
            var jwt = str.split(".");

            if(jwt.length !=3) {
              return LoginPage();
            } else {
              var payload = json.decode(ascii.decode(base64.decode(base64.normalize(jwt[1]))));
              print("payload: $payload");
              print("str: $str");
              print("jwt: $jwt");
              if(DateTime.fromMillisecondsSinceEpoch(payload["iat"]*1000).isAfter(DateTime.now())) {
                return HomePage(str, payload);
              } else {
                return LoginPage();
              }
            }
          } else {
            return LoginPage();
          }
        }
      ),
    );
  }
}

