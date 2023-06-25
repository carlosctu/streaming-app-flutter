import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserInfoCubit extends Cubit<UserCredential?> {
  UserInfoCubit() : super(null);

  void updateUserInfo(UserCredential? credential) {
    emit(credential);
  }
}
