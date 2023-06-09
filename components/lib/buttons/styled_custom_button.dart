import 'package:components/buttons/styled_button_foundation.dart';
import 'package:flutter/material.dart';

class StyledCustomButton extends StatelessWidget {
  final Function() onPressed;
  final Widget content;
  final bool isColored;
  final bool isDisabled;
  final bool isLoading;
  const StyledCustomButton({
    super.key,
    required this.onPressed,
    required this.content,
    this.isColored = true,
    this.isDisabled = false,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return StyledButtonFoundation(
      isColored: isColored,
      content: content,
      onPressed: onPressed,
      isDisabled: isDisabled,
      isLoading: isLoading,
    );
  }
}
