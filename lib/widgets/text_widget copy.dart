import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/colors.dart';

class TextWidget extends StatelessWidget {
  final String label;
  final Color textColor;
  final double fontSize;
  final FontWeight fontWeight;
  final TextAlign textAlign;
  final bool isPoppins;
  final bool isNunitoSans;
  final bool isRoboto;
  final bool isMontserrat;
  final bool isUnderLine;
  final int maxlines;
  

  const TextWidget(
      {super.key,
        this.label = '',
        this.textColor = AColors.black,
        this.fontSize = 16,
        this.fontWeight = FontWeight.w500,
        this.textAlign = TextAlign.start,
        this.isPoppins = false,
        this.isNunitoSans = false,
        this.isUnderLine = false,
        this.isRoboto = false,
        this.isMontserrat = false,
        this.maxlines = 20})
     ;

  @override
  Widget build(BuildContext context) {
    return Text(label,
        overflow: TextOverflow.ellipsis,
        maxLines: maxlines,
        textAlign: textAlign,
        style: isPoppins
            ? GoogleFonts.poppins(
            decoration: isUnderLine
                ? TextDecoration.underline
                : TextDecoration.none,
            color: textColor,
            fontSize: fontSize,
            fontWeight: fontWeight)
            : isRoboto
            ? GoogleFonts.montserrat(
            decoration: isUnderLine
                ? TextDecoration.underline
                : TextDecoration.none,
            color: textColor,
            fontSize: fontSize,
            fontWeight: fontWeight)
            : isNunitoSans
            ? GoogleFonts.nunitoSans(
            decoration: isUnderLine
                ? TextDecoration.underline
                : TextDecoration.none,
            color: textColor,
            fontSize: fontSize,
            fontWeight: fontWeight)
            : isMontserrat
            ? GoogleFonts.montserrat(
            decoration: isUnderLine
                ? TextDecoration.underline
                : TextDecoration.none,
            color: textColor,
            fontSize: fontSize,
            fontWeight: fontWeight)
            : GoogleFonts.montserrat(
            decoration: isUnderLine
                ? TextDecoration.underline
                : TextDecoration.none,
            color: textColor,
            fontSize: fontSize,
            fontWeight: fontWeight));
  }
}



