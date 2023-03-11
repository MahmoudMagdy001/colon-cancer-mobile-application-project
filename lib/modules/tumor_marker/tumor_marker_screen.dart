// ignore_for_file: must_be_immutable

import 'package:ColonCancer/shared/components/sized_box/sized_box.dart';
import 'package:ColonCancer/shared/cubit/cubit.dart';
import 'package:ColonCancer/shared/cubit/states.dart';
import 'package:ColonCancer/shared/cubit/test.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/components/button/button.dart';
import '../../shared/components/divider/divider.dart';
import '../../shared/components/text_form_field/text_form_field.dart';

class TumorMarkerScreen extends StatelessWidget {
  var NameController = TextEditingController();
  var OneController = TextEditingController();
  var TwoController = TextEditingController();
  var ThreeController = TextEditingController();
  var FourController = TextEditingController();
  var FiveController = TextEditingController();

  String? onetext;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          final Map args = ModalRoute.of(context)!.settings.arguments as Map;
          final int id = args['id'];
          final String name = args['name'];

          return Scaffold(
            appBar: AppBar(
              elevation: 5.0,
              title: Text(
                'Tumor Marker',
                style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.black87,
                    fontWeight: FontWeight.bold),
              ),
            ),
            body: SingleChildScrollView(
              child: SafeArea(
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      10.ph,
                      customTextFormField(
                        type: TextInputType.text,
                        validator: (value) {},
                        controller: NameController,
                        label: '$id- ' + '$name',
                        fontWeight: FontWeight.bold,
                        labelcolor: Colors.black87,
                        labelsize: 18.0,
                        prefix: Icons.person,
                        prefixcolor: Colors.black87,
                        readOnly: true,
                        border: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 3.0, color: Colors.black87)),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 3.0, color: Colors.black87)),
                      ),
                      10.ph,
                      CustomDivider(),
                      SizedBox(height: 10),
                      customTextFormField(
                        type: TextInputType.number,
                        validator: (value) {},
                        controller: OneController,
                        onChange: (value) {
                          value = onetext!;
                        },
                        label: 'CEA',
                        prefix: Icons.numbers_rounded,
                        suffixlabel: 'IU/ml',
                      ),
                      10.ph,
                      customTextFormField(
                        type: TextInputType.number,
                        validator: (value) {},
                        controller: TwoController,
                        label: 'CA19-9',
                        prefix: Icons.numbers_rounded,
                        suffixlabel: 'IU/ml',
                      ),
                      10.ph,
                      customTextFormField(
                        type: TextInputType.number,
                        validator: (value) {},
                        controller: ThreeController,
                        label: 'CA50',
                        prefix: Icons.numbers_rounded,
                        suffixlabel: 'IU/ml',
                      ),
                      10.ph,
                      customTextFormField(
                        type: TextInputType.number,
                        validator: (value) {},
                        controller: FourController,
                        label: 'CA24-2',
                        prefix: Icons.numbers_rounded,
                        suffixlabel: 'IU/ml',
                      ),
                      10.ph,
                      customTextFormField(
                        type: TextInputType.number,
                        validator: (value) {},
                        controller: FiveController,
                        label: 'AFP',
                        prefix: Icons.numbers_rounded,
                        suffixlabel: 'IU/ml',
                      ),
                      180.ph,
                      CustomButton(
                        label: 'SHOW RESULT',
                        onPressed: () async {
                          final dbHelper = DatabaseHelper();
                          final db = await dbHelper.database;

                          await db.insert('Tumor', {
                            'id': id,
                            'one': onetext,
                            // 'two': TwoController.text,
                            // 'three': ThreeController,
                            // 'four': FourController,
                            // 'five': FiveController,
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
