// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_credential_info.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserCredentialInfoAdapter extends TypeAdapter<UserCredentialInfo> {
  @override
  final int typeId = 1;

  @override
  UserCredentialInfo read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserCredentialInfo(
      fields[0] as OAuthCredential?,
    );
  }

  @override
  void write(BinaryWriter writer, UserCredentialInfo obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.credential);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserCredentialInfoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
