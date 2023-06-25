import 'package:components/image_component/image_component.dart';
import 'package:components/row/text_icon_row/config/row_alignment.dart';
import 'package:components/row/text_icon_row/config/row_alignment_mixin.dart';
import 'package:flutter/material.dart';

enum IconAsset { mail }

class TextIconRow extends StatelessWidget with RowAlignmentMixin {
  final IconAsset icon;
  final String label;
  final RowAlignment alignment;
  final Color iconColor;
  const TextIconRow({
    super.key,
    required this.icon,
    required this.label,
    required this.alignment,
    this.iconColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: getAlignment(alignment),
      children: [
        AssetComponent(
          icon: icon,
          color: iconColor,
          width: 24,
          height: 24,
        ),
        const SizedBox(width: 8),
        Flexible(child: Text(label)),
      ],
    );
  }
}
