import 'package:firebase_auth/firebase_auth.dart';
import 'package:hive/hive.dart';

class OAuthCredentialAdapter extends TypeAdapter<OAuthCredential> {
  @override
  final int typeId = 2;

  @override
  OAuthCredential read(BinaryReader reader) {
    // Read data from binary and return OAuthCredential object
    final providerId = reader.readString();
    final signInMethod = reader.readString();
    String? idToken = reader.readString();
    String? accessToken = reader.readString();
    // You may need to read additional fields based on the specific OAuthCredential implementation
    // For example, for GoogleAuthProvider you may read the idToken and accessToken.

    // Create and return the OAuthCredential object
    return OAuthCredential(
      providerId: providerId,
      signInMethod: signInMethod,
      idToken: idToken,
      accessToken: accessToken,
      // Assign additional fields here
    );
  }

  @override
  void write(BinaryWriter writer, OAuthCredential obj) {
    // Write AuthCredential object to binary
    writer.writeString(obj.providerId);
    writer.writeString(obj.signInMethod);
    writer.writeString(obj.idToken ?? '');
    writer.writeString(obj.accessToken ?? '');
    // Write additional fields if necessary
  }
}
