import 'package:ColonCancer/shared/components/button/button.dart';
import 'package:ColonCancer/shared/components/chart/char_screen.dart';

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
    final String one = args['one'];
    final String two = args['two'];
    final String three = args['three'];
    final String four = args['four'];
    final String five = args['five'];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Patient #$id',
          style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Colors.black87),
        ),
        //   ],
        // ),
        elevation: 5.0,
      ),
      body: Padding(
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
              Container(
                width: double.infinity,
                height: 320,
                child: chartScreen(),
              ),
              CustomButton(
                label: 'Add Tumor Marker',
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    '/tumor-marker',
                    arguments: {
                      'id': id,
                      'name': name,
                      'age': age,
                      'gender': gender,
                      'one': one,
                      'two': two,
                      'three': three,
                      'four': four,
                      'five': five,
                    },
                  );

                  // Navigator.pushNamed(
                  //   context,
                  //   '/tumor-marker',
                  //   arguments: {
                  //     'id': model['id'],
                  //     'name': model['name'],
                  //     'date': model['date'],
                  //     'age': model['age'],
                  //     'weight': model['weight'],
                  //     'height': model['height'],
                  //     'BSA': model['BSA'],
                  //     'gender': model['gender'],
                  //     'smoke': model['smoke'],
                  //   },
                  // );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
