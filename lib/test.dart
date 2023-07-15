import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Ldid extends StatefulWidget {
  const Ldid({super.key});

  @override
  State<Ldid> createState() => _LdidState();
}

class _LdidState extends State<Ldid> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.5,
            child: SfCartesianChart(
              primaryXAxis: CategoryAxis(),
              series: <ColumnSeries<SalesData, String>>[
                ColumnSeries<SalesData, String>(
                    dataSource: getChartData(),
                    xValueMapper: (SalesData sales, _) => sales.day,
                    yValueMapper: (SalesData sales, _) => sales.sales,
                    color: Color.fromRGBO(209, 29, 34, 1),
                    width: 0.4,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                    ),
                    spacing: 0.001),
              ],
            ),
          ),
        ],
      )),
    );
  }
}

class SalesData {
  SalesData(this.day, this.sales);

  final String day;
  final double sales;
}

List<SalesData> getChartData() {
  final List<SalesData> chartData = [
    SalesData('السبت', 35),
    SalesData('الأحد', 28),
    SalesData('الأثنين', 34),
    SalesData('الثلاثاء', 32),
    SalesData('الأربعاء', 40),
    SalesData('الخميس', 40),
    SalesData('الجمعة', 40)
  ];
  return chartData;
}
