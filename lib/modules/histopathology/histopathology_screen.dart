// ignore_for_file: use_key_in_widget_constructors, camel_case_types, unused_local_variable, must_be_immutable, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:image_picker/image_picker.dart';

import '../../shared/components/button/button.dart';
import '../../shared/components/text/text.dart';
import '../../shared/cubit/cubit.dart';
import '../../shared/cubit/states.dart';
import '../../shared/styles/colors.dart';


class histopathologyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomText(
                  text: 'Upload Histopathology images here',
                  fontSize: 30.0,
                  color: Colors.grey[600],
                ),
                cubit.imageHistopathology != null
                    ? Image.file(
                        cubit.imageHistopathology!,
                        width: double.infinity,
                        height: 350,
                      )
                    : Icon(
                        Bootstrap.cloud_upload,
                        size: 250,
                        color: allColor,
                      ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomButton(
                      label: 'Upload Image',
                      onPressed: () {
                        cubit.pickImageHistopathology(ImageSource.camera);
                      },
                    ),
                    const SizedBox(width: 20.0),
                    CustomButton(
                      label: 'Submit',
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
