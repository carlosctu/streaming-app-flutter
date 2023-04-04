import 'package:components/image_component/config/image_component_mixin.dart';
import 'package:components/image_component/config/streaming_app_assets.dart';
import 'package:components/row/text_icon_row.dart';
import 'package:flutter/material.dart';

class AssetComponent extends StatelessWidget with ImageComponentMixin {
  final double width;
  final double height;
  final Color? color;
  final StreamingAppAssets? asset;
  final IconAsset? icon;
  const AssetComponent({
    super.key,
    this.width = 28,
    this.height = 28,
    this.color,
    this.asset,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      asset != null ? getAsset(asset!) : getIcon(icon!),
      color: color,
      height: height,
      width: width,
    );
  }
}
