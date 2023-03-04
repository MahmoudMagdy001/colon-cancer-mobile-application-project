// ignore_for_file: camel_case_types, use_key_in_widget_constructors, must_be_immutable, non_constant_identifier_names

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
  var BSAContoller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = AppCubit.get(context);
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
                    const SizedBox(
                      height: 15.0,
                    ),
                    //AGE
                    customTextFormField(
                      type: TextInputType.number,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Age must not be empty';
                        }
                        return null;
                      },
                      controller: ageContoller,
                      label: 'PATIENT AGE',
                      prefix: Icons.numbers,
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    // //height
                    // customTextFormField(
                    //   type: TextInputType.number,
                    //   validator: (value) {
                    //     if (value!.isEmpty) {
                    //       return 'Height must not be empty';
                    //     }
                    //     return null;
                    //   },
                    //   controller: heightContoller,
                    //   label: 'HEIGHT',
                    //   prefix: Icons.height,
                    // ),
                    // const SizedBox(
                    //   height: 15,
                    // ),
                    // //WEIGHT
                    // customTextFormField(
                    //   type: TextInputType.number,
                    //   validator: (value) {
                    //     if (value!.isEmpty) {
                    //       return 'Weight must not be empty';
                    //     }
                    //     return null;
                    //   },
                    //   controller: weightContoller,
                    //   label: 'WEIGHT',
                    //   prefix: Icons.monitor_weight_sharp,
                    // ),
                    // const SizedBox(
                    //   height: 15,
                    // ),

                    Container(
                      padding: const EdgeInsets.only(left: 15, bottom: 10),
                      width: double.infinity,
                      child: DropdownButton<String>(
                        itemHeight: 60,
                        dropdownColor: Colors.white,
                        icon: const Icon(Icons.arrow_drop_down),
                        iconSize: 30,
                        style:
                            const TextStyle(color: Colors.black, fontSize: 18),
                        underline: Container(
                          height: 0,
                          color: Colors.transparent,
                        ),
                        elevation: 0,
                        isExpanded: true,
                        value: cubit.selectedItem,
                        onChanged: (String? newValue) {
                          cubit.changeGender(newValue);
                        },
                        items: <String>[
                          'Male',
                          'Female',
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                    Row(
                      children: [
                        Transform.scale(
                          scale: 1.5,
                          child: Checkbox(
                            value: cubit.isCheckedSmooking,
                            onChanged: (bool? newValue) {
                              cubit.changeCheckBoxSmooking(newValue);
                            },
                            activeColor: allColor,
                            checkColor: Colors.white,
                          ),
                        ),
                        CustomText(
                          text: 'Smoking',
                          fontSize: 25.0,
                          color: Colors.grey[800],
                        ),
                      ],
                    ),

                    const SizedBox(height: 175.0),

                    // insert data to local database to show data in records screen
                    CustomButton(
                      label: 'Submit',
                      color: allColor,
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
