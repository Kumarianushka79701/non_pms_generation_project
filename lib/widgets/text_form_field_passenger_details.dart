import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/colors.dart';

class STextFieldPassengerDetails extends StatelessWidget {
  final String label;
  final String hint;
  final TextInputType keyboardType;
  final List<TextInputFormatter> inputFormatters;
  final FormFieldValidator<String> validator;
  final GlobalKey<FormState> formKey;
  final TextEditingController controller;
  final int maxLength;
  final int maxLines;
  final double fontSize;
  final double borderRadius;
  final Color textColor;
  final Color hintColor;
  final Color labelColor;
  final double borderWidth;
  final Color fillColor;
  final Color borderColor;
  final Color iconColor;
  final TextAlign textAlign;
  final FontWeight fontWeight;
  final FontStyle fontStyle;
  final GestureTapCallback? onIconPressed;
  final onTap;
  final bool obscureText;
  final bool enabled;
  final FloatingLabelBehavior floatingLabelBehavior;
  final bool isSendMessage;
  final bool isNationalityField;
  final bool isReadOnly;
  final bool isDate;
  final bool isTime;
  final onEditingComplete;
  final onTapOutSide;
  final onChanged;
  final FocusNode? focusNode;

  const STextFieldPassengerDetails(
      {super.key,
      this.label = '',
      this.hint = '',
      this.borderWidth = 1,
      required this.keyboardType,
      this.inputFormatters = const <TextInputFormatter>[],
      required this.validator,
      required this.formKey,
      required this.controller,
      this.maxLength = 250,
      this.maxLines = 1,
      this.fontSize = 14,
      this.borderRadius = 8,
      this.textColor = AColors.black,
      this.hintColor = AColors.gray,
      this.labelColor = AColors.gray,
      this.fillColor = AColors.white,
      this.borderColor = AColors.paleCyan,
      this.iconColor = AColors.brandeisblue,
      this.textAlign = TextAlign.start,
      this.fontWeight = FontWeight.normal,
      this.fontStyle = FontStyle.normal,
      this.obscureText = false,
      this.enabled = true,
      this.isSendMessage = false,
      this.isDate = false,
      this.isTime = false,
      this.isReadOnly = false,
      this.floatingLabelBehavior = FloatingLabelBehavior.always,
      this.onIconPressed,
      this.onTap,
      this.isNationalityField = false,
      this.onChanged,
      this.focusNode,
      this.onEditingComplete,
      this.onTapOutSide});

  @override
  Widget build(BuildContext context) {
    InputBorder inputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadius),
      borderSide: BorderSide(
        color: borderColor,
        width: 1.0,
      ),
    );
    return TextFormField(
        onTap: onTap,
        readOnly: isReadOnly,
        enabled: enabled,
        textAlignVertical: TextAlignVertical.center,
        controller: controller,
        keyboardType: keyboardType,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
            alignLabelWithHint: true,
            filled: true,
            fillColor: fillColor,
            counter: const Offstage(),
            suffixIcon: isNationalityField
                ? IconButton(
                    padding: const EdgeInsets.only(
                      top: 3,
                      bottom: 8,
                    ),
                    icon: Icon(
                      Icons.keyboard_arrow_down_sharp,
                      color: iconColor,
                      size: 30,
                    ),
                    onPressed: onIconPressed)
                : const SizedBox(height: 0, width: 0),
            isDense: true,
            //  contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            contentPadding: EdgeInsets.only(left: 10.0, right: 2.0),
            floatingLabelBehavior: floatingLabelBehavior,
            /*labelText: isRequiredField ? '$label*' : label,*/
            floatingLabelStyle: GoogleFonts.montserrat(
                fontWeight: FontWeight.normal,
                color: AColors.brandeisblue,
                fontSize: fontSize),
            hintText: hint,
            labelStyle: GoogleFonts.montserrat(
                fontWeight: FontWeight.normal,
                color: hintColor,
                fontSize: fontSize),
            hintStyle: GoogleFonts.montserrat(
                fontWeight: FontWeight.normal,
                color: hintColor,
                fontSize: fontSize),
            errorStyle: GoogleFonts.montserrat(
                fontWeight: FontWeight.normal,
                color: AColors.redPigment,
                fontSize: 0),
            errorMaxLines: 2,
            border: inputBorder,
            disabledBorder: inputBorder,
            enabledBorder: inputBorder,
            errorBorder: inputBorder,
            focusedErrorBorder: inputBorder,
            focusedBorder: inputBorder),
        style: GoogleFonts.montserrat(
            fontWeight: FontWeight.w400, color: textColor, fontSize: fontSize),
        autocorrect: false,
        textInputAction: TextInputAction.done,
        obscureText: obscureText,
        maxLines: maxLines,
        maxLength: maxLength,
        validator: validator,
        onChanged: onChanged,
        focusNode: focusNode,
        onEditingComplete: onEditingComplete,
        onTapOutside: onTapOutSide,
        onSaved: (value) {
          formKey.currentState?.save();
          formKey.currentState?.validate();
        });
  }
}
