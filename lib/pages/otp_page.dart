import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:haritham_noel/services/AuthService.dart';

import 'package:http/http.dart' as http;

import '../constants/strings.dart' show Strings;
import '../main.dart' show storage;
import 'home_page.dart';


class OTPPage extends StatelessWidget {

final TextEditingController _otpController = TextEditingController();

void displayDialog(context, title, text) => showDialog(
    context: context,
    builder: (context) =>
      AlertDialog(
        title: Text(title),
        content: Text(text)
      ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child : Column(
          children: <Widget>[
            SizedBox(height: 100,),
            Container(
              height: 80,
              constraints: const BoxConstraints(
                maxWidth: 500
              ),
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: TextField(
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                  hintText: '_ _ _ _ _',
                  border: OutlineInputBorder(borderRadius: const BorderRadius.all(Radius.circular(4)))
                ),
                controller: _otpController,
                maxLength: 6,
                keyboardType: TextInputType.phone,
                maxLines: 1,
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              constraints: const BoxConstraints(
                  maxWidth: 500
              ),
              child: RaisedButton(
                onPressed: () async {
                  var phone = _otpController.text;
                  if (_otpController.text.isNotEmpty) {
                    var output = await AuthService.verifyPassword(phone);
                    print(output);
                    if(output != null) {
                      var jwt = jsonDecode(output)["token"];
                      storage.write(key: "jwt", value: jwt);
                      print("otp");
                      print(jwt);
                      displayDialog(context, "Verification Successfull", "$jwt");
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomePage.fromBase64(jwt)
                        )
                      );
                    } else {
                      displayDialog(context, "An Error Occurred", "Server Error");
                    }
                  } else {
                    displayDialog(context, "An Error Occurred", "Please provide otp");
                  }
                },
                color: Color(0xFF503E9D),
                shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(14))),
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Next',
                        style: TextStyle(color: Colors.white),
                      ),
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(Radius.circular(20)),
                          color: Color(0xFF6252A7),
                        ),
                        child: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.white,
                          size: 16,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}