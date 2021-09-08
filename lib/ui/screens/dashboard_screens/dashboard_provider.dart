import 'package:flutter/material.dart';
import 'package:sage/core/models/graph.dart';
import 'package:sage/core/view_models/base_view_model.dart';

class DashboardProvider extends BaseViewModal{



  final List<Graph> scoreList =[
    Graph(
      xAxis: 1,
      yAxis: 4,
    ),
    Graph(
      xAxis: 3,
      yAxis: 3,
    ),
    Graph(
      xAxis: 5,
      yAxis: 6,
    ),
    Graph(
      xAxis: 7,
      yAxis: 2,
    )
  ];


}