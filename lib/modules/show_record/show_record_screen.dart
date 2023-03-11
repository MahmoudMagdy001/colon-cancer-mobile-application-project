// ignore_for_file: must_be_immutable

import 'package:ColonCancer/shared/components/sized_box/sized_box.dart';
import 'package:flutter/material.dart';

class showRecordScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Map args = ModalRoute.of(context)!.settings.arguments as Map;
    final int id = args['id'];
    final String name = args['name'];
    final String date = args['date'];
    final String age = args['age'];
    final String weight = args['weight'];
    final String height = args['height'];
    final String BSA = args['BSA'];
    final String gender = args['gender'];
    final String smoke = args['smoke'];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Patient #$id',
          style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Colors.black87),
        ),
        elevation: 5.0,
      ),
      body: Container(
        child: FutureBuilder<List<TumorMarker>>(
          // future: getDataFromDatabase(),
          builder: (context, snapshot) {
            // if (snapshot.hasData)
            {
              // final List<TumorMarker> tumorData = snapshot.data!;
              return Padding(
                padding: EdgeInsets.all(20.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          'Name: $name',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Date: $date',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Age: $age',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Weight: $weight',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Height: $height',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'BSA: $BSA',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      if (gender == 'true')
                        Text(
                          'Gender: Male',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      if (gender == 'false')
                        Text(
                          'Gender: Female',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      SizedBox(height: 10),
                      if (smoke == '1')
                        Text(
                          'Smoke: Smoker',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      if (smoke == '2')
                        Text(
                          'Smoke: Not Smoker',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                      10.ph,
                      // Container(
                      //     width: double.infinity,
                      //     height: 320,
                      //     child: Column(
                      //       children: [
                      //         //Initialize the chart widget
                      //         SfCartesianChart(
                      //           primaryXAxis: CategoryAxis(),
                      //           // Chart title
                      //           title: ChartTitle(text: 'Tumor Marker Chart'),

                      //           // Enable tooltip
                      //           tooltipBehavior: TooltipBehavior(enable: true),
                      //           series: <ChartSeries<TumorMarker, String>>[
                      //             LineSeries<TumorMarker, String>(
                      //               dataSource: tumorData,
                      //               xValueMapper: (data, _) => data.date,
                      //               yValueMapper: (data, _) => data.value,
                      //               // Enable data label
                      //               dataLabelSettings:
                      //                   DataLabelSettings(isVisible: true),
                      //             ),
                      //           ],
                      //         ),
                      //       ],
                      //     )),
                      // CustomButton(
                      //   label: 'Add Tumor Marker',
                      //   onPressed: () {
                      //     Navigator.pushNamed(
                      //       context,
                      //       '/tumor-marker',
                      //       arguments: {
                      //         'id': id,
                      //         'name': name,
                      //       },
                      //     );
                      //   },
                      // ),
                    ],
                  ),
                ),
              );
            }
            //else
            //return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }

  // Future<List<TumorMarker>> getDataFromDatabase() async {
  //   final dbHelper = DatabaseHelper();
  //   final db = await dbHelper.database;

  //   final List<Map<String, dynamic>> result = await db.query('Tumor');

  //   final List<TumorMarker> tumorData = result
  //       .map((row) => TumorMarker(date: row['date'], value: row['value']))
  //       .toList();

  //   return tumorData;
  // }
}

class TumorMarker {
  final String date;
  final double value;

  TumorMarker({required this.date, required this.value});
}
