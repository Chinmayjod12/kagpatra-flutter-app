import 'package:flutter/material.dart';
import 'package:og/screens/dashboard_screen.dart';
import 'package:og/screens/estimate_screen.dart';
import 'package:og/screens/profile_screen.dart';
import 'package:og/screens/nearby_kiosk_screen.dart';
import 'package:og/screens/qr_scan_screen.dart';
import 'package:og/screens/upload_screen.dart';
import 'package:og/screens/print_preference_screen.dart';
import 'package:og/screens/payment_screen.dart';
import 'package:og/screens/printing_status_screen.dart';
import 'package:og/screens/print_confirmation_screen.dart';

class AppRoutes {
  static final Map<String, WidgetBuilder> routes = {
    '/': (context) => DashboardScreen(),
    '/estimate': (context) => EstimateScreen(),
    '/profile': (context) => ProfileScreen(),
    '/kiosks': (context) => NearbyKioskScreen(),
    '/qrscan': (context) => QrScanScreen(),
    '/upload': (context) => UploadScreen(),
    '/print-preference': (context) => PrintPreferenceScreen(),
    '/payment': (context) => PaymentScreen(),
    '/printing-status': (context) => PrintingStatusScreen(),
    '/print-confirmation': (context) => PrintConfirmationScreen(),
  };
}
