import 'package:ColonCancer/layout/home_layout.dart';
import 'package:ColonCancer/shared/components/navigator_push_replacment/navigator_replacment.dart';
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
        title: IconButton(
            onPressed: () {
              navigatePushReplacementTo(context, homeLayout());
            },
            icon: Icon(Icons.arrow_back_ios_new)),
        elevation: 5.0,
      ),
      body: Padding(
        padding: EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Patient #$id',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'Name: $name',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5.0),
            Text(
              'Date: $date',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'Age: $age',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'Weight: $weight',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'Height: $height',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'BSA: $BSA',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.0),
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
            SizedBox(height: 10.0),
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
          ],
        ),
      ),
    );
  }
}
