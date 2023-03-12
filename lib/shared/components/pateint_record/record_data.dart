import 'package:ColonCancer/shared/cubit/test.dart';
import 'package:ColonCancer/shared/styles/colors.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';

Widget buildTaskItem(Map model, context) => InkWell(
      onTap: () async {
        final dbHelper = DatabaseHelper();
        final db = await dbHelper.database;

        final List<Map<String, dynamic>> result = await db.query('forum');

        if (result.isNotEmpty) {
          final row = result.first;
          final id = row['id'];
          final name = row['name'];
          final age = row['age'];
          final date = row['date'];
          final weight = row['weight'];
          final height = row['height'];
          final BSA = row['BSA'];
          final gender = row['gender'];
          final smoke = row['smoke'];

          // Do something with the data...
          Navigator.pushNamed(
            context,
            '/task-detail',
            arguments: {
              'id': id,
              'name': name,
              'date': date,
              'age': age,
              'weight': weight,
              'height': height,
              'BSA': BSA,
              'gender': gender,
              'smoke': smoke,
            },
          );
        }
      },
      child: Card(
        child: Dismissible(
          key: Key(model['id'].toString()),
          onDismissed: (direction) {},
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '${model['id']}-',
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87),
                ),
                const SizedBox(width: 10.0),
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
      ),
    );

Widget tasksBuilder({required List<Map> data}) => ConditionalBuilder(
      condition: data.isNotEmpty,
      builder: (context) => ListView.separated(
        physics: BouncingScrollPhysics(),
        separatorBuilder: (context, index) => SizedBox(height: 5),
        itemCount: data.length,
        itemBuilder: (context, index) => buildTaskItem(data[index], context),
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
