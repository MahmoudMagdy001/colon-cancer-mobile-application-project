// ignore_for_file: use_key_in_widget_constructors, camel_case_types, prefer_const_constructors

import 'package:ColonCancer/modules/auth/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';

import '../../shared/components/defult_text/text.dart';
import '../../shared/components/navigator_push_replacment/navigator_replacment.dart';
import '../../shared/cubit/cubit.dart';
import '../../shared/cubit/states.dart';
import '../../shared/styles/colors.dart';

class onBoardingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) => OnBoardingSlider(
        finishButtonText: 'LOGIN',
        onFinish: () {
          navigatePushReplacementTo(context, authModule());
        },
        finishButtonColor: allColor,
        skipTextButton: defaultText(
            text: 'SKIP',
            color: allColor,
            fontSize: 16.0,
            fontWeight: FontWeight.w600),
        trailing: defaultText(
            text: 'CREATE AN ACCOUNT',
            color: allColor,
            fontSize: 16,
            fontWeight: FontWeight.w600),
        trailingFunction: () {
          navigatePushReplacementTo(context, authModule());
        },
        controllerColor: allColor,
        totalPage: 3,
        headerBackgroundColor: backGroundColor,
        pageBackgroundColor: backGroundColor,
        background: [
          Image.asset(
            fit: BoxFit.fitWidth,
            'images/find_doctor.png',
            height: 285,
          ),
          Image.asset(
            'images/middle.png',
            height: 450,
          ),
          Image.asset(
            'images/forum.png',
            height: 400,
          ),
        ],
        speed: 1.8,
        pageBodies: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 480,
                ),
                defaultText(
                    text: 'Find Your Doctor',
                    color: darkColor,
                    fontSize: 24.0,
                    fontWeight: FontWeight.w600,
                    textAlign: TextAlign.center),
                SizedBox(
                  height: 20,
                ),
                defaultText(
                    text: 'to find the doctor prefer looking for the app',
                    color: Colors.black26,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w500,
                    textAlign: TextAlign.center),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 480,
                ),
                defaultText(
                    text: 'Storage your Medical Records',
                    color: darkColor,
                    fontSize: 24.0,
                    fontWeight: FontWeight.w600,
                    textAlign: TextAlign.center),
                SizedBox(
                  height: 20,
                ),
                defaultText(
                    text: 'Save your records and use it anytime',
                    color: Colors.black26,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w500,
                    textAlign: TextAlign.center),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 480,
                ),
                defaultText(
                    text: 'Discuss in the Forum',
                    color: darkColor,
                    fontSize: 24.0,
                    fontWeight: FontWeight.w600,
                    textAlign: TextAlign.center),
                SizedBox(
                  height: 20,
                ),
                defaultText(
                  text: 'know anything about patient',
                  color: Colors.black26,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w500,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
