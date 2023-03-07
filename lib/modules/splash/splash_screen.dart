// ignore_for_file: camel_case_types, use_key_in_widget_constructors

import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/components/defult_text/text.dart';
import '../../shared/cubit/cubit.dart';
import '../../shared/cubit/states.dart';
import '../../shared/styles/colors.dart';
import '../onboarding/onboarding_screen.dart';

class splashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (BuildContext context, state) {},
      builder: (context, state) => Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: backGroundColor,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: backGroundColor,
            statusBarIconBrightness: Brightness.dark,
          ),
        ),
        body: EasySplashScreen(
          logo: Image.asset('images/colon.png'),
          logoWidth: 100.0,
          title: defaultText(
              text: 'COLON CANCER APP',
              color: allColor,
              fontSize: 20.0,
              fontWeight: FontWeight.w900),
          backgroundColor: backGroundColor,
          showLoader: true,
          loadingText: defaultText(
              text: 'Loading...',
              color: allColor,
              fontWeight: FontWeight.w500,
              fontSize: 17.0),
          loaderColor: allColor,
          navigator: onBoardingScreen(),
          durationInSeconds: 5,
        ),
      ),
    );
  }
}
