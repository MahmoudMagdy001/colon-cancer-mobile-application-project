// ignore_for_file: camel_case_types, use_key_in_widget_constructors, must_be_immutable, non_constant_identifier_names

import 'dart:math';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../layout/home_layout.dart';
import '../../shared/components/button/button.dart';
import '../../shared/components/navigator_push_replacment/navigator_replacment.dart';
import '../../shared/components/text/text.dart';
import '../../shared/components/text_form_field/text_form_field.dart';
import '../../shared/cubit/cubit.dart';
import '../../shared/cubit/states.dart';
import '../../shared/styles/colors.dart';

class forumScreen extends StatelessWidget {
  var nameContoller = TextEditingController();
  var ageContoller = TextEditingController();
  var heightContoller = TextEditingController();
  var weightContoller = TextEditingController();

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
                      SizedBox(height: 20),
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
                                      size: 85.0,
                                    ),
                                    SizedBox(
                                      height: 10,
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
                                      ? Colors.blue
                                      : backGroundColor,
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Icon(
                                      Icons.female,
                                      size: 85.0,
                                    ),
                                    SizedBox(
                                      height: 10,
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
                                // const SizedBox(
                                //   width: 5,
                                // ),
                                // const Text(
                                //   "CM",
                                //   style: TextStyle(
                                //     fontSize: 20,
                                //     fontWeight: FontWeight.bold,
                                //   ),
                                // ),
                              ],
                            ),
                            Slider(
                                value: cubit.age,
                                min: 10,
                                max: 90,
                                onChanged: (Value) {
                                  cubit.changeAge(Value);
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
                                        onPressed: () {
                                          cubit.minusHeight();
                                        },
                                        heroTag: "MinusAge",
                                        mini: true,
                                        child: const Icon(Icons.remove),
                                      ),
                                      FloatingActionButton(
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
                                        onPressed: () {
                                          cubit.minusWeight();
                                        },
                                        heroTag: "MinusWeight",
                                        mini: true,
                                        child: const Icon(Icons.remove),
                                      ),
                                      FloatingActionButton(
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
                      SizedBox(height: 30),

                      // Container(
                      //   padding: const EdgeInsets.only(left: 15, bottom: 10),
                      //   width: double.infinity,
                      //   child: DropdownButton<String>(
                      //     itemHeight: 60,
                      //     dropdownColor: Colors.white,
                      //     icon: const Icon(Icons.arrow_drop_down),
                      //     iconSize: 30,
                      //     style: const TextStyle(
                      //         color: Colors.black, fontSize: 18),
                      //     underline: Container(
                      //       height: 0,
                      //       color: Colors.transparent,
                      //     ),
                      //     elevation: 0,
                      //     isExpanded: true,
                      //     value: cubit.selectedItem,
                      //     onChanged: (String? newValue) {
                      //       cubit.changeGender(newValue);
                      //     },
                      //     items: <String>[
                      //       'Male',
                      //       'Female',
                      //     ].map<DropdownMenuItem<String>>((String value) {
                      //       return DropdownMenuItem<String>(
                      //         value: value,
                      //         child: Text(value),
                      //       );
                      //     }).toList(),
                      //   ),
                      // ),

                      // Row(
                      //   children: [

                      //     Transform.scale(
                      //       scale: 1.5,
                      //       child: Checkbox(
                      //         value: cubit.isCheckedSmooking,
                      //         onChanged: (bool? newValue) {
                      //           cubit.changeCheckBoxSmooking(newValue);
                      //         },
                      //         activeColor: allColor,
                      //         checkColor: Colors.white,
                      //       ),
                      //     ),
                      //     CustomText(
                      //       text: 'Smoking',
                      //       fontSize: 25.0,
                      //       color: Colors.grey[800],
                      //     ),
                      //   ],
                      // ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Transform.scale(
                            scale: 1.5,
                            child: Radio(
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
                      Row(
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
                      SizedBox(height: 10),

                      // insert data to local database to show data in records screen
                      CustomButton(
                        label: 'Submit',
                        color: allColor,
                        onPressed: () {
                          cubit.insertToDatabase(
                            name: nameContoller.text,
                            age: cubit.age,
                            weight: weight,
                            height: height,
                            BSA: BSAA,
                          );
                        },
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
