import 'package:flutter/material.dart';

class showRecordScreen extends StatelessWidget {
  const showRecordScreen(Map model, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Text('id'),
          ],
        ),
      ),
    );
  }
}
