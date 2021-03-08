import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:haritham_noel/notifiers/auth_notifier.dart';
import 'package:haritham_noel/pages/otp_page.dart';

import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController _phoneController = TextEditingController();

  void displayDialog(context, title, text) => showDialog(
        context: context,
        builder: (context) =>
            AlertDialog(title: Text(title), content: Text(text)),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 80),
                        child:
                            Center(child: Image.asset('assets/img/login.png')),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    children: <Widget>[
                      Container(
                          constraints: const BoxConstraints(maxWidth: 500),
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(children: <TextSpan>[
                              TextSpan(
                                  text: 'We will send you a ',
                                  style: Theme.of(context).textTheme.bodyText2),
                              TextSpan(
                                  text: 'One Time Password ',
                                  style: Theme.of(context).textTheme.bodyText1),
                              TextSpan(
                                  text: 'on this mobile number',
                                  style: Theme.of(context).textTheme.bodyText2),
                            ]),
                          )),
                      Container(
                        height: 40,
                        constraints: const BoxConstraints(maxWidth: 500),
                        margin: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: TextField(
                          decoration: InputDecoration(
                              contentPadding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              prefix: Text("+91"),
                              hintText: "Enter mobile number",
                              border: OutlineInputBorder(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(4)))),
                          controller: _phoneController,
                          keyboardType: TextInputType.phone,
                          maxLines: 1,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        constraints: const BoxConstraints(maxWidth: 500),
                        child: ElevatedButton(
                          onPressed: () async {
                            var phone = _phoneController.text;
                            if (_phoneController.text.isNotEmpty) {
                              var jwt = await context
                                  .read<AuthNotifier>()
                                  .generatePassword(phone);
                              print(jwt);
                              if (jwt != null) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => OTPPage(phone)));
                              } else {
                                displayDialog(context, "An Error Occurred",
                                    "No account was found matching that username and password");
                              }
                            } else {
                              displayDialog(context, "An Error Occurred",
                                  "Please provide a mobile number");
                            }
                          },
                          // color: Color(0xFF503E9D),
                          // bord: const RoundedRectangleBorder(
                          //     borderRadius:
                          //         BorderRadius.all(Radius.circular(14))),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 8),
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
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(20)),
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
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
