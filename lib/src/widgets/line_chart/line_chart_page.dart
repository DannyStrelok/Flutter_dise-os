import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'samples/line_chart_sample1.dart';
import 'samples/line_chart_sample2.dart';

class LineChartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff262545),
      child: ListView(
        children: <Widget>[
          const Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(
                left: 36.0,
                top: 24,
              ),
              child: Text(
                'Line Chart',
                style: TextStyle(
                    color: Color(
                      0xff6f6f97,
                    ),
                    fontSize: 32,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 28,
              right: 28,
            ),
            child: LineChartSample1(),
          ),
          const SizedBox(
            height: 22,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 28.0, right: 28),
            child: LineChartSample2(),
          ),
          SizedBox(
            height: 22,
          ),
          Padding(
            padding: EdgeInsets.only(left: 28, right: 28),
            child: SfCartesianChart(
                primaryXAxis: CategoryAxis(),
                series: <LineSeries<SalesData, String>>[
                  LineSeries<SalesData, String>(
                      // Bind data source
                      dataSource: <SalesData>[
                        SalesData('Jan', 35),
                        SalesData('Feb', 28),
                        SalesData('Mar', 34),
                        SalesData('Apr', 32),
                        SalesData('May', 40)
                      ],
                      xValueMapper: (SalesData sales, _) => sales.year,
                      yValueMapper: (SalesData sales, _) => sales.sales)
                ]),
          ),
          SizedBox(
            height: 22,
          ),
          Padding(
            padding: EdgeInsets.only(left: 28, right: 28),
            child: _getDefaultWhiskerChart(),
          ),
          SizedBox(
            height: 22,
          ),
          Padding(padding: EdgeInsets.symmetric(horizontal: 28),
            child: _getShapesScatterChart(),
          )
        ],
      ),
    );
  }
}

/// Get the cartesian chart with histogram series
SfCartesianChart _getDefaultWhiskerChart() {
  return SfCartesianChart(
    plotAreaBorderWidth: 0,
    title: ChartTitle(text: 'Employees age group in various departments'),
    primaryXAxis: CategoryAxis(
        majorGridLines: MajorGridLines(width: 0),
        labelIntersectAction: AxisLabelIntersectAction.rotate45),
    primaryYAxis: NumericAxis(
        name: 'Age',
        minimum: 10,
        maximum: 60,
        interval: 10,
        axisLine: AxisLine(width: 0),
        majorTickLines: MajorTickLines(size: 0)),
    series: _getBoxWhiskerSeries(),
    tooltipBehavior: TooltipBehavior(enable: true),
  );
}

///Get the histogram series
List<BoxAndWhiskerSeries<SalesData2, dynamic>> _getBoxWhiskerSeries() {
  final List<SalesData2> chartData = <SalesData2>[
    SalesData2(
        'Development',
        [
          22,
          22,
          23,
          25,
          25,
          25,
          26,
          27,
          27,
          28,
          28,
          29,
          30,
          32,
          34,
          32,
          34,
          36,
          35,
          38
        ],
        null,
        Color.fromRGBO(75, 135, 185, 0.9)),
    // SalesData('Testing',  [22, 33, 23, 25, 26, 28, 29, 30, 34, 33, 32, 31, 50],null,
    // Color.fromRGBO(75, 135, 185, 0.9) ),
    SalesData2('HR', [22, 24, 25, 30, 32, 34, 36, 38, 39, 41, 35, 36, 40, 56],
        null, Color.fromRGBO(75, 135, 185, 0.9)),
    SalesData2('Finance  ', [26, 27, 28, 30, 32, 34, 35, 37, 35, 37, 45], null,
        Color.fromRGBO(75, 135, 185, 0.9)),
    SalesData2('Inventory', [21, 23, 24, 25, 26, 27, 28, 30, 34, 36, 38], null,
        Color.fromRGBO(75, 135, 185, 0.9)),
    SalesData2('Sales', [27, 26, 28, 29, 29, 29, 32, 35, 32, 38, 53], null,
        Color.fromRGBO(75, 135, 185, 0.9)),
    SalesData2('R&D', [26, 27, 29, 32, 34, 35, 36, 37, 38, 39, 41, 43, 58],
        null, Color.fromRGBO(75, 135, 185, 0.9)),
    SalesData2('Graphics', [26, 28, 29, 30, 32, 33, 35, 36, 52], null,
        Color.fromRGBO(75, 135, 185, 0.9)),
  ];

  return <BoxAndWhiskerSeries<SalesData2, dynamic>>[
    BoxAndWhiskerSeries<SalesData2, dynamic>(
      name: 'Department',
      dataSource: chartData,
      showMean: true,
      boxPlotMode: BoxPlotMode.normal,
      xValueMapper: (SalesData2 sales, _) => sales.x,
      yValueMapper: (SalesData2 sales, _) => sales.y,
      pointColorMapper: (SalesData2 sales, _) => sales.color,
    )
  ];
}

SfCartesianChart _getShapesScatterChart() {
  return SfCartesianChart(
    plotAreaBorderWidth: 0,
    title: ChartTitle(text:  'Inflation Analysis'),
    primaryXAxis: NumericAxis(
      minimum: 1945,
      maximum: 2005,
      title: AxisTitle(text: 'Year'),
      labelIntersectAction: AxisLabelIntersectAction.multipleRows,
      majorGridLines: MajorGridLines(width: 0),
    ),
    legend: Legend(isVisible: true),
    primaryYAxis: NumericAxis(
        title: AxisTitle(text: 'Inflation Rate(%)'),
        labelFormat: '{value}%',
        axisLine: AxisLine(width: 0),
        majorTickLines: MajorTickLines(size: 0)),
    tooltipBehavior:
    TooltipBehavior(enable: true, header: '', canShowMarker: false),
    series: _getScatterShapesSeries(),
  );
}

/// Returns the list of chart series with various marker shapes which need to
/// render on the scatter chart.
List<ScatterSeries<ChartSampleData, num>> _getScatterShapesSeries() {
  final List<ChartSampleData> chartData = <ChartSampleData>[
    ChartSampleData(
        x: 1950, y: 0.8, secondSeriesYValue: 1.4, thirdSeriesYValue: 2),
    ChartSampleData(
        x: 1955, y: 1.2, secondSeriesYValue: 1.7, thirdSeriesYValue: 2.4),
    ChartSampleData(
        x: 1960, y: 0.9, secondSeriesYValue: 1.5, thirdSeriesYValue: 2.2),
    ChartSampleData(
        x: 1965, y: 1, secondSeriesYValue: 1.6, thirdSeriesYValue: 2.5),
    ChartSampleData(
        x: 1970, y: 0.8, secondSeriesYValue: 1.4, thirdSeriesYValue: 2.2),
    ChartSampleData(
        x: 1975, y: 1, secondSeriesYValue: 1.8, thirdSeriesYValue: 2.4),
    ChartSampleData(
        x: 1980, y: 1, secondSeriesYValue: 1.7, thirdSeriesYValue: 2),
    ChartSampleData(
        x: 1985, y: 1.2, secondSeriesYValue: 1.9, thirdSeriesYValue: 2.3),
    ChartSampleData(
        x: 1990, y: 1.1, secondSeriesYValue: 1.4, thirdSeriesYValue: 2),
    ChartSampleData(
        x: 1995, y: 1.2, secondSeriesYValue: 1.8, thirdSeriesYValue: 2.2),
    ChartSampleData(
        x: 2000, y: 1.4, secondSeriesYValue: 2, thirdSeriesYValue: 2.4),
  ];
  return <ScatterSeries<ChartSampleData, num>>[
    ScatterSeries<ChartSampleData, num>(
        dataSource: chartData,
        xValueMapper: (ChartSampleData sales, _) => sales.x,
        yValueMapper: (ChartSampleData sales, _) => sales.y,
        markerSettings: MarkerSettings(
            width: 15, height: 15, shape: DataMarkerType.diamond),
        name: 'India'),
    ScatterSeries<ChartSampleData, num>(
        dataSource: chartData,
        xValueMapper: (ChartSampleData sales, _) => sales.x,
        yValueMapper: (ChartSampleData sales, _) => sales.secondSeriesYValue,
        markerSettings: MarkerSettings(
            width: 15, height: 15, shape: DataMarkerType.triangle),
        name: 'China'),
    ScatterSeries<ChartSampleData, num>(
        dataSource: chartData,
        xValueMapper: (ChartSampleData sales, _) => sales.x,
        yValueMapper: (ChartSampleData sales, _) => sales.thirdSeriesYValue,
        markerSettings: MarkerSettings(
            width: 15, height: 15, shape: DataMarkerType.pentagon),
        name: 'Japan')
  ];
}

class SalesData {
  SalesData(this.year, this.sales);
  final String year;
  final double sales;
}

class SalesData2 {
  SalesData2(this.x, this.y, [this.date, this.color]);
  final dynamic x;
  final dynamic y;
  final Color color;
  final DateTime date;
}

///Chart sample data
class ChartSampleData {
  /// Holds the datapoint values like x, y, etc.,
  ChartSampleData(
      {this.x,
        this.y,
        this.xValue,
        this.yValue,
        this.secondSeriesYValue,
        this.thirdSeriesYValue,
        this.pointColor,
        this.size,
        this.text,
        this.open,
        this.close,
        this.low,
        this.high,
        this.volume});

  /// Holds x value of the datapoint
  final dynamic x;

  /// Holds y value of the datapoint
  final num y;

  /// Holds x value of the datapoint
  final dynamic xValue;

  /// Holds y value of the datapoint
  final num yValue;

  /// Holds y value of the datapoint(for 2nd series)
  final num secondSeriesYValue;

  /// Holds y value of the datapoint(for 3nd series)
  final num thirdSeriesYValue;

  /// Holds point color of the datapoint
  final Color pointColor;

  /// Holds size of the datapoint
  final num size;

  /// Holds datalabel/text value mapper of the datapoint
  final String text;

  /// Holds open value of the datapoint
  final num open;

  /// Holds close value of the datapoint
  final num close;

  /// Holds low value of the datapoint
  final num low;

  /// Holds high value of the datapoint
  final num high;

  /// Holds open value of the datapoint
  final num volume;
}