// // ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, sort_child_properties_last, library_private_types_in_public_api
//
// import 'package:flutter/material.dart';
//
// import '../../shared/components/button/button.dart';
// import '../../shared/styles/colors.dart';
//
// class MyTabbedPage extends StatefulWidget {
//   const MyTabbedPage({Key? key}) : super(key: key);
//
//   @override
//   _MyTabbedPageState createState() => _MyTabbedPageState();
// }
//
// class _MyTabbedPageState extends State<MyTabbedPage>
//     with SingleTickerProviderStateMixin {
//   late final TabController _tabController;
//
//   @override
//   void initState() {
//     super.initState();
//     _tabController = TabController(length: 2, vsync: this);
//   }
//
//   @override
//   void dispose() {
//     _tabController.dispose();
//     super.dispose();
//   }
//

import 'package:ColonCancer/shared/components/button/button.dart';
import 'package:ColonCancer/shared/components/divider/divider.dart';
import 'package:ColonCancer/shared/components/sized_box/sized_box.dart';
import 'package:ColonCancer/shared/components/text_form_field/text_form_field.dart';
import 'package:ColonCancer/shared/cubit/test.dart';
import 'package:ColonCancer/shared/styles/colors.dart';
import 'package:flutter/material.dart';

class MyTabbedPage extends StatefulWidget {
  @override
  State<MyTabbedPage> createState() => _MyTabbedPageState();
}

class _MyTabbedPageState extends State<MyTabbedPage> {
  var geneController = TextEditingController();
  var TumorController = TextEditingController();
  var NameController = TextEditingController();
  var OneController = TextEditingController();
  var TwoController = TextEditingController();
  var ThreeController = TextEditingController();
  var FourController = TextEditingController();
  var FiveController = TextEditingController();

  String _selectedName = '';
  List<String> _names = [];

  String _SelectedAge = '';
  List<String> _ages = [];

  String _SelectedGender = '';
  List<String> _Gender = [];

  @override
  void initState() {
    super.initState();
    _loadNames();
    _loadAges();
    _loadGenders();
  }

  void _loadNames() async {
    final dbHelper = DatabaseHelper();
    final names = await dbHelper.getForumNames();
    setState(() {
      _names = names;
      if (_names.isNotEmpty) {
        _selectedName = _names.first;
      }
    });
  }

  void _loadAges() async {
    final dbHelper = DatabaseHelper();
    final ages = await dbHelper.getForumAge();
    setState(() {
      _ages = ages;
      if (_ages.isNotEmpty) {
        _SelectedAge = _ages.first;
      }
    });
  }

  void _loadGenders() async {
    final dbHelper = DatabaseHelper();
    final genders = await dbHelper.getForumGender();
    setState(() {
      _Gender = genders;
      if (_Gender.isNotEmpty) {
        _SelectedGender = _Gender.first;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // number of tabs
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: backGroundColor,
          title: TabBar(
            labelColor: Colors.black87,
            labelStyle: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),
            tabs: [
              Tab(text: 'Gene Expression'),
              Tab(text: 'Tumor Marker'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // content for tab 1
            Center(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Gene Sequence',
                      style: TextStyle(fontSize: 17.0),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      controller: geneController,
                      keyboardType: TextInputType.text,
                      // validator: (value) {},
                      maxLines: 5,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Gene Sequence',
                      ),
                    ),

                    SizedBox(height: 15),
                    Row(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            geneController.text = '';
                          },
                          child: Text(
                            'Reset',
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Lato'),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red[600],
                            padding: EdgeInsets.symmetric(
                                vertical: 16.0, horizontal: 30.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ),
                        SizedBox(width: 12.5),
                        ElevatedButton(
                          onPressed: () {},
                          child: Text(
                            'Submit',
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Lato'),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: allColor,
                            padding: EdgeInsets.symmetric(
                                vertical: 16.0, horizontal: 30.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ),
                      ],
                    ),
                    // here result
                  ],
                ),
              ),
            ),
            // content for tab 2
            SingleChildScrollView(
              child: SafeArea(
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        width: double.infinity,
                        child: DropdownButton<String>(
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.black87,
                            fontWeight: FontWeight.bold,
                          ),
                          isExpanded: true,
                          value: _selectedName,
                          onChanged: (value) {
                            setState(() {
                              _selectedName = value!;
                            });
                          },
                          items: _names
                              .map((name) => DropdownMenuItem(
                                    value: name,
                                    child: Text(name),
                                  ))
                              .toList(),
                          menuMaxHeight: 100.0,
                          elevation: 24,
                          // icon: Icon(Icons.person),
                          borderRadius: BorderRadius.circular(10),
                          hint: Text('Patient Name'),
                        ),
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
                      50.ph,
                      CustomButton(
                        label: 'SHOW RESULT',
                        onPressed: () {
                          // final dbHelper = DatabaseHelper();
                          // final db = await dbHelper.database;
                          //
                          // await db.insert('Tumor', {
                          //   'one': OneController.text,
                          //   'two': TwoController.text,
                          // });

                          // await db.insert('Tumor', {
                          //   'id': id,
                          //   'one': onetext,
                          // 'two': TwoController.text,
                          // 'three': ThreeController,
                          // 'four': FourController,
                          // 'five': FiveController,
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
