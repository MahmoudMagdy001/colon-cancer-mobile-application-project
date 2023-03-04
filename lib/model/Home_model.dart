import 'package:ColonCancer/modules/auth/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../layout/home_layout.dart';

class HomeModel extends StatelessWidget {
  const HomeModel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasData) {
              return homeLayout();
            } else if (snapshot.hasError) {
              return const Center(child: Text('Something Went Wrong!'));
            } else {
              return authModule();
            }
          },
        ),
      );
}
