import 'package:ColonCancer/modules/forum/forum_screen.dart';
import 'package:ColonCancer/shared/components/navigator_push/navigator_push.dart';

import 'package:ColonCancer/shared/components/sized_box/sized_box.dart';
import 'package:ColonCancer/shared/cubit/test.dart';
import 'package:ColonCancer/shared/styles/colors.dart';
import 'package:flutter/material.dart';

class recordsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: allColor,
        onPressed: () {
          navigatePushTo(context, forumScreen());
        },
        child: Icon(Icons.add),
      ),
      body: Container(
        child: FutureBuilder(
          future: getDataFromDatabase(),
          builder: (BuildContext context,
              AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
            if (snapshot.hasData) {
              return ListView.separated(
                physics: BouncingScrollPhysics(),
                itemCount: snapshot.data!.length,
                separatorBuilder: (context, index) => 0.ph,
                itemBuilder: (context, index) {
                  final row = snapshot.data![index];
                  final id = row['id'];
                  final name = row['name'];
                  final age = row['age'];
                  final date = row['date'];
                  final weight = row['weight'];
                  final height = row['height'];
                  final BSA = row['BSA'];
                  final gender = row['gender'];
                  final smoke = row['smoke'];

                  return InkWell(
                    onTap: () {
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
                    },
                    child: Card(
                      child: Dismissible(
                        onDismissed: (direction) async {
                          final db = await DatabaseHelper().database;
                          await db.delete('forum',
                              where: 'id = ?', whereArgs: [id]);
                        },
                        key: Key(id.toString()),
                        child: Padding(
                          padding: EdgeInsets.all(
                            20.0,
                          ),
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  '$id-',
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black87),
                                ),
                                10.pw,
                                Expanded(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        name,
                                        style: TextStyle(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black87),
                                      ),
                                      5.ph,
                                      //////// date of patient
                                      Text(
                                        date,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w700,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ]),
                        ),
                      ),
                    ),
                  );
                },
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }

  Future<List<Map<String, dynamic>>> getDataFromDatabase() async {
    final dbHelper = DatabaseHelper();
    final db = await dbHelper.database;

    final List<Map<String, dynamic>> result = await db.query('forum');

    return result;
  }
}
