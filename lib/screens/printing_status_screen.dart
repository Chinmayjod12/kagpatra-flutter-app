import 'dart:async';
import 'package:flutter/material.dart';

class PrintingStatusScreen extends StatefulWidget {
  @override
  State<PrintingStatusScreen> createState() => _PrintingStatusScreenState();
}

class _PrintingStatusScreenState extends State<PrintingStatusScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 5), () {
      if (mounted) {
        Navigator.pushReplacementNamed(context, '/print-confirmation');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
        title: Text('Printing in Progress'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.radio_button_checked, color: Color(0xFF4F6AF6)),
                Container(width: 40, height: 2, color: Color(0xFFDFE3F6)),
                Icon(Icons.print, color: Color(0xFFDFE3F6)),
                Container(width: 40, height: 2, color: Color(0xFFDFE3F6)),
                Icon(Icons.check_circle, color: Color(0xFFDFE3F6)),
              ],
            ),
            SizedBox(height: 32),
            Text('Your document is being prepared...',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18)),
            SizedBox(height: 12),
            Text('Please wait while we queue your document for printing.',
                style: TextStyle(color: Colors.grey[700], fontSize: 15)),
            SizedBox(height: 32),
            CircularProgressIndicator(color: Color(0xFF4F6AF6)),
            Spacer(),
            TextButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/print-confirmation');
              },
              child: Text('Report an issue',
                  style: TextStyle(color: Color(0xFF4F6AF6))),
            ),
            SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
