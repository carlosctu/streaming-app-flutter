import 'package:flutter/material.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  bool isDarkModeActive = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        leadingWidth: 0,
        title: const Padding(
          padding: EdgeInsets.only(left: 12),
          child: Text(
            'Profile',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Wrap(
          children: [
            NavigationRow(
              onPressed: () {},
              leading: const Icon(Icons.person_2_outlined),
              leftContent: const Text('Edit Profile'),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                size: 18,
              ),
            ),
            NavigationRow(
              onPressed: () {},
              leading: const Icon(Icons.language),
              leftContent: const Text('Language'),
              rightContent: const Text('English (US)'),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                size: 18,
              ),
            ),
            NavigationRow(
              leading: const Icon(Icons.visibility_outlined),
              leftContent: const Text('Dark Mode'),
              trailing: ConstrainedBox(
                constraints: const BoxConstraints(maxHeight: 24),
                child: Switch(
                  value: isDarkModeActive,
                  activeColor: const Color(0xffD93B41),
                  onChanged: (bool value) {
                    setState(() => isDarkModeActive = value);
                  },
                ),
              ),
            ),
            NavigationRow(
              onPressed: () {},
              leading: const Icon(
                Icons.logout_outlined,
                color: Color(0xffD93B41),
              ),
              leftContent: const Text(
                'Logout',
                style: TextStyle(
                  color: Color(0xffD93B41),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NavigationRow extends StatelessWidget {
  final Widget? leading;
  final Widget leftContent;
  final Widget? trailing;
  final Widget? rightContent;
  final Function()? onPressed;
  const NavigationRow({
    Key? key,
    this.leading,
    required this.leftContent,
    this.trailing,
    this.rightContent,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          key: const Key('ActionRowButton'),
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
                        child: rightContent!,
                      ),
                    ),
                  if (trailing != null)
                    Container(
                      padding: const EdgeInsets.only(left: 12),
                      child: trailing,
                    ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
