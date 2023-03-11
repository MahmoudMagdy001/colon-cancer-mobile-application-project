// ignore_for_file: must_be_immutable

import 'package:ColonCancer/shared/components/sized_box/sized_box.dart';
import 'package:ColonCancer/shared/cubit/cubit.dart';
import 'package:ColonCancer/shared/cubit/states.dart';
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

  @override
  Widget build(BuildContext context) {
    final Map args = ModalRoute.of(context)!.settings.arguments as Map;
    final int id = args['id'];
    final String name = args['name'];
    final String age = args['age'];
    final String gender = args['gender'];
    final String one = args['one'];
    final String two = args['two'];
    final String three = args['three'];
    final String four = args['four'];
    final String five = args['five'];

    // OneController.text = '$one';
    // TwoController.text = '$two';
    // ThreeController.text = '$three';
    // FourController.text = '$four';
    // FiveController.text = '$five';

    return BlocProvider(
      create: (BuildContext context) => AppCubit()
        ..updateData(
            id: id, one: one, two: two, three: three, four: four, five: five),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = AppCubit.get(context);

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
                        onPressed: () {
                          cubit.updateData(
                            id: id,
                            one: OneController.text,
                            two: TwoController.text,
                            three: ThreeController.text,
                            four: FourController.text,
                            five: FiveController.text,
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
