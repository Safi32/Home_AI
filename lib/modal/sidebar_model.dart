import 'dart:ui';

class SidebarItem {
  final String name;
  final String imageUrl;
  final VoidCallback onPressed;

  SidebarItem({required this.imageUrl,  required this.name, required  this.onPressed});
}
