import 'package:flutter/material.dart';
import 'package:nonpms_scanner_project/utils/colors.dart';
import 'package:nonpms_scanner_project/widgets/text_widget%20copy.dart';

import 'text_widget.dart';

class WrapCapsule extends StatelessWidget {
  final String text;
  final GestureTapCallback onTap;

  const WrapCapsule({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          decoration: BoxDecoration(
              color: AColors.white, borderRadius: BorderRadius.circular(8)),
          child: TextWidget(label: text)),
    );
  }
}
