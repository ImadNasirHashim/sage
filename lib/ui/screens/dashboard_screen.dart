import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:sage/core/constants/colors.dart';
import 'package:sage/core/constants/styles.dart';
import 'package:sage/core/models/graph.dart';
import 'package:sage/ui/screens/dashboard_screens/dashboard_provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class DashboardScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context)=>DashboardProvider(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Dashboard'),
          centerTitle: true,
          shape: appBarShape,
        ),
        body: Consumer<DashboardProvider>(
          builder: (context, model, child){
            return Padding(
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
                      height: 170.h,
                      child: SfCartesianChart(
                          plotAreaBorderWidth: 0.1,
                          series: <ChartSeries>[
                            ColumnSeries<Graph, dynamic>(
                              color: primaryColor,
                              dataSource: model.scoreList,
                              xValueMapper: (Graph index, _) => index.xAxis,
                              yValueMapper: (Graph index, _) => index.yAxis,
                              width: 0.2,
                            )
                          ]
                      ),
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
                      ],
                    ),
                    SizedBox(height: 20,),
                    Row(
                      children: [
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
                      height: 170.h,
                      child: SfCartesianChart(series: <ChartSeries>[
                        SplineAreaSeries<Graph, dynamic>(
                          color: primaryColor.withOpacity(0.5),
                          dataSource: model.scoreList,
                          xValueMapper: (Graph sales, _) => sales.xAxis!,
                          yValueMapper: (Graph sales, _) => sales.yAxis!,
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
            );
          },
        ),
        // bottomNavigationBar: CustomNavigationBar(
        //   currentIndex: 1,
        // ),
      ),
    );
  }
}
