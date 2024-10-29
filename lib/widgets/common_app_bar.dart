
import 'package:flutter/material.dart';

import '../utils/colors.dart';

PreferredSize getAppBar(BuildContext context,
    {
    List<Widget>? actions,
    Widget? title,
    Widget? leading,
    GestureTapCallback? onTap,
    bool? centerTitle,
    Color backgroundColor = AColors.brandeisblue}) {
  return PreferredSize(
      preferredSize: const Size.fromHeight(70),
      child:  AppBar(
          backgroundColor: backgroundColor,
          elevation: 0,
          actions: actions,
          centerTitle: centerTitle ?? false,
          leading: leading ??
              InkWell(
                  onTap: onTap ??
                      () {                        Navigator.pop(context);
},
                      
                  child: Container(
                      margin: const EdgeInsets.only(left: 20),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: AColors.white)),
                      child: const Icon(Icons.keyboard_backspace,
                          size: 20, color: AColors.white))),
          title: title,
        ),
     );
}
