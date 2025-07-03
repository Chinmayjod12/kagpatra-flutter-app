import 'package:flutter/material.dart';

class PaymentScreen extends StatefulWidget {
  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  int selectedMethod = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
        title: Text('Payment'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16),
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
                  Text('Print Summary',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.grey[700])),
                  SizedBox(height: 8),
                  Text('Document: Resume.pdf', style: TextStyle(fontSize: 15)),
                  Text('Pages: 2', style: TextStyle(fontSize: 15)),
                  SizedBox(height: 12),
                  Text('Total Amount',
                      style: TextStyle(color: Colors.grey[700])),
                  Text('₹ 16.00',
                      style: TextStyle(
                          fontSize: 28,
                          color: Color(0xFF2346E6),
                          fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            SizedBox(height: 28),
            Text('Choose Payment Method',
                style: TextStyle(fontWeight: FontWeight.w600)),
            SizedBox(height: 16),
            _paymentOption(0, 'UPI', 'Linked to GPay',
                Icons.account_balance_wallet_outlined),
            SizedBox(height: 12),
            _paymentOption(1, 'Digital Wallet', 'Paytm, PhonePe, MobiKwik',
                Icons.account_balance_wallet),
            SizedBox(height: 12),
            _paymentOption(2, 'Credit / Debit Card', '**** 4567 (Visa)',
                Icons.credit_card),
            Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/printing-status');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF2346E6),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 16),
                ),
                child: Text('Pay Now', style: TextStyle(fontSize: 16)),
              ),
            ),
            SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _paymentOption(
      int value, String title, String subtitle, IconData icon) {
    return InkWell(
      onTap: () => setState(() => selectedMethod = value),
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color:
                selectedMethod == value ? Color(0xFF2346E6) : Color(0xFFE8EDFF),
            width: selectedMethod == value ? 2 : 1,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            Icon(icon, color: Color(0xFF2346E6)),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 16)),
                  SizedBox(height: 4),
                  Text(subtitle,
                      style: TextStyle(color: Colors.grey[700], fontSize: 13)),
                ],
              ),
            ),
            Radio<int>(
              value: value,
              groupValue: selectedMethod,
              onChanged: (val) => setState(() => selectedMethod = val!),
              activeColor: Color(0xFF2346E6),
            ),
          ],
        ),
      ),
    );
  }
}
