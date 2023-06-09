import 'package:flutter/material.dart';

enum SnackBarStatus { positive, negative }

void showSnackAlert({
  required BuildContext context,
  required SnackBarStatus status,
  required String message,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      behavior: SnackBarBehavior.floating,
      dismissDirection: DismissDirection.down,
      content: Text(message),
      duration: const Duration(seconds: 4),
      backgroundColor: status == SnackBarStatus.positive
          ? const Color(0xff408140)
          : const Color(0xffD93B41),
      action: status == SnackBarStatus.negative
          ? SnackBarAction(
              label: 'X',
              textColor: Colors.white,
              onPressed: () =>
                  ScaffoldMessenger.of(context).hideCurrentSnackBar(),
            )
          : null,
    ),
  );
}
