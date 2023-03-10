// ignore_for_file: use_key_in_widget_constructors

import 'package:ColonCancer/model/google_signin.dart';
import 'package:ColonCancer/modules/show_record/show_record_screen.dart';
import 'package:ColonCancer/modules/tumor_marker/tumor_marker_screen.dart';
import 'package:ColonCancer/shared/bloc_observer.dart';
import 'package:ColonCancer/shared/constants/dark_theme.dart';
import 'package:ColonCancer/shared/constants/light_mode.dart';
import 'package:ColonCancer/shared/cubit/cubit.dart';
import 'package:ColonCancer/shared/cubit/states.dart';
import 'package:ColonCancer/shared/network/remote/dio_Helper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'modules/splash/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit()..getcancer(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return ChangeNotifierProvider(
            create: (context) => GoogleSignInProvider(),
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              home: splashScreen(),
              theme: lightmode,
              darkTheme: darkTheme,
              themeMode: ThemeMode.light,
              routes: {
                '/task-detail': (context) => showRecordScreen(),
                '/tumor-marker': (context) => TumorMarkerScreen(),
              },
            ),
          );
        },
      ),
    );
  }
}
