// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class chartScreen extends StatelessWidget {
  List<_SalesData> data = [
    _SalesData('Jan', 164),
    _SalesData('Feb', 98),
    _SalesData('Mar', 50),
    _SalesData('Apr', 100),
    _SalesData('May', 300)
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //Initialize the chart widget
        SfCartesianChart(
          primaryXAxis: CategoryAxis(),
          // Chart title
          title: ChartTitle(text: 'Tumor Marker Chart'),

          // Enable tooltip
          tooltipBehavior: TooltipBehavior(enable: true),
          series: <ChartSeries<_SalesData, String>>[
            LineSeries<_SalesData, String>(
              dataSource: data,
              xValueMapper: (_SalesData sales, _) => sales.year,
              yValueMapper: (_SalesData sales, _) => sales.sales,
              // Enable data label
              dataLabelSettings: DataLabelSettings(isVisible: true),
            ),
            LineSeries<_SalesData, String>(
              dataSource: data,
              xValueMapper: (_SalesData sales, _) => sales.year,
              yValueMapper: (_SalesData sales, _) => sales.sales,
              // Enable data label
              dataLabelSettings: DataLabelSettings(isVisible: true),
            ),
            LineSeries<_SalesData, String>(
              dataSource: data,
              xValueMapper: (_SalesData sales, _) => sales.year,
              yValueMapper: (_SalesData sales, _) => sales.sales,
              // Enable data label
              dataLabelSettings: DataLabelSettings(isVisible: true),
            ),
            LineSeries<_SalesData, String>(
              dataSource: data,
              xValueMapper: (_SalesData sales, _) => sales.year,
              yValueMapper: (_SalesData sales, _) => sales.sales,
              // Enable data label
              dataLabelSettings: DataLabelSettings(isVisible: true),
            ),
          ],
        ),
      ],
    );
  }
}

class _SalesData {
  _SalesData(this.year, this.sales);

  final String year;
  final double sales;
}
