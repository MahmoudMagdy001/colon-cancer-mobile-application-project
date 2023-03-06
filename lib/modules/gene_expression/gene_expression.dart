// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, sort_child_properties_last, library_private_types_in_public_api

import 'package:ColonCancer/shared/components/divider/divider.dart';
import 'package:ColonCancer/shared/components/text_form_field/text_form_field.dart';
import 'package:ColonCancer/shared/cubit/cubit.dart';
import 'package:flutter/material.dart';

import '../../shared/components/button/button.dart';
import '../../shared/styles/colors.dart';

class MyTabbedPage extends StatefulWidget {
  const MyTabbedPage({Key? key}) : super(key: key);

  @override
  _MyTabbedPageState createState() => _MyTabbedPageState();
}

class _MyTabbedPageState extends State<MyTabbedPage>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  var geneController = TextEditingController();
  var TumorController = TextEditingController();

  String _selectedItem = 'Item 1';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backGroundColor,
        title: TabBar(
          controller: _tabController,
          labelColor: Colors.black,
          tabs: [
            Tab(text: 'Gene Expression'),
            Tab(text: 'Tumor Markers'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Padding(
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
                    CustomButton(
                      label: 'Submit',
                      onPressed: () {},
                    ),
                  ],
                ),
                // here result
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                SizedBox(height: 10),
                CustomDivider(),
                SizedBox(height: 10),
                customTextFormField(
                  type: TextInputType.text,
                  validator: (value) {},
                  controller: TumorController,
                  label: 'First',
                  prefix: Icons.person,
                ),
                SizedBox(height: 10),
                customTextFormField(
                  type: TextInputType.text,
                  validator: (value) {},
                  controller: TumorController,
                  label: 'Secound',
                  prefix: Icons.person,
                ),
                SizedBox(height: 10),
                customTextFormField(
                  type: TextInputType.text,
                  validator: (value) {},
                  controller: TumorController,
                  label: 'Third',
                  prefix: Icons.person,
                ),
                SizedBox(height: 10),
                customTextFormField(
                  type: TextInputType.text,
                  validator: (value) {},
                  controller: TumorController,
                  label: 'Fourth',
                  prefix: Icons.person,
                ),
                SizedBox(height: 20),
                CustomButton(
                  label: 'SHOW RESULT',
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
