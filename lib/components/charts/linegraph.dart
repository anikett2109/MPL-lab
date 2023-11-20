// import 'package:fl_chart/fl_chart.dart';
// import 'package:flutter/material.dart';
// import 'package:portal_app/model/chart_data.dart';

// class LineChart extends StatelessWidget {
//   final List<PricePoint> points;
//   const LineChart(LineChartData lineChartData, {super.key, required this.points});

//   @override
//   Widget build(BuildContext context) {
//     return LineChart(LineChartData(lineBarsData: [
//       LineChartBarData(
//         spots: points.map((points) => FlSpot(points.x, points.y)).toList(),
//         isCurved: false,
//         dotData: FlDotData(show: true)
//       )
//     ]), points: [],);
//   }
// }