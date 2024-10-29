// lib/details_page.dart
import 'package:flutter/material.dart';
import 'package:nonpms_scanner_project/modules/home/views/barcode_page.dart';

class DetailsPage extends StatelessWidget {
  final TextEditingController itemTypeController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Enter Details')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: itemTypeController,
              decoration: const InputDecoration(labelText: 'Item Type (e.g., goods, bike)'),
            ),
            TextField(
              controller: descriptionController,
              decoration: const InputDecoration(labelText: 'Description'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (itemTypeController.text.isNotEmpty && descriptionController.text.isNotEmpty) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BarcodePage(
                        itemType: itemTypeController.text,
                        description: descriptionController.text,
                      ),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Please fill all fields')),
                  );
                }
              },
              child: const Text('Generate Barcode'),
            ),
          ],
        ),
      ),
    );
  }
}
