// ignore_for_file: use_key_in_widget_constructors, use_build_context_synchronously, unnecessary_cast, unused_local_variable

import 'package:ColonCancer/model/google_signin.dart';
import 'package:ColonCancer/shared/components/navigator_push/navigator_push.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../../modules/auth/auth.dart';
import '../../../modules/forum/forum_screen.dart';
import '../../cubit/cubit.dart';
import '../../cubit/states.dart';
import '../../styles/colors.dart';
import '../divider/divider.dart';
import '../navigator_push_replacment/navigator_replacment.dart';
import '../text/text.dart';

class MyDrawer extends StatelessWidget {
  final auth = FirebaseAuth.instance;
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, Object? state) {
        var cubit = AppCubit.get(context);
        return Drawer(
          elevation: 15.0,
          child: ListView(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.zero,
            children: <Widget>[
              UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: backGroundColor),
                accountName: CustomText(
                  text: user.displayName ?? '',
                  color: allColor,
                  fontWeight: FontWeight.bold,
                ),
                accountEmail: CustomText(
                  text: 'Email: ${user.email ?? ''}',
                  color: allColor,
                  fontWeight: FontWeight.bold,
                ),
                currentAccountPicture: CircleAvatar(
                  foregroundColor: Colors.white,
                  radius: 40,
                  backgroundImage: user.photoURL != null
                      ? NetworkImage(user.photoURL!)
                      : NetworkImage(
                          'https://previews.123rf.com/images/tuktukdesign/tuktukdesign1606/tuktukdesign160600119/59070200-user-icon-man-profil-homme-d-affaires-avatar-personne-ic%C3%B4ne-illustration-vectorielle.jpg',
                        ),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.chat_outlined,
                  color: allColor,
                ),
                title: CustomText(
                  text: 'Forum',
                  color: drawerColor,
                ),
                onTap: () {
                  navigatePushTo(context, forumScreen());
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.settings_outlined,
                  color: allColor,
                ),
                title: CustomText(
                  text: 'Account Settings',
                  color: drawerColor,
                ),
                onTap: () {
                  // Add navigation code here
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.info_outline,
                  color: allColor,
                ),
                title: CustomText(
                  text: 'Help',
                  color: drawerColor,
                ),
                onTap: () {
                  // Add navigation code here
                },
              ),
              const SizedBox(height: 10),
              CustomDivider(),
              const SizedBox(height: 10),
              ListTile(
                leading: Icon(
                  Icons.logout_outlined,
                  color: allColor,
                ),
                title: CustomText(
                  text: 'Log out',
                  color: drawerColor,
                ),
                onTap: () async {
                  await auth.signOut();
                  final provider =
                      Provider.of<GoogleSignInProvider>(context, listen: false);
                  provider.logout();
                  navigatePushReplacementTo(
                    context,
                    authModule(),
                  );
                  // Add navigation code here
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
