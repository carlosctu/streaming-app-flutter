import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProgressLoader extends StatelessWidget {
  const ProgressLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget getLoaderIndicator() {
      if (Platform.isIOS) {
        return const CupertinoActivityIndicator(color: Color(0xffD93B41));
      }
      return const CircularProgressIndicator(
        color: Color(0xffD93B41),
        strokeWidth: 3,
      );
    }

    return Center(
      child: SizedBox(
        width: 24,
        height: 24,
        child: getLoaderIndicator(),
      ),
    );
  }
}
