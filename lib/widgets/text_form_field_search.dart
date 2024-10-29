import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gradient_borders/gradient_borders.dart';

import '../utils/colors.dart';

class STextFieldSearch extends StatelessWidget {
  final String label;
  final String hint;
  final TextInputType keyboardType;
  final bool isRequiredField;
  final EdgeInsetsDirectional padding;
  final EdgeInsets contentPadding;
  final bool isPhoneNumber;
  final FormFieldValidator<String> validator;
  final GlobalKey<FormState> formKey;
  final TextEditingController controller;
  final int maxLength;
  final int maxLines;
  final double fontSize;
  final double borderRadius;
  final Color textColor;
  final TextAlign textAlign;
  final FontWeight fontWeight;
  final FontStyle fontStyle;
  final GestureTapCallback? onIconPressed;
  final ValueChanged<String>? onChanged;
  final bool obscureText;
  final bool readOnly;

  const STextFieldSearch(
      {super.key,
      this.label = '',
      this.hint = '',
      required this.keyboardType,
      this.isRequiredField = false,
      this.padding = const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
      this.contentPadding = const EdgeInsets.all(15),
      this.isPhoneNumber = false,
      required this.validator,
      required this.formKey,
      required this.controller,
      this.maxLength = 250,
      this.maxLines = 1,
      this.fontSize = 16,
      this.borderRadius = 50,
      this.textColor = AColors.mettalicSilver,
      this.textAlign = TextAlign.start,
      this.fontWeight = FontWeight.normal,
      this.fontStyle = FontStyle.normal,
      this.obscureText = false,
      this.readOnly = false,
      this.onIconPressed,
      this.onChanged});

  @override
  Widget build(BuildContext context) {
    final border = GradientOutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(borderRadius),
      ),
      gradient: const LinearGradient(
        colors: [AColors.vividSkyBlue, AColors.mountainMeadowGreen],
      ),
      width: 1,
    );
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: TextFormField(
        readOnly: readOnly,
        textAlignVertical: TextAlignVertical.center,
        controller: controller,
        keyboardType: keyboardType,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
            prefixIcon: InkWell(
              onTap: onIconPressed,
              child: const Icon(
                Icons.search_outlined,
                size: 25,
                color: AColors.davysGrey,
              ),
            ),
            fillColor: AColors.white,
            filled: true,
            counter: const Offstage(),
            isDense: true,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            hintText: hint,
            hintStyle: GoogleFonts.montserrat(
                fontWeight: FontWeight.normal,
                color: AColors.mettalicSilver,
                fontSize: fontSize),
            errorStyle: GoogleFonts.montserrat(
                fontWeight: FontWeight.normal, color: AColors.redPigment),
            errorMaxLines: 2,
            border: border,
            disabledBorder: border,
            enabledBorder: border,
            errorBorder: border,
            focusedErrorBorder: border,
            focusedBorder: border),
        style: GoogleFonts.montserrat(
            fontWeight: FontWeight.w500,
            color: AColors.catalinaBlue,
            fontSize: fontSize),
        autocorrect: false,
        textInputAction: TextInputAction.done,
        obscureText: obscureText,
        maxLines: maxLines,
        maxLength: maxLength,
        validator: validator,
        onChanged: onChanged,
        onSaved: (value) {
          formKey.currentState?.save();
          formKey.currentState?.validate();
        },
      ),
    );
  }
}
