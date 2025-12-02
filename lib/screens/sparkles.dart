import 'package:flutter/material.dart';

class Sparkles extends StatelessWidget {
  const Sparkles({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Center(child: Text("Sparkles Page")),
    ));
  }
}