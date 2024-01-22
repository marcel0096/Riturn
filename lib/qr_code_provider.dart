import 'package:flutter/material.dart';
import 'qr_code_data.dart';

class QRCodeProvider extends ChangeNotifier {
  List<QRCodeData> generatedQRCodes = [];

  void addQRCode(QRCodeData qrCode) {
    generatedQRCodes.add(qrCode);
    notifyListeners();
  }

  void removeQRCode(QRCodeData qrCode) {
    generatedQRCodes.remove(qrCode);
    notifyListeners();
  }
}
