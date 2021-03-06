import 'package:flutter/widgets.dart';
import 'package:haritham_noel/services/AuthService.dart';

import 'package:haritham_noel/global.dart';

import 'dart:convert' show json, base64, ascii, jsonDecode;

import 'package:haritham_noel/util/storage.dart';


class AuthNotifier with ChangeNotifier {
  String _jwt;
  String _userId;
  AuthStatus _status = AuthStatus.Uninitialized;

  LocalStorage storage = LocalStorage();

  AuthService _service = AuthService();

  AuthStatus get status => _status;
  String get user => _userId;
  String get jwt => _jwt;

  AuthNotifier.instance(){

    storage.jwtOrEmpty.then((value) {
      if(value != "") {
            String str = value;
            var jwt = str.split(".");
            if(jwt.length !=3) {
              _status = AuthStatus.Unauthenticated;
            } else {
              var payload = json.decode(ascii.decode(base64.decode(base64.normalize(jwt[1]))));
              // Fix this if jwt expire is configured
              // if(DateTime.fromMillisecondsSinceEpoch(payload["iat"]*1000).isAfter(DateTime.now())) {
                _jwt = value;
                _status = AuthStatus.Authenticated;
              // } else {
              //   _status = AuthStatus.Unauthenticated;
              // }
            }
          } else {
            _status = AuthStatus.Unauthenticated;
          }
          notifyListeners();
      });
  }
  

  Future<bool> generatePassword(String phone) async {
    try {
      await _service.generatePassword(phone);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> verifyPassword(String otp) async {
    try {
      _status = AuthStatus.Authenticating;
      notifyListeners();
      var output = await _service.verifyPassword(otp);
      var jwt = jsonDecode(output)["token"];
      await storage.setJwt(jwt);
      _jwt = jwt;
      _status = AuthStatus.Authenticated;
      notifyListeners();
      return true;
    } catch (e) {
      _status = AuthStatus.Unauthenticated;
      notifyListeners();
      return false;
    }
  }

  Future signOut() async {
    _jwt = null;
    _status = AuthStatus.Unauthenticated;
    storage.setJwt("");
    notifyListeners();
    return Future.delayed(Duration.zero);
  }

}