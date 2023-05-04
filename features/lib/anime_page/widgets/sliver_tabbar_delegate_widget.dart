import 'package:flutter/material.dart';

class SliverTabbarDelegateWidget extends SliverPersistentHeaderDelegate {
  final TabController controller;
  SliverTabbarDelegateWidget({
    required this.controller,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey.shade400, width: 1.0),
        ),
      ),
      child: TabBar(
        isScrollable: true,
        controller: controller,
        labelColor: Colors.black,
        indicatorColor: const Color(0xffD93B41),
        tabs: const [
          Tab(text: 'Episodes'),
          Tab(text: 'Trailer'),
        ],
      ),
    );
  }

  @override
  double get maxExtent => 36;

  @override
  double get minExtent => 36;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
