import 'package:flutter/material.dart';
import 'package:haritham_noel/notifiers/auth_notifier.dart';
import 'package:haritham_noel/notifiers/report_notifier.dart';
import 'package:haritham_noel/pages/login_page.dart';

import 'package:haritham_noel/pages/reports/new_form.dart';
import 'package:provider/provider.dart';

import 'package:haritham_noel/pages/reports/reports_list.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Secret Data Screen")),
      body: Column(
        children: [
          RaisedButton(
            padding: const EdgeInsets.all(17.0),
            textColor: Colors.white,
            color: Colors.green,
            onPressed: () {
              Navigator.push(context,
                  new MaterialPageRoute(builder: (context) => NewReportForm()));
            },
            child: new Text("Report new case"),
          ),
          RaisedButton(
            padding: const EdgeInsets.all(17.0),
            textColor: Colors.white,
            color: Colors.green,
            onPressed: () {
              Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (context) => ReportListPage()));
            },
            child: new Text("Show All Reports"),
          ),
          RaisedButton(
            padding: const EdgeInsets.all(17.0),
            textColor: Colors.white,
            color: Colors.green,
            onPressed: () {
              context.read<AuthNotifier>().signOut();
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (_) => LoginPage()),
                  (route) => false);
            },
            child: new Text("SignOut"),
          ),
        ],
      ),
    );
  }
}
