import 'package:flutter/material.dart';

class UserWatching extends StatelessWidget {
  const UserWatching({super.key, required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(2),
      decoration: BoxDecoration(color: Colors.white, shape: BoxShape.circle),
      child: CircleAvatar(
        radius: 12,
        backgroundImage: AssetImage(imageUrl),
      ),
    );
  }
}
