import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'custom_icon_search.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.title, required this.icon});
  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
         Text(title, style: TextStyle(fontSize: 24)),
        const Spacer(),
        CustomIconSearch(icon: icon,),
      ],
    );
  }
}
