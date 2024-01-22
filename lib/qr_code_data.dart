import 'package:qr_flutter/qr_flutter.dart';

class QRCodeData {
  final String id;
  final String size;
  final QrImageView qrCode;

  QRCodeData({required this.id, required this.size, required this.qrCode});
}
