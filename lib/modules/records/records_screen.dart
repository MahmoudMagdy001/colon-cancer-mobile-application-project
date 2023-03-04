// ignore_for_file: prefer_final_fields, use_key_in_widget_constructors, must_be_immutable, avoid_print, sized_box_for_whitespace, unused_local_variable, camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icons_plus/icons_plus.dart';

import '../../shared/components/divider/divider.dart';
import '../../shared/cubit/cubit.dart';
import '../../shared/cubit/states.dart';
import '../../shared/styles/colors.dart';


class recordsScreen extends StatelessWidget {
  List<String> _items = [
    'patient 1',
    'patient 2',
    'patient 3',
    'patient 4',
    'patient 5',
    'patient 6',
    'patient 7',
    'patient 8',
    'patient 9',
    'patient 10',
    'patient 11',
    'patient 12',
    'patient 13',
    'patient 14',
  ];

  List<String> _dates = [
    '1/2/2022',
    '2/2/2022',
    '3/2/2022',
    '4/2/2022',
    '5/2/2022',
    '6/2/2022',
    '7/2/2022',
    '8/2/2022',
    '9/2/2022',
    '10/2/2022',
    '11/2/2022',
    '12/2/2022',
    '13/2/2022',
    '14/2/2022',
  ];
  var searchContoller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        AppCubit cubit = AppCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: backGroundColor,
            title: TextFormField(
              controller: searchContoller,
              keyboardType: TextInputType.text,
              // validator: (value) {},
              decoration: const InputDecoration(
                labelText: 'Search',
                prefixIcon: Icon(
                  Icons.search,
                ),
              ),
            ),
          ),
          body: ListView.separated(
            separatorBuilder: (context, index) => CustomDivider(),
            itemCount: _items.length,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) => Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  height: 65,
                  child: Column(
                    children: [
                      Expanded(
                        child: Text(
                          _items[index],
                          style: const TextStyle(
                              fontSize: 20.0,
                              color: Colors.black87,
                              fontWeight: FontWeight.w600),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Text(
                        _dates[index],
                        style: const TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Bootstrap.download,
                    color: allColor,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
