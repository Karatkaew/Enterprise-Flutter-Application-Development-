import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class DashboardChart extends StatelessWidget {

  final Map<String, double> data;

  const DashboardChart({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {

    final sections = data.entries.map((entry) {

      return PieChartSectionData(
        value: entry.value,
        title: entry.key,
        radius: 60,
      );

    }).toList();

    return SizedBox(
      height: 250,
      child: PieChart(
        PieChartData(
          sections: sections,
        ),
      ),
    );
  }
}