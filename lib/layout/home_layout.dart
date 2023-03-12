// ignore_for_file: use_key_in_widget_constructors, camel_case_types, unused_local_variable, prefer_const_constructors, must_be_immutable, avoid_print, unused_import

import 'package:ColonCancer/shared/components/navigator_push/navigator_push.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../modules/forum/forum_screen.dart';
import '../shared/components/drawer/drawer.dart';
import '../shared/components/navigator_push_replacment/navigator_replacment.dart';
import '../shared/components/text/text.dart';
import '../shared/cubit/cubit.dart';
import '../shared/cubit/states.dart';
import '../shared/styles/colors.dart';

class homeLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit()..getcancer(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          AppCubit cubit = AppCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              elevation: 5.0,
              title: CustomText(
                text: cubit.titles[cubit.currentIndex],
                fontSize: 20.0,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
              actions: [
                // IconButton(
                //   onPressed: () {

                //   },
                //   icon: Icon(Icons.add, color: allColor),
                // ),
              ],
            ),
            drawer: MyDrawer(),
            body: cubit.screens[cubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              elevation: 10.0,
              currentIndex: cubit.currentIndex,
              onTap: (index) {
                cubit.changeBottomNavBar(index);
              },
              items: cubit.bottomItems,
            ),
          );
        },
      ),
    );
  }
}
