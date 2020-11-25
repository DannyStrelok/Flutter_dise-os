import 'package:flutter/material.dart';

import 'package:practica_design/src/widgets/line_chart/line_chart_page.dart';
import 'package:syncfusion_flutter_charts/charts.dart';




class ChartsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView(
          children: <Widget>[
            LineChartPage(),
            SizedBox(height: 250.0,),
            Container(
              color: Colors.white,
              height: 250,
              width: double.infinity,
              child: Text('TEST'),
            ),


          ],
        ),
      ),
    );
  }
}

class SalesData {
  SalesData(this.year, this.sales);
  final String year;
  final double sales;
}

