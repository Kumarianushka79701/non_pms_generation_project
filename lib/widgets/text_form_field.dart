import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nonpms_scanner_project/utils/colors.dart';
import 'package:nonpms_scanner_project/widgets/text_widget%20copy.dart';

class STextField extends StatelessWidget {
  final String label;
  final String hint;
  final TextInputType keyboardType;
  final List<TextInputFormatter> inputFormatters;
  final bool isUserIdField;
  final bool isRequiredField;
  final bool isPhoneNumber;
  final GlobalKey<FormState> formKey;
  final TextEditingController controller;
  final int maxLength;
  final int maxLines;
  final double fontSize;
  final double borderRadius;
  final Color textColor;
  final Color hintColor;
  final Color labelColor;
  final Color fillColor;
  final Color borderColor;
  final Color iconColor;
  final TextAlign textAlign;
  final FontWeight fontWeight;
  final FontStyle fontStyle;
  final GestureTapCallback? onIconPressed;
  final GestureTapCallback? onTap;
  final bool obscureText;
  final FloatingLabelBehavior floatingLabelBehavior;
  final bool isSendMessage;
  final bool isReadOnly;
  final bool isDate;
  final bool isTime;
  final bool? isValidUserID;
  final bool? validUserIDVerified;
  final onChanged;
  final onSubmitted;
  final FocusNode? focusNode;
  final double? height;

  const STextField(
      {super.key,
      this.label = '',
      this.hint = '',
      required this.keyboardType,
      this.inputFormatters = const <TextInputFormatter>[],
      this.isUserIdField = false,
      this.isRequiredField = false,
      this.isPhoneNumber = false,
      required this.formKey,
      required this.controller,
      this.maxLength = 250,
      this.maxLines = 1,
      this.fontSize = 14,
      this.borderRadius = 50,
      this.textColor = AColors.black,
      this.hintColor = AColors.gray,
      this.labelColor = AColors.gray,
      this.fillColor = AColors.white,
      this.borderColor = AColors.paleCyan,
      this.iconColor = AColors.gray,
      this.textAlign = TextAlign.start,
      this.fontWeight = FontWeight.normal,
      this.fontStyle = FontStyle.normal,
      this.obscureText = false,
      this.isSendMessage = false,
      this.isDate = false,
      this.isTime = false,
      this.isReadOnly = false,
      this.floatingLabelBehavior = FloatingLabelBehavior.always,
      this.onIconPressed,
      this.onTap,
      this.onChanged,
      this.isValidUserID,
      this.validUserIDVerified,
      this.onSubmitted,
      this.focusNode,
      this.height = 45});

  @override
  Widget build(BuildContext context) {
    InputBorder inputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(50.0),
      borderSide: BorderSide(
        color: borderColor,
        width: 1.0,
      ),
    );
    final size = MediaQuery.of(context).size;
    return TextFormField(
      onTap: onTap,
      readOnly: isReadOnly,
      textAlignVertical: TextAlignVertical.center,
      controller: controller,
      keyboardType: keyboardType,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        alignLabelWithHint: true,
        border: inputBorder,
        filled: true,
        fillColor: fillColor,
        counter: const Offstage(),
        suffixIcon: (!(isValidUserID ?? false) || (validUserIDVerified == null))
            ? const SizedBox(
                height: 0,
                width: 0,
              )
            : (validUserIDVerified ?? false)
                ? SizedBox(
                    width: size.width * 0.30,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: TextWidget(
                          label:"available",
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                          textColor: AColors.limeGreen,
                        ),
                      ),
                    ),
                  )
                : SizedBox(
                    width: size.width * 0.30,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: TextWidget(
                          label:"notAvailable",
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                          textColor: AColors.redPigment,
                        ),
                      ),
                    ),
                  ),
        prefixIcon: isUserIdField
            ? IconButton(
                icon: Icon(
                  Icons.person,
                  color: iconColor,
                ),
                onPressed: onIconPressed)
            : IconButton(
                icon: Icon(
                  Icons.email,
                  color: iconColor,
                ),
                onPressed: onIconPressed,
              ),
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(horizontal: 1, vertical: 5),
        floatingLabelBehavior: floatingLabelBehavior,
        /*labelText: isRequiredField ? '$label*' : label,*/
        floatingLabelStyle: GoogleFonts.nunitoSans(
            fontWeight: FontWeight.normal,
            color: AColors.brandeisblue,
            fontSize: fontSize),
        hintText: isRequiredField ? '$hint*' : hint,
        labelStyle: GoogleFonts.nunitoSans(
            fontWeight: FontWeight.normal,
            color: hintColor,
            fontSize: fontSize),
        hintStyle: GoogleFonts.nunitoSans(
            fontWeight: FontWeight.normal,
            color: hintColor,
            fontSize: fontSize),
        errorStyle: GoogleFonts.nunitoSans(
          fontWeight: FontWeight.normal,
          color: AColors.redPigment,
          fontSize: 0,
        ),
        errorMaxLines: 2,
        enabledBorder: inputBorder,
        errorBorder: InputBorder.none,
        focusedErrorBorder: InputBorder.none,
        focusedBorder: inputBorder,
      ),
      style: GoogleFonts.nunitoSans(
          fontWeight: FontWeight.w400, color: textColor, fontSize: fontSize),
      autocorrect: false,
      textInputAction: TextInputAction.done,
      obscureText: obscureText,
      maxLines: maxLines,
      maxLength: maxLength,
      // validator: validator,
      onChanged: onChanged,
      //onFieldSubmitted: onSubmitted,
      focusNode: focusNode,
      onSaved: (value) {
        formKey.currentState?.save();
        formKey.currentState?.validate();
      },
    );
  }
}
