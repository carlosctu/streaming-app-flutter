import 'package:flutter/material.dart';

class StyledButtonFoundationMixin {
  Color getButtonColor(bool isColored, bool isDisabled) {
    if (!isColored) return Colors.transparent;
    if (isColored && isDisabled) return Colors.grey;
    return const Color(0xffD93B41);
  }
}
