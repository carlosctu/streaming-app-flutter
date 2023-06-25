import 'package:components/design_components.dart';
import 'package:features/shared/providers/user_info_cubit.dart';
import 'package:features/splash_screen/services/authentication_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  bool isDarkModeActive = false;

  @override
  Widget build(BuildContext context) {
    final authService = AuthenticationService();
    final userInfoCubit = context.watch<UserInfoCubit>();
    final userInfo = userInfoCubit.state?.user;

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
        padding: const EdgeInsets.only(top: 32),
        child: Wrap(
          children: [
            if (userInfo != null)
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 16,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${userInfo.displayName}',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text('${userInfo.email}'),
                      ],
                    )
                  ],
                ),
              ),
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
                Icons.help_outline,
              ),
              leftContent: const Text(
                'Help Center',
                style: TextStyle(),
              ),
            ),
            NavigationRow(
              onPressed: () {
                authService.deleteUserData();
                Navigator.pushReplacementNamed(context, '/');
              },
              leading: const Icon(
                Icons.logout_outlined,
                color: Color(0xffD93B41),
              ),
              trailing: const SizedBox.shrink(),
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
