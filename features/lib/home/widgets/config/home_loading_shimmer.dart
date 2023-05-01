import 'package:components/design_components.dart';
import 'package:flutter/material.dart';

class HomeLoadingShimmer extends StatelessWidget {
  const HomeLoadingShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ShimmerEffect(
            width: MediaQuery.of(context).size.width,
            height: 400,
          ),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 12.0,
            ),
            child: Wrap(
              runSpacing: 12,
              children: const [
                CarouselLoadingShimmer(),
                CarouselLoadingShimmer(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CarouselLoadingShimmer extends StatelessWidget {
  const CarouselLoadingShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 240,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ShimmerEffect(
            width: 140,
            height: 28,
          ),
          const SizedBox(height: 12),
          Expanded(
            child: ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: 4,
              itemBuilder: (context, index) {
                return const ShimmerEffect(
                  width: 150,
                  height: 180,
                );
              },
              separatorBuilder: (_, __) => const SizedBox(width: 16),
            ),
          ),
        ],
      ),
    );
  }
}
