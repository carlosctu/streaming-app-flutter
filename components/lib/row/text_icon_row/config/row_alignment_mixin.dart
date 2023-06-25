import 'package:components/row/text_icon_row/config/row_alignment.dart';
import 'package:flutter/material.dart';

mixin RowAlignmentMixin {
  MainAxisAlignment getAlignment(RowAlignment alignment) {
    const map = {
      RowAlignment.center: MainAxisAlignment.center,
      RowAlignment.left: MainAxisAlignment.start,
      RowAlignment.right: MainAxisAlignment.end,
    };
    return map[alignment]!;
  }
}
