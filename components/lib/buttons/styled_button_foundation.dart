import 'package:components/buttons/config/styled_button_foundation_mixin.dart';
import 'package:flutter/material.dart';

class StyledButtonFoundation extends StatelessWidget
    with StyledButtonFoundationMixin {
  final Widget content;
  final Function() onPressed;
  final bool isColored;
  final bool isDisabled;
  final bool isLoading;
  const StyledButtonFoundation({
    super.key,
    required this.content,
    this.isColored = false,
    required this.onPressed,
    this.isDisabled = false,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 4,
        horizontal: 16,
      ),
      constraints: const BoxConstraints(
        minHeight: 42,
        maxHeight: 46,
      ),
      width: double.infinity,
      decoration: BoxDecoration(
        color: getButtonColor(isColored, isDisabled),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: const Color.fromARGB(255, 219, 219, 220),
        ),
      ),
      child: MaterialButton(
        onPressed: isDisabled ? null : onPressed,
        child: DefaultTextStyle(
          style: TextStyle(
            fontWeight: FontWeight.w600,
            letterSpacing: 0.5,
            color: isColored ? Colors.white : Colors.grey.shade600,
          ),
          child: isLoading
              ? SizedBox(
                  height: 22,
                  width: 22,
                  child: Center(
                    child: CircularProgressIndicator(
                      strokeWidth: 4,
                      color: isColored ? Colors.white : const Color(0xffD93B41),
                    ),
                  ),
                )
              : content,
        ),
      ),
    );
  }
}
