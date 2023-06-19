import 'dart:io';
import 'package:features/splash_screen/model/user_credential_info.dart';
import 'package:features/splash_screen/model/auth_adapter.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

class HiveConfig {
  static start() async {
    Directory dir = await getApplicationDocumentsDirectory();
    await Hive.initFlutter(dir.path);
    Hive.registerAdapter(UserCredentialInfoAdapter());
    Hive.registerAdapter(OAuthCredentialAdapter());
  }
}
