import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:haritham_noel/services/AuthService.dart';

import 'package:haritham_noel/global.dart';

import 'dart:convert' show json, base64, ascii;


import 'pages/login_page.dart';
import 'pages/home_page.dart';

import 'package:provider/provider.dart';
import 'package:haritham_noel/notifiers/auth_notifier.dart';
import 'package:haritham_noel/notifiers/report_notifier.dart';

final storage = FlutterSecureStorage();

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthNotifier.instance()),
        ChangeNotifierProvider(create: (_) => ReportNotifier()),

      ],
      child: MaterialApp(
        title: 'Flutter Provider Proto',
        theme: ThemeData(
          primarySwatch: Colors.green,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: ProviderWrap(),
      )
    );
  }
}

class ProviderWrap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _showScreen(context);
  }
}

Widget _showScreen(BuildContext context) {
  switch (context.watch<AuthNotifier>().status) {
    case AuthStatus.Authenticating:
    case AuthStatus.Unauthenticated:
      return LoginPage();
    case AuthStatus.Uninitialized:
      return SplashScreen();
    case AuthStatus.Authenticated:
      return HomePage();
  }
  return Container();
}

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Column(
          children: [
            CircularProgressIndicator(),
            Text(
              'Splash screen',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
