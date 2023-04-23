import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerEffect extends StatelessWidget {
  final double width;
  final double height;
  const ShimmerEffect({
    super.key,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: const Color(0xffEEEEEE),
      highlightColor: const Color(0xffE0E0E0),
      child: Container(
        width: width,
        height: height,
        color: Colors.grey[200],
      ),
    );
  }
}
