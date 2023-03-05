// ignore_for_file: prefer_const_constructors, avoid_print, unnecessary_this, prefer_typing_uninitialized_variables

import 'dart:io';

import 'package:ColonCancer/shared/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sqflite/sqflite.dart';

import '../../modules/endoscopy/endoscopy_screen.dart';
import '../../modules/gene_expression/gene_expression.dart';
import '../../modules/histopathology/histopathology_screen.dart';
import '../../modules/news/news_screen.dart';
import '../../modules/records/records_screen.dart';
import '../network/remote/dio_Helper.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  bool isCheckedSmooking = false;
  bool isCheckedGeneticDisease = false;

  var selectedItem;

  bool isMale = true;
  double age = 20;
  int weight = 60;
  int height = 160;

  int isSelected = 1;

  List<Widget> screens = [
    newsScreen(),
    endoscopyScreen(),
    histopathologyScreen(),
    recordsScreen(),
    MyTabbedPage(),
  ];

  List<String> titles = [
    'News',
    'Endoscopy',
    'Histopathology',
    'Records',
    'More',
  ];
  List<BottomNavigationBarItem> bottomItems = [
    BottomNavigationBarItem(
      icon: Icon(Icons.newspaper),
      label: 'News',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.document_scanner_outlined),
      label: 'Endoscopy ',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.table_view),
      label: 'Histopathology',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.archive_outlined),
      label: 'Records',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.document_scanner_outlined),
      label: 'More',
    ),
  ];
  void changeBottomNavBar(int index) {
    currentIndex = index;
    if (index == 0) getcancer();
    emit(AppBottomNavState());
  }

  // to save data in list and show it in list view seperated
  List<dynamic> cancer = [];
  // get data from API dio helper
  void getcancer() {
    emit(AppGetCancerLoadingState());
    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country': 'eg',
        'category': 'business',
        'apikey': 'ffbb1355bffd49be8fcd529b75c93062',
      },
    ).then((value) {
      cancer = value.data['articles'];
      print(cancer[0]['title']);
      emit(AppGetCancerSuccessState());

      //  print(value.data.toString());
    }).catchError((error) {
      print(error.toString());
      emit(AppGetCancerErrorState(error.toString()));
    });
  }

  // change passowrd eye icon to show password

  void changeCheckBoxSmooking(newValue) {
    isCheckedSmooking = newValue;
    emit(AppChangeCheckBoxSmooking());
  }

  void changeCheckBoxGeneticDisease(newValue) {
    isCheckedGeneticDisease = newValue;
    emit(AppChangeCheckBoxGeneticDisease());
  }

  void changeGender() {
    isMale = !isMale;
    emit(AppChangeGender());
  }

  void changeAge(Value) {
    age = Value;
    emit(AppChangeHeightState());
  }

  void plusHeight() {
    height++;
    emit(AppPlusAgeState());
  }

  void minusHeight() {
    height--;
    emit(AppMinusAgeState());
  }

  void plusWeight() {
    weight++;
    emit(AppPlusWeightState());
  }

  void minusWeight() {
    weight--;
    emit(AppMinusWeightState());
  }

  void changeRadio(value) {
    isSelected = value;
    emit(AppChangeRadio());
  }

  // to pick image form gallary or camera
  File? imageHistopathology;
  Future pickImageHistopathology(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;

      final imageTemporary = File(image.path);
      this.imageHistopathology = imageTemporary;
      emit(AppPickImage());
    } on PlatformException catch (e) {
      print('failed to pick image: $e');
    }
  }

  File? imageEndoscopy;

  Future pickImageEndoscopy(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;

      final imageTemporary = File(image.path);
      this.imageEndoscopy = imageTemporary;
      emit(AppPickImage());
    } on PlatformException catch (e) {
      print('failed to pick image: $e');
    }
  }

  late Database database;
  List<Map> newForum = [];

  void createDatabase() {
    openDatabase(
      'Cancer.db',
      version: 1,
      onCreate: (database, version) {
        print('database created ');
        database
            .execute(
                'CREATE TABLE forum (id INTEGER PRIMARY KEY, name TEXT,age TEXT, weight TEXT, height TEXT, BSA TEXT, gender TEXT, smoke TEXT)')
            .then((value) {
          print('table created ');
        }).catchError((error) {
          print('Error when creating table ${error.toString()}');
        });
      },
      onOpen: (database) {
        getDataFromDatabase(database);
        print('database opened');
      },
    ).then((value) {
      database = value;
      emit(AppCreateDataBaseState());
    });
  }

  void getDataFromDatabase(database) {
    newForum = [];

    emit(AppGetDataBaseLoadingState());
    database.rawQuery('SELECT * FROM forum').then((value) {
      value.forEach((element) {
        newForum.add(element);
      });
      emit(AppGetDataBaseState());
    });
  }

  insertToDatabase({
    required String name,
    required double age,
    required int weight,
    required int height,
    required double BSA,
    required String gender,
    required String smoke,
  }) async {
    await database.transaction((txn) async {
      txn
          .rawInsert(
        'INSERT INTO forum(name, age, weight, height, BSA, gender, smoke) VALUES ("$name","$age","$weight","$height","$BSA","$gender","$smoke")',
      )
          .then((value) {
        print('$value inserted successfully');
        emit(AppInsertDataBaseState());

        getDataFromDatabase(database);
      }).catchError((error) {
        print('error when inserting new record ${error.toString()}');
      });
      return null;
    });
  }

  void deleteData({
    required int id,
  }) async {
    database.rawDelete('DELETE FROM forum WHERE id = ?', [id]).then((value) {
      getDataFromDatabase(database);
      emit(AppDeleteDataBaseState());
    });
  }

  // void updateData({
  //   required String status,
  //   required int id,
  // }) async {
  //   database.rawUpdate(
  //       'UPDATE forum SET status = ? WHERE id = ?', [status, id]).then((value) {
  //     getDataFromDatabase(database);
  //     emit(AppUpdateDataBaseState());
  //   });
  // }
}
