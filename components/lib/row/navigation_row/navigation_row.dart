
import 'package:flutter/material.dart';

class NavigationRow extends StatelessWidget {
  final Widget? leading;
  final Widget? leftContent;
  final Widget? trailing;
  final Widget? rightContent;
  final Function()? onPressed;
  final bool showDivider;
  const NavigationRow({
    Key? key,
    this.leading,
    this.leftContent,
    this.trailing,
    this.rightContent,
    this.onPressed,
    this.showDivider = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          splashFactory: NoSplash.splashFactory,
          onTap: onPressed,
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 32,
              vertical: 16,
            ),
            child: IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  if (leading != null)
                    Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.only(right: 16),
                      child: leading,
                    ),
                  if (leftContent != null)
                    Flexible(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: leftContent,
                      ),
                    ),
                  if (rightContent != null)
                    Flexible(
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: rightContent,
                      ),
                    ),
                  Container(
                    padding: const EdgeInsets.only(left: 12),
                    child: trailing ??
                        const Icon(
                          Icons.arrow_forward_ios,
                          size: 18,
                        ),
                  ),
                ],
              ),
            ),
          ),
        ),
        if (showDivider)
          Divider(
            height: 1,
            indent: 32,
            endIndent: 32,
            color: Colors.black.withOpacity(0.4),
          )
      ],
    );
  }
}
