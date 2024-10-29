import 'package:flutter/material.dart';
import 'package:nonpms_scanner_project/utils/colors.dart';


class AppDivider extends StatelessWidget {
  final double width;
  final double height;
  final Color color;

  const AppDivider({
    super.key,
    required this.width,
    this.height = 1,
    this.color = AColors.metaSilver,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      color: color,
    );
  }
}
