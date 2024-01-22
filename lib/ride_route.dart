import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'profile_dialog.dart';
import 'qr_code_provider.dart';

class RideRoute extends StatefulWidget {
  const RideRoute({super.key});

  @override
  State<RideRoute> createState() => _RideRouteState();
}

class _RideRouteState extends State<RideRoute> {
  late GoogleMapController mapController;

  // coordinates of Munich
  final LatLng _center = const LatLng(48.1367765, 11.5769875);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    // Provider for QR code list
    QRCodeProvider qrCodeProvider =
        Provider.of<QRCodeProvider>(context, listen: false);

    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.green[700],
      ),
      home: Scaffold(
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
        body: GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 11.0,
          ),
        ),
      ),
    );
  }
}
