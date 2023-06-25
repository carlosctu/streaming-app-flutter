
import 'package:flutter/material.dart';

enum FloatingBottomAppBarItemPosition { left, center, right }

class FloatingBottomAppBarItem extends StatelessWidget {
  final BoxConstraints constrains;
  final Function() onPressed;
  final FloatingBottomAppBarItemPosition position;
  final IconData icon;
  final bool isSelected;
  const FloatingBottomAppBarItem({
    Key? key,
    required this.constrains,
    required this.onPressed,
    required this.position,
    required this.icon,
    this.isSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BorderRadiusGeometry buildButtonBorderRadius() {
      switch (position) {
        case FloatingBottomAppBarItemPosition.left:
          return const BorderRadius.only(
            topLeft: Radius.circular(12),
            bottomLeft: Radius.circular(12),
          );
        case FloatingBottomAppBarItemPosition.center:
          return const BorderRadius.all(Radius.circular(8));
        case FloatingBottomAppBarItemPosition.right:
          return const BorderRadius.only(
            topRight: Radius.circular(12),
            bottomRight: Radius.circular(12),
          );
      }
    }

    return IconButton(
      padding: EdgeInsets.zero,
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      color: Colors.white,
      icon: Container(
        height: constrains.maxHeight,
        width: constrains.maxWidth,
        decoration: BoxDecoration(
          color: isSelected
              ? const Color(0xffD93B41).withOpacity(0.6)
              : Colors.transparent,
          borderRadius: buildButtonBorderRadius(),
        ),
        child: Icon(icon),
      ),
      onPressed: onPressed,
    );
  }
}
