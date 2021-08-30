import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:sage/core/constants/colors.dart';
import 'package:sage/core/constants/styles.dart';
import 'package:sage/ui/custom_widgets/custom_navigation_bar.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SageData {
  final double? xAxis;
  final double? sales;
  SageData(this.xAxis, this.sales);
}

class DashboardScreen extends StatelessWidget {
  final List<SageData> chartData = [
    SageData(2, 1),
    SageData(4, 5),
    SageData(6, 2),
    SageData(8, 4),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        centerTitle: true,
        shape: appBarShape,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 10),
                child: Text(
                  "Average SAGE Score",
                  style: fontSize16,
                ),
              ),

              ///
              /// bar graph
              ///
              Container(
                height: 150.h,
                child: SfCartesianChart(series: <ChartSeries>[
                  ColumnSeries<SageData, double>(
                    color: primaryColor,
                    dataSource: chartData,
                    xValueMapper: (SageData sales, _) => sales.xAxis!,
                    yValueMapper: (SageData sales, _) => sales.sales!,
                  )
                ]),
              ),
              Divider(
                thickness: 1,
                color: primaryColor,
              ),

              ///
              /// circular percentage indicator graph
              ///
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: CircularPercentIndicator(
                      radius: 100.0.r,
                      animation: true,
                      animationDuration: 1200,
                      lineWidth: 8.0,
                      percent: 0.24,
                      center: Text(
                        "Self-Awareness\nImprovement\n24.3%",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 10.0.sp,
                        ),
                      ),
                      circularStrokeCap: CircularStrokeCap.butt,
                      backgroundColor: Colors.white,
                      progressColor: primaryColor,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: CircularPercentIndicator(
                      radius: 100.0.r,
                      animation: true,
                      animationDuration: 1200,
                      lineWidth: 8.0,
                      percent: 0.40,
                      center: Text(
                        "Accountability\nImprovement\n40.3%",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 10.0.sp,
                        ),
                      ),
                      circularStrokeCap: CircularStrokeCap.butt,
                      backgroundColor: Colors.white,
                      progressColor: primaryColor,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: CircularPercentIndicator(
                      radius: 100.0.r,
                      animation: true,
                      animationDuration: 1200,
                      lineWidth: 8.0,
                      percent: 0.30,
                      center: Text(
                        "Growth\nImprovement\n30.3%",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 10.0.sp,
                        ),
                      ),
                      circularStrokeCap: CircularStrokeCap.butt,
                      backgroundColor: Colors.white,
                      progressColor: primaryColor,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: CircularPercentIndicator(
                      radius: 100.0.r,
                      animation: true,
                      animationDuration: 1200,
                      lineWidth: 8.0,
                      percent: 0.65,
                      center: Text(
                        "Empathy\nImprovement\n65.0%",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 10.0.sp,
                        ),
                      ),
                      circularStrokeCap: CircularStrokeCap.butt,
                      backgroundColor: Colors.white,
                      progressColor: primaryColor,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                ],
              ),
              Divider(
                thickness: 1,
                color: primaryColor,
              ),

              ///
              /// Area graph
              ///
              Text(
                'Improvement over time',
                style: fontSize16,
              ),
              Container(
                height: 150.h,
                child: SfCartesianChart(series: <ChartSeries>[
                  SplineAreaSeries<SageData, double>(
                    color: primaryColor,
                    dataSource: chartData,
                    xValueMapper: (SageData sales, _) => sales.xAxis!,
                    yValueMapper: (SageData sales, _) => sales.sales!,
                  ),
                ]),
              ),

              ///
              /// graph average
              ///
              Card(
                elevation: 2.0,
                shadowColor: Colors.grey.shade200,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: ListTile(
                    contentPadding: EdgeInsets.symmetric(vertical: 0),
                    title: Text('Daily Average'),
                    trailing: Text('3.43'),
                  ),
                ),
              ),

              Card(
                elevation: 2.0,
                shadowColor: Colors.grey.shade200,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: ListTile(
                    contentPadding: EdgeInsets.symmetric(vertical: 0),
                    title: Text('Total Points Earned'),
                    trailing: Text('2343'),
                  ),
                ),
              ),
              Card(
                elevation: 2.0,
                shadowColor: Colors.grey.shade200,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: ListTile(
                    contentPadding: EdgeInsets.symmetric(vertical: 0),
                    title: Text('Days Streak'),
                    trailing: Text('23'),
                  ),
                ),
              ),

              SizedBox(
                height: 20.h,
              ),
            ],
          ),
        ),
      ),
      // bottomNavigationBar: CustomNavigationBar(
      //   currentIndex: 1,
      // ),
    );
  }
}
