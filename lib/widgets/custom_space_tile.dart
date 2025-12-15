import 'package:flutter/material.dart';

Widget customSpaceTile({required String leading, required String trailing}) {
  return SizedBox(height: 35, child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(leading),
      Text(trailing),
    ],
  ),);
}