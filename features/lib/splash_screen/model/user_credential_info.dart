import 'package:firebase_auth/firebase_auth.dart';
import 'package:hive/hive.dart';

part 'user_credential_info.g.dart';

@HiveType(typeId: 1)
class UserCredentialInfo {
  @HiveField(0)
  final OAuthCredential? credential;

  UserCredentialInfo(
    this.credential,
  );
}
