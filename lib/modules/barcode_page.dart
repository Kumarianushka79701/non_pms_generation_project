import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class BarcodePage extends StatelessWidget {
  final String itemType;
  final String description;

  BarcodePage({required this.itemType, required this.description});

  @override
  Widget build(BuildContext context) {
    String barcodeData = '$itemType - $description';

    return Scaffold(
      appBar: AppBar(title: Text('Barcode')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
             QrImageView(
          data: 'https://www.example.com',
          version: QrVersions.auto,
          size: 200.0,
        ),
            SizedBox(height: 20),
            Text('Item: $itemType'),
            Text('Description: $description'),
          ],
        ),
      ),
    );
  }
}
