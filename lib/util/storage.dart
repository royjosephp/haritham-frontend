import 'package:flutter_secure_storage/flutter_secure_storage.dart';


class LocalStorage {
  final storage = FlutterSecureStorage();

  Future<String> get jwtOrEmpty async {
    String jwt = await storage.read(key: "jwt");
    if(jwt == null) return "";
    return jwt;
  }

  setJwt(jwt) async {
    await storage.write(key: "jwt", value: jwt);
  }

}