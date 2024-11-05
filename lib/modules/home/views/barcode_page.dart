import 'package:flutter/material.dart';
import 'package:barcode_widget/barcode_widget.dart';
import 'package:nonpms_scanner_project/utils/colors.dart';
import 'package:nonpms_scanner_project/widgets/common_app_bar.dart';
import 'dart:math';

import 'package:nonpms_scanner_project/widgets/text_widget%20copy.dart';

class BarcodePage extends StatelessWidget {
  final String itemType;
  final String description;

  BarcodePage({required this.itemType, required this.description});

 
  String _generateRandomBarcodeData() {
    const chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    Random rnd = Random();
    return String.fromCharCodes(Iterable.generate(
      8, 
      (_) => chars.codeUnitAt(rnd.nextInt(chars.length)),
    ));
  }

  @override
  Widget build(BuildContext context) {
    String barcodeData = (itemType.isEmpty && description.isEmpty)
        ? _generateRandomBarcodeData()
        : '$itemType - $description';

    return Scaffold(
       appBar: getAppBar(context, title: getBarcodeAppBarTitle(context), onTap: () {
        Navigator.pop(context);
      }), 
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            BarcodeWidget(
                data: barcodeData,
                barcode: Barcode.dataMatrix(),
                // barcode: Barcode.code128(), // Choose barcode type (e.g., Code 128)
                width: 150,
                height: 150),
            SizedBox(height: 20),
            Text('Item: $itemType'),
            Text('Description: $description'),
            if (itemType.isEmpty && description.isEmpty)
              Text('Generated Random Barcode: $barcodeData'),
          ],
        ),
      ),
    );
  }
}
Widget getBarcodeAppBarTitle(BuildContext context) {
  
    return const TextWidget(
      label: "Barcode Page",
      textColor: AColors.white,
      fontSize: 18,
      fontWeight: FontWeight.w700,
    );
  }
