import 'dart:ui';

import 'package:features/home/widgets/floating_bottom_app_bar/floating_bottom_app_bar_item.dart';
import 'package:flutter/material.dart';

class FloatingBottomAppBar extends StatefulWidget {
  final PageController controller;
  const FloatingBottomAppBar({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  State<FloatingBottomAppBar> createState() => _FloatingBottomAppBarState();
}

class _FloatingBottomAppBarState extends State<FloatingBottomAppBar> {
  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Container(
        padding: const EdgeInsets.only(bottom: 16),
        child: Align(
          alignment: AlignmentDirectional.bottomCenter,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 6, sigmaY: 3),
              child: LayoutBuilder(
                builder: (context, constrains) {
                  return Container(
                    color: Colors.black.withOpacity(0.3),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FloatingBottomAppBarItem(
                          constrains: constrains,
                          onPressed: () => setState(
                            () => widget.controller.jumpToPage(0),
                          ),
                          position: FloatingBottomAppBarItemPosition.left,
                          icon: Icons.search,
                          isSelected: widget.controller.page?.toInt() == 0,
                        ),
                        const SizedBox(width: 4),
                        FloatingBottomAppBarItem(
                          constrains: constrains,
                          onPressed: () => setState(
                            () => widget.controller.jumpToPage(1),
                          ),
                          position: FloatingBottomAppBarItemPosition.center,
                          icon: Icons.home,
                          isSelected: widget.controller.page?.toInt() == 1,
                        ),
                        const SizedBox(width: 4),
                        FloatingBottomAppBarItem(
                          constrains: constrains,
                          onPressed: () => setState(
                            () => widget.controller.jumpToPage(2),
                          ),
                          position: FloatingBottomAppBarItemPosition.right,
                          icon: Icons.person,
                          isSelected: widget.controller.page?.toInt() == 2,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
