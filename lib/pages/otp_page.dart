import 'package:flutter/material.dart';
import 'package:haritham_noel/notifiers/auth_notifier.dart';
import 'package:provider/provider.dart';

import 'package:haritham_noel/pages/home_page.dart';


class OTPPage extends StatelessWidget {

  final String phone;

  OTPPage(this.phone);

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
                  hintText: '_ _ _ _ _ _',
                  border: OutlineInputBorder(borderRadius: const BorderRadius.all(Radius.circular(4)))
                ),
                controller: _otpController,
                maxLength: 6,
                keyboardType: TextInputType.number,
                maxLines: 1,
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              constraints: const BoxConstraints(
                  maxWidth: 500
              ),
              child: ElevatedButton(
                onPressed: () async {
                  var otp = _otpController.text;
                  if (_otpController.text.isNotEmpty) {
                    var verified = await context
                                    .read<AuthNotifier>()
                                    .verifyPassword(phone,otp);
                    if(verified) {
                      displayDialog(context, "Verification Successfull", "Verification Successfull");
                      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) => HomePage()), (route) => false);
                    } else {
                      displayDialog(context, "An Error Occurred", "Server Error");
                    }
                  } else {
                    displayDialog(context, "An Error Occurred", "Please provide otp");
                  }
                },
                // color: Color(0xFF503E9D),
                // shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(14))),
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Next',
                        // style: TextStyle(color: Colors.white),
                      ),
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(Radius.circular(20)),
                          // color: Color(0xFF6252A7),
                        ),
                        child: Icon(
                          Icons.arrow_forward_ios,
                          // color: Colors.white,
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