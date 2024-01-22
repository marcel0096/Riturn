import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'home_route.dart';
import 'return_route.dart';
import 'ride_route.dart';
import 'faq_route.dart';
import 'qr_code_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => QRCodeProvider(),
      child: MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context) => const HomeRoute(),
          '/return': (context) => const ReturnRoute(),
          '/ride': (context) => const RideRoute(),
          '/faq': (context) => const FAQRoute(),
        },
      ),
    ),
  );
}

/*
TODOS:
  -  Remove API keys before pushing to GitHub

  -  Include ID in QR code info
  
  -  User name next to drawer
  -  Make iPhone camera open when clicking on specific button -> last priority
  -  Make scrollable if too many parcels -> least priority

  -  Make app executable -> try on real iPhones
*/