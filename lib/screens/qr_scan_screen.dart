import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:og/screens/upload_screen.dart'; // Import the UploadScreen

class QrScanScreen extends StatefulWidget {
  @override
  State<QrScanScreen> createState() => _QrScanScreenState();
}

class _QrScanScreenState extends State<QrScanScreen> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  bool scanned = false;

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  void _onQRViewCreated(QRViewController ctrl) {
    controller = ctrl;
    controller!.scannedDataStream.listen((scanData) {
      if (!scanned) {
        setState(() => scanned = true);
        controller?.pauseCamera();
        // Pass the scanned QR code to the upload screen
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => UploadScreen(kioskUrl: scanData.code),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
        title: Text('Scan Kiosk QR Code'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 220,
              height: 220,
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xFF4F6AF6), width: 3),
                borderRadius: BorderRadius.circular(20),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: QRView(
                  key: qrKey,
                  onQRViewCreated: _onQRViewCreated,
                ),
              ),
            ),
            SizedBox(height: 40),
            Text(
              'Align the QR code within the frame to connect to the kiosk',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 32),
            TextButton(
              onPressed: () {},
              child: Text('Need Help?',
                  style: TextStyle(color: Color(0xFF4F6AF6))),
            ),
          ],
        ),
      ),
    );
  }
}
