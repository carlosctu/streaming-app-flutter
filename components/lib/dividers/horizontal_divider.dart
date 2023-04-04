import 'package:flutter/material.dart';

class HorizontalDivider extends StatelessWidget {
  final String? text;
  final double? indent;
  final double? endIndent;
  const HorizontalDivider({
    super.key,
    this.text,
    this.indent,
    this.endIndent,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        minHeight: 24,
      ),
      child: text == null
          ? Divider(
              thickness: 1,
              indent: indent,
              endIndent: endIndent,
            )
          : Row(
              children: [
                Expanded(
                  child: Divider(thickness: 1, indent: indent),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Text(text!),
                ),
                Expanded(
                  child: Divider(thickness: 1, endIndent: endIndent),
                ),
              ],
            ),
    );
  }
}
