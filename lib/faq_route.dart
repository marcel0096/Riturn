import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'profile_dialog.dart';
import 'qr_code_provider.dart';

class FAQRoute extends StatelessWidget {
  const FAQRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Provider of the QR codes
    QRCodeProvider qrCodeProvider =
        Provider.of<QRCodeProvider>(context, listen: false);
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 245, 245, 245),
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 78, 109, 87),
          title: const Text('RITURN'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          actions: [
            GestureDetector(
              onTap: () {
                // Show profile dialog
                ProfileDialog.show(context, qrCodeProvider);
              },
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(
                  Icons.menu_rounded,
                  size: 30.0,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
        body: const Center(
          child: Text(
            'FAQ is coming soon!',
            style: TextStyle(fontSize: 30),
          ),
        ),
      ),
    );
  }
}
