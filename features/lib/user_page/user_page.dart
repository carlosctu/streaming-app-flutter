import 'package:components/design_components.dart';
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
