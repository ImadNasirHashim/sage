import 'package:flutter/material.dart';
import 'package:sage/core/constants/colors.dart';
import 'package:sage/core/constants/styles.dart';
import 'package:sage/ui/custom_widgets/custom_navigation_bar.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';
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
                padding: EdgeInsets.symmetric(horizontal: 18.0,vertical: 10),
                child: Text("Average SAGE Score",style: fontSize16,),
              ),
              ///
              /// bar graph
              ///
              Container(
                height: 150.h,
                child: SfCartesianChart(
                    series: <ChartSeries>[
                      ColumnSeries<SageData, double>(
                        color: primaryColor,
                          dataSource: chartData,
                          xValueMapper: (SageData sales, _) => sales.xAxis!,
                          yValueMapper: (SageData sales, _) => sales.sales!,
                      )
                    ]
                ),
              ),
              Divider(thickness: 1,color: primaryColor,),
              ///
              /// Radial graph
              ///
              Container(
                height: 150.h,
                child: Row(
                  children: [
                    SfCircularChart(
                      series: <CircularSeries>[
                        DoughnutSeries<SageData, double>(
                            dataSource: chartData,
                            xValueMapper: (SageData data, _) => data.xAxis!,
                            yValueMapper: (SageData data, _) => data.sales!,
                            radius: '80%',
                        ),
                      ],
                    ),

                  ],
                ),
              ),
              Divider(thickness: 1,color: primaryColor,),
              ///
              /// Area graph
              ///
              Text('Improvement over time',style: fontSize16,),
              Container(
                height: 150.h,
                child: SfCartesianChart(
                    series: <ChartSeries>[
                    SplineAreaSeries<SageData, double>(
                      color: primaryColor,
                      dataSource: chartData,
                      xValueMapper: (SageData sales, _) => sales.xAxis!,
                      yValueMapper: (SageData sales, _) => sales.sales!,
                    ),
                    ]
                ),
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

              SizedBox(height: 20.h,),

            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomNavigationBar(currentIndex: 1,),
    );
  }
}

