import 'package:flutter/material.dart';

class PointsWidget extends StatelessWidget {
  const PointsWidget({super.key, required this.point1,   this.point2});

  final String point1;
  final String? point2;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
      Row(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Text("•", style: TextStyle(fontSize: 18, height: 1.2)),
    SizedBox(width: 8),
    Expanded(
      child: Text(
        point1,
        style: TextStyle(fontSize: 13),
      ),
    ),
  ],
),

       Row(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Text("•", style: TextStyle(fontSize: 18, height: 1.2)),
    SizedBox(width: 8),
    Expanded(
      child: Text(
        point1,
        style: TextStyle(fontSize: 13),
      ),
    ),
  ],
),
      ],
    );
  }
}
