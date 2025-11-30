import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  final String text;

  const CustomDivider({super.key, this.text = "Or"});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: Divider(
            color: Colors.black,
            thickness: 1,
            
            endIndent: 10,
          ),
        ),
        
        Text(
          text,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
        
        const Expanded(
          child: Divider(
            color: Colors.black,
            thickness: 1,
              indent: 10,
            endIndent: 10,
          ),
        ),
      ],
    );
  }
}
