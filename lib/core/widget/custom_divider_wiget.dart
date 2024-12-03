import 'package:flutter/material.dart';

class CustomDividerWidget extends StatelessWidget {
  const CustomDividerWidget({super.key, required this.dividerColor});
  final Color dividerColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Divider(
        color: dividerColor,
        height: 5,
        thickness: 2,
        indent: 2,
        endIndent: 2,
      ),
    );
  }
}
