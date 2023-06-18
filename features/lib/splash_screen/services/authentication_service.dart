import 'package:firebase_auth/firebase_auth.dart';
import 'package:hive/hive.dart';

class AuthenticationService {
  Future saveData(OAuthCredential credentials) async {
    Box<OAuthCredential> box = await Hive.openBox('credentialUserBox');
    await box.put(0, credentials);
  }

  Future getUserLogin() async {
    Box<OAuthCredential> box = await Hive.openBox('credentialUserBox');
    if (box.isNotEmpty) {
      final credentialInfo = box.values.first;
      return credentialInfo;
    }
    return null;
  }
}
