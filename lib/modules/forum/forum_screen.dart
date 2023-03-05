// ignore_for_file: camel_case_types, use_key_in_widget_constructors, must_be_immutable, non_constant_identifier_names

import 'dart:math';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../layout/home_layout.dart';

import '../../shared/components/navigator_push_replacment/navigator_replacment.dart';
import '../../shared/components/text/text.dart';
import '../../shared/components/text_form_field/text_form_field.dart';
import '../../shared/cubit/cubit.dart';
import '../../shared/cubit/states.dart';
import '../../shared/styles/colors.dart';

class forumScreen extends StatelessWidget {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  var nameContoller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit()..createDatabase(),
      child: BlocConsumer<AppCubit, AppStates>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = AppCubit.get(context);
            var height = cubit.height;
            var weight = cubit.weight;
            var BSAA = sqrt((height * weight) / 3600);
            var gender = cubit.isMale;
            var smoke = cubit.isSelected;
            return Scaffold(
              appBar: AppBar(
                elevation: 5.0,
                title: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        navigatePushReplacementTo(context, homeLayout());
                      },
                      color: allColor,
                      icon: const Icon(
                        Icons.arrow_back_ios_new,
                      ),
                    ),
                    const SizedBox(width: 10),
                    CustomText(
                      text: 'Forum',
                      color: allColor,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
              ),
              body: SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                physics: const BouncingScrollPhysics(),
                child: Form(
                  key: formkey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // NAME
                      customTextFormField(
                        type: TextInputType.name,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Name must not be empty';
                          }
                          return null;
                        },
                        controller: nameContoller,
                        label: 'PATIENT NAME',
                        prefix: Icons.person,
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                cubit.changeGender();
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: cubit.isMale
                                      ? Colors.blue
                                      : backGroundColor,
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Icon(
                                      Icons.male,
                                      size: 65.0,
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      "Male",
                                      style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                cubit.changeGender();
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: !cubit.isMale
                                      ? Colors.pink
                                      : backGroundColor,
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Icon(
                                      Icons.female,
                                      size: 65.0,
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      "Female",
                                      style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15.0),
                      Container(
                        decoration: BoxDecoration(
                          color: backGroundColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "AGE",
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Row(
                              textBaseline: TextBaseline.alphabetic,
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '${cubit.age.round()}',
                                  style: const TextStyle(
                                    fontSize: 40,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                              ],
                            ),
                            Slider(
                                activeColor:
                                    !cubit.isMale ? Colors.pink : Colors.blue,
                                value: cubit.age,
                                min: 10,
                                max: 90,
                                onChanged: (Value) {
                                  cubit.changeAge(Value);
                                  print(Value);
                                })
                          ],
                        ),
                      ),
                      SizedBox(height: 15),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                  color: backGroundColor,
                                  borderRadius: BorderRadius.circular(10.0)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    "HEIGHT",
                                    style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    '$height',
                                    style: const TextStyle(
                                      fontSize: 40,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      FloatingActionButton(
                                        backgroundColor: !cubit.isMale
                                            ? Colors.pink
                                            : Colors.blue,
                                        onPressed: () {
                                          cubit.minusHeight();
                                        },
                                        heroTag: "MinusAge",
                                        mini: true,
                                        child: const Icon(Icons.remove),
                                      ),
                                      FloatingActionButton(
                                        backgroundColor: !cubit.isMale
                                            ? Colors.pink
                                            : Colors.blue,
                                        onPressed: () {
                                          cubit.plusHeight();
                                        },
                                        heroTag: "PlusAge",
                                        mini: true,
                                        child: const Icon(Icons.add),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                  color: backGroundColor,
                                  borderRadius: BorderRadius.circular(10.0)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    "WEIGHT",
                                    style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    '$weight',
                                    style: const TextStyle(
                                      fontSize: 40,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      FloatingActionButton(
                                        backgroundColor: !cubit.isMale
                                            ? Colors.pink
                                            : Colors.blue,
                                        onPressed: () {
                                          cubit.minusWeight();
                                        },
                                        heroTag: "MinusWeight",
                                        mini: true,
                                        child: const Icon(Icons.remove),
                                      ),
                                      FloatingActionButton(
                                        backgroundColor: !cubit.isMale
                                            ? Colors.pink
                                            : Colors.blue,
                                        onPressed: () {
                                          cubit.plusWeight();
                                        },
                                        heroTag: "PlusWeight",
                                        mini: true,
                                        child: const Icon(Icons.add),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Transform.scale(
                            scale: 1.5,
                            child: Radio(
                              activeColor:
                                  !cubit.isMale ? Colors.pink : Colors.blue,
                              value: 1,
                              groupValue: cubit.isSelected,
                              onChanged: (value) {
                                cubit.changeRadio(value);
                              },
                            ),
                          ),
                          Text(
                            'Smoker',
                            style: TextStyle(fontSize: 20),
                          ),
                          SizedBox(width: 20),
                          Transform.scale(
                            scale: 1.5,
                            child: Radio(
                              activeColor:
                                  !cubit.isMale ? Colors.pink : Colors.blue,
                              value: 2,
                              groupValue: cubit.isSelected,
                              onChanged: (value) {
                                cubit.changeRadio(value);
                              },
                            ),
                          ),
                          Text(
                            'Not Smoker',
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10.0),
                      Container(
                        height: 30,
                        decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'BSA:',
                              style: TextStyle(fontSize: 20),
                            ),
                            SizedBox(width: 15),
                            Text(
                              BSAA.toString(),
                              style: TextStyle(fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),

                      // insert data to local database to show data in records screen
                      Container(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                vertical: 16.0,
                                horizontal: 30.0,
                              ),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0)),
                              backgroundColor:
                                  !cubit.isMale ? Colors.pink : Colors.blue),
                          onPressed: () {
                            if (formkey.currentState!.validate()) {
                              try {
                                cubit.insertToDatabase(
                                  name: nameContoller.text,
                                  age: cubit.age,
                                  weight: weight,
                                  height: height,
                                  BSA: BSAA,
                                  gender: gender.toString(),
                                  smoke: smoke.toString(),
                                );
                              } catch (error) {
                                print(error);
                              }
                            }
                          },
                          child: Text(
                            'Submit',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Lato'),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
