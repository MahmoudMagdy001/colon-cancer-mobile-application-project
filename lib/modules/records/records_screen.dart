// ignore_for_file: prefer_final_fields, use_key_in_widget_constructors, must_be_immutable, avoid_print, sized_box_for_whitespace, unused_local_variable, camel_case_types

import 'package:ColonCancer/shared/components/pateint_record/record_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/cubit/cubit.dart';
import '../../shared/cubit/states.dart';

class recordsScreen extends StatelessWidget {
  var searchContoller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var dataa = AppCubit.get(context).newForum;
        return tasksBuilder(
          data: dataa,
        );
      },
    );
  }
}
