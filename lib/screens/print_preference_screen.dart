import 'package:flutter/material.dart';

class PrintPreferenceScreen extends StatefulWidget {
  @override
  State<PrintPreferenceScreen> createState() => _PrintPreferenceScreenState();
}

class _PrintPreferenceScreenState extends State<PrintPreferenceScreen> {
  String colorMode = 'B/W';
  String direction = 'Portrait';
  int copies = 1;
  bool doubleSided = false;
  double estimatedCost = 0.75;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
        title: Text('Set Print Preferences'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16),
            Align(
              alignment: Alignment.center,
              child: CircleAvatar(
                radius: 18,
                backgroundColor: Color(0xFF4F6AF6),
                child: Text('P',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold)),
              ),
            ),
            SizedBox(height: 16),
            Text('Color Mode', style: TextStyle(fontWeight: FontWeight.w500)),
            SizedBox(height: 8),
            Row(
              children: [
                _toggleButton('B/W', colorMode == 'B/W',
                    () => setState(() => colorMode = 'B/W')),
                SizedBox(width: 12),
                _toggleButton('Color', colorMode == 'Color',
                    () => setState(() => colorMode = 'Color')),
              ],
            ),
            SizedBox(height: 20),
            Text('Direction', style: TextStyle(fontWeight: FontWeight.w500)),
            SizedBox(height: 8),
            Row(
              children: [
                _toggleButton('Portrait', direction == 'Portrait',
                    () => setState(() => direction = 'Portrait')),
                SizedBox(width: 12),
                _toggleButton('Landscape', direction == 'Landscape',
                    () => setState(() => direction = 'Landscape')),
              ],
            ),
            SizedBox(height: 20),
            Text('Copies', style: TextStyle(fontWeight: FontWeight.w500)),
            SizedBox(height: 8),
            Row(
              children: [
                _stepperButton(Icons.remove, () {
                  if (copies > 1) setState(() => copies--);
                }),
                SizedBox(width: 16),
                Text('$copies',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                SizedBox(width: 16),
                _stepperButton(Icons.add, () {
                  setState(() => copies++);
                }),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Double-sided',
                    style: TextStyle(fontWeight: FontWeight.w500)),
                Switch(
                  value: doubleSided,
                  onChanged: (val) => setState(() => doubleSided = val),
                  activeColor: Color(0xFF2346E6),
                ),
              ],
            ),
            SizedBox(height: 20),
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
                  Row(
                    children: [
                      Icon(Icons.receipt_long, color: Color(0xFF4F6AF6)),
                      SizedBox(width: 8),
                      Text('Estimated Cost',
                          style: TextStyle(fontWeight: FontWeight.w600)),
                    ],
                  ),
                  SizedBox(height: 8),
                  Text('₹ ${estimatedCost.toStringAsFixed(2)}',
                      style: TextStyle(
                          fontSize: 28,
                          color: Color(0xFF4F6AF6),
                          fontWeight: FontWeight.bold)),
                  SizedBox(height: 4),
                  Text('*Final cost may vary based on exact print details.',
                      style: TextStyle(fontSize: 12, color: Colors.grey)),
                ],
              ),
            ),
            Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/payment');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF2346E6),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 16),
                ),
                child:
                    Text('Proceed to Payment', style: TextStyle(fontSize: 16)),
              ),
            ),
            SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _toggleButton(String label, bool selected, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(30),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 18, vertical: 8),
        decoration: BoxDecoration(
          color: selected ? Color(0xFF2346E6) : Color(0xFFF8F9FB),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: selected ? Colors.white : Colors.grey[600],
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  Widget _stepperButton(IconData icon, VoidCallback onPressed) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        width: 32,
        height: 32,
        decoration: BoxDecoration(
          color: Color(0xFFF8F9FB),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Color(0xFFE8EDFF)),
        ),
        child: Icon(icon, size: 18, color: Colors.black),
      ),
    );
  }
}
