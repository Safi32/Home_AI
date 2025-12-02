import 'package:flutter/material.dart';

class LivePage extends StatelessWidget {
  const LivePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Center(child: Text("Live Page")),
    ));
  }
}