import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:uuid/uuid.dart';
import 'package:provider/provider.dart';
import 'profile_dialog.dart';
import 'qr_code_data.dart';
import 'qr_code_provider.dart';

class ReturnRoute extends StatefulWidget {
  const ReturnRoute({Key? key}) : super(key: key);

  @override
  State<ReturnRoute> createState() => _ReturnRouteState();
}

class _ReturnRouteState extends State<ReturnRoute> {
  // Remember state of the tapped parcel size
  String selectedSize = '';
  bool isButtonActive = false;

  @override
  Widget build(BuildContext context) {
    // Provider for QR code list
    final QRCodeProvider qrCodeProvider =
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
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 30, bottom: 10),
                child: Text('Select your parcel size:'),
              ),
              // Four tiles to select the parcels
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      buildParcelContainer('Size-S'),
                      buildParcelContainer('Size-M'),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      buildParcelContainer('Size-L'),
                      buildParcelContainer('Size-XL'),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Text('Not sure about the size? Lets scan it!'),
                  ),
                  // Button to scan with camera
                  ElevatedButton(
                    onPressed: () {
                      // Handle camera click
                      // To be done
                    },
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(280, 20),
                      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                    ),
                    child: const Text(
                      'Open camera',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),
                  ),
                  // Button to generate QR code

                  Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: ElevatedButton(
                      onPressed: () {
                        // Handle generating QR code with selectedSize
                        if (selectedSize.isNotEmpty) {
                          // create a unique ID for each QR parcel
                          const uuid = Uuid();
                          String id = uuid.v4();

                          // actual generation of the QR code
                          QrImageView qrCode = QrImageView(
                            data: selectedSize,
                            version: QrVersions.auto,
                            size: 150.0,
                          );

                          // generate QR code data that is displayed in the profile
                          QRCodeData qrCodeData = QRCodeData(
                              id: id, size: selectedSize, qrCode: qrCode);

                          // call add QR code to list on the provider
                          qrCodeProvider.addQRCode(qrCodeData);

                          // Show notification and actually add it to profile
                          generateQRCodeDialog();
                        }
                        // Button is not clickable if no size is selected
                        else {
                          Null;
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        fixedSize: const Size(280, 20),
                        backgroundColor: selectedSize.isNotEmpty
                            ? const Color.fromARGB(
                                255, 56, 125, 64) // If size is selected
                            : const Color.fromARGB(
                                255, 170, 170, 170), // If no size is selected,
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'Generate QR Code',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                            ),
                          ),
                          Icon(
                            Icons.qr_code_2_rounded,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                width: 280,
                child: Text(
                  'Note: This code will be scanned in the bus to confirm your information',
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Select parcel widget
  Widget buildParcelContainer(String size) {
    return GestureDetector(
      onTap: () {
        // Handle container click
        setState(
          () {
            if (selectedSize == size) {
              selectedSize = '';
              isButtonActive = false;
            } else {
              selectedSize = size;
              isButtonActive = true;
            }
          },
        );
      },
      child: Stack(
        children: [
          Container(
            width: 160,
            height: 200,
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              // Use screenshots for quicker development
              child: Image.asset(
                'assets/$size.png',
                fit: BoxFit.scaleDown,
              ),
            ),
          ),
          if (selectedSize == size)
            Container(
              width: 160,
              height: 200,
              margin: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: const Color.fromARGB(20, 56, 125, 64),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
        ],
      ),
    );
  }

  void generateQRCodeDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('QR Code Generated'),
          content: const Text(
              'The QR Code has been added to your profile. Click on your profile icon to see it.'),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  selectedSize = '';
                  isButtonActive = false;
                });
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
