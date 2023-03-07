import 'package:ColonCancer/shared/components/divider/divider.dart';
import 'package:ColonCancer/shared/cubit/cubit.dart';
import 'package:ColonCancer/shared/styles/colors.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';

Widget buildTaskItem(Map model, context) => InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          '/task-detail',
          arguments: {
            'id': model['id'],
            'name': model['name'],
            'date': model['date'],
            'age': model['age'],
            'weight': model['weight'],
            'height': model['height'],
            'BSA': model['BSA'],
            'gender': model['gender'],
            'smoke': model['smoke'],
          },
        );
      },
      child: Dismissible(
        key: Key(model['id'].toString()),
        onDismissed: (direction) {
          AppCubit.get(context).deleteData(
            id: model['id'],
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: [
              const SizedBox(
                width: 20.0,
              ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${model['name']}',
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87),
                    ),

                    SizedBox(height: 5),

                    //////// date of patient

                    Text(
                      '${model['date']}',
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 20.0),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.download,
                  color: allColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );

Widget tasksBuilder({required List<Map> data}) => ConditionalBuilder(
      condition: data.isNotEmpty,
      builder: (context) => ListView.separated(
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) => buildTaskItem(data[index], context),
        separatorBuilder: (context, index) => CustomDivider(),
        itemCount: data.length,
      ),
      fallback: (context) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            Icon(
              Icons.menu,
              size: 100.0,
              color: Colors.grey,
            ),
            Text(
              'No Data Yet, Please Add Some Records',
              style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey),
            )
          ],
        ),
      ),
    );
