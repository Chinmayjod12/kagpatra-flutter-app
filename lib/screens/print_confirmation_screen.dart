import 'package:flutter/material.dart';

class PrintConfirmationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
        title: Text('Print Confirmation'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 32),
            Icon(Icons.check_circle, color: Colors.green, size: 56),
            SizedBox(height: 16),
            Text('Your Document is Ready!',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            SizedBox(height: 24),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Color(0xFFE8EDFF)),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Print Details',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.grey[700])),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.insert_drive_file, color: Color(0xFF4F6AF6)),
                      SizedBox(width: 8),
                      Text('File Name: Resume.pdf',
                          style: TextStyle(fontSize: 15)),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.access_time, color: Color(0xFF4F6AF6)),
                      SizedBox(width: 8),
                      Text('Print time: 2 mins ago',
                          style: TextStyle(fontSize: 15)),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.currency_rupee, color: Color(0xFF4F6AF6)),
                      SizedBox(width: 8),
                      Text('Total Paid: ₹16.00',
                          style: TextStyle(fontSize: 15)),
                    ],
                  ),
                ],
              ),
            ),
            Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.popUntil(context, (route) => route.isFirst);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF2346E6),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 16),
                ),
                child: Text('Print Another Document',
                    style: TextStyle(fontSize: 16)),
              ),
            ),
            SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
