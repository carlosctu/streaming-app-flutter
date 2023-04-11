import 'package:components/buttons/config/styled_button_foundation_mixin.dart';
import 'package:flutter/material.dart';

class StyledButtonFoundation extends StatelessWidget
    with StyledButtonFoundationMixin {
  final Widget content;
  final Function() onPressed;
  final bool isColored;
  final bool isDisabled;
  const StyledButtonFoundation({
    super.key,
    required this.content,
    this.isColored = false,
    required this.onPressed,
    this.isDisabled = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      constraints: const BoxConstraints(
        minHeight: 42,
        maxHeight: 46,
      ),
      decoration: BoxDecoration(
        color: getButtonColor(isColored, isDisabled),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: const Color.fromARGB(255, 219, 219, 220),
        ),
      ),
      width: MediaQuery.of(context).size.width / 1.2,
      child: MaterialButton(
        onPressed: isDisabled ? null : onPressed,
        child: DefaultTextStyle(
          style: TextStyle(
            fontWeight: FontWeight.w600,
            letterSpacing: 0.5,
            color: isColored ? Colors.white : Colors.grey.shade600,
          ),
          child: content,
        ),
      ),
    );
  }
}
