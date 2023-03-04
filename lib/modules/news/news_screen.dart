// ignore_for_file: use_key_in_widget_constructors, camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/components/article_item/article_item.dart';
import '../../shared/cubit/cubit.dart';
import '../../shared/cubit/states.dart';

class newsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var list = AppCubit.get(context).cancer;
          return articleBuilder(list, context);
        });
  }
}
