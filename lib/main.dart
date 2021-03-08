import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:haritham_noel/global.dart';

import 'pages/login_page.dart';
import 'pages/home_page.dart';

import 'package:provider/provider.dart';
import 'package:haritham_noel/notifiers/auth_notifier.dart';
import 'package:haritham_noel/notifiers/report_notifier.dart';

import 'package:flex_color_scheme/flex_color_scheme.dart';

final storage = FlutterSecureStorage();

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Than we setup preferred orientations,
  // and only after it finished we run our app
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(MyApp()));
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
          // The Mandy red, light theme.
          theme: FlexColorScheme.light(scheme: FlexScheme.green).toTheme,
          // The Mandy red, dark theme.
          darkTheme: FlexColorScheme.dark(scheme: FlexScheme.green).toTheme,
          // Use dark or light theme based on system setting.
          themeMode: ThemeMode.system,

          home: ProviderWrap(),
        ));
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
        child: CircularProgressIndicator(),
      ),
    );
  }
}
