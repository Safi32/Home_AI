import 'package:flutter/material.dart';
import 'package:home_ai/widgets/top_row.dart';

class EditScreen extends StatelessWidget {
  const EditScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        child: Column(
          children: [
            TopRow(title: "Person Details", icon: Icons.arrow_back,),
          ],
        ),
      )
    ),);
  }
}
