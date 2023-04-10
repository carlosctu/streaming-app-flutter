import 'package:components/buttons/styled_button_foundation.dart';
import 'package:components/image_component/config/streaming_app_assets.dart';
import 'package:components/image_component/image_component.dart';
import 'package:flutter/material.dart';

class StyledAuthButton extends StatelessWidget {
  final Function() onPressed;
  final StreamingAppAssets asset;
  final String label;
  final bool isDisabled;
  const StyledAuthButton({
    super.key,
    required this.onPressed,
    required this.asset,
    required this.label,
    this.isDisabled = false,
  });

  @override
  Widget build(BuildContext context) {
    return StyledButtonFoundation(
      isColored: false,
      isDisabled: isDisabled,
      content: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AssetComponent(asset: asset),
          const SizedBox(width: 16),
          Text(label),
        ],
      ),
      onPressed: onPressed,
    );
  }
}
