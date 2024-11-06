// lib/details_page.dart
import 'package:flutter/material.dart';
import 'package:nonpms_scanner_project/modules/home/views/barcode_page.dart';
import 'package:nonpms_scanner_project/modules/registration/views/sign_up_page.dart';
import 'package:nonpms_scanner_project/utils/colors.dart';
import 'package:nonpms_scanner_project/widgets/button.dart';
import 'package:nonpms_scanner_project/widgets/common_app_bar.dart';
import 'package:nonpms_scanner_project/widgets/text_widget%20copy.dart';

class DetailsPage extends StatelessWidget {
  final TextEditingController itemTypeController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController consigneeDetailsController =
      TextEditingController();
  final TextEditingController consigneeAddressController =
      TextEditingController();
  final TextEditingController consigneeMobileController =
      TextEditingController();

  DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          getAppBar(context, title: getDetailsAppBarTitle(context), onTap: () {
        Navigator.pop(context);
      }),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: itemTypeController,
              decoration: const InputDecoration(
                  labelText: 'Item Type (e.g., goods, bike)'),
            ),
            TextField(
              controller: descriptionController,
              decoration: const InputDecoration(labelText: 'Description'),
            ),
            TextField(
              controller: consigneeDetailsController,
              decoration: const InputDecoration(labelText: 'consignee Details'),
            ),
            TextField(
              controller: consigneeAddressController,
              decoration: const InputDecoration(labelText: 'Consignee Address'),
            ),
            TextField(
              controller: consigneeMobileController,
              decoration:
                  const InputDecoration(labelText: 'Consignee Mobile Number'),
            ),
            const SizedBox(height: 20),
            AButton(
              label: "Generate Barcode",
              textAlign: TextAlign.center,
              width: MediaQuery.of(context).size.width * 02,
              onTap: () {
                 if (itemTypeController.text.isNotEmpty &&
                    descriptionController.text.isNotEmpty) {
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
            ),
          ],
        ),
      ),
    );
  }
}

Widget getDetailsAppBarTitle(BuildContext context) {
  return const TextWidget(
    label: "Details",
    textColor: AColors.white,
    fontSize: 18,
    fontWeight: FontWeight.w700,
  );
}
