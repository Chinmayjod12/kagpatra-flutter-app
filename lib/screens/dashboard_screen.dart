import 'package:flutter/material.dart';
import 'package:og/widgets/bottom_nav_bar.dart';
import 'package:og/widgets/print_job_card.dart';

class DashboardScreen extends StatelessWidget {
  final List<Map<String, String>> printJobs = [
    {
      'fileName': 'Project Proposal.pdf',
      'date': '2025-06-15 10:30 AM',
      'status': 'Completed'
    },
    {
      'fileName': 'Project Proposal.pdf',
      'date': '2025-06-15 10:30 AM',
      'status': 'Completed'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavBar(currentIndex: 0),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Color(0xFFE8EDFF),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: EdgeInsets.all(8),
                      child: Icon(Icons.blur_circular_outlined,
                          color: Color(0xFF4F6AF6), size: 28),
                    ),
                    SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Hi, Prathamesh!',
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold)),
                        SizedBox(height: 4),
                        Text('Welcome back to Kagpatra. Ready to print?',
                            style: TextStyle(
                                color: Colors.grey[600], fontSize: 14)),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 20),
                // Start Printing Card
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                  elevation: 0,
                  color: Color(0xFFF8F9FB),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(16),
                    onTap: () {
                      Navigator.pushNamed(context, '/qrscan');
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 28),
                      child: Column(
                        children: [
                          Icon(Icons.qr_code_scanner,
                              color: Color(0xFF4F6AF6), size: 36),
                          SizedBox(height: 10),
                          Text('Start Printing',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18)),
                          SizedBox(height: 4),
                          Text('Scan kiosk QR to begin',
                              style: TextStyle(
                                  color: Colors.grey[500], fontSize: 14)),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                // Estimate & Nearby
                Row(
                  children: [
                    Expanded(
                      child: _actionCard(
                        title: 'Estimate Cost',
                        subtitle: 'Get an estimate for your print job.',
                        icon: Icons.attach_money_outlined,
                        onTap: () {
                          Navigator.pushNamed(context, '/estimate');
                        },
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: _actionCard(
                        title: 'Find Nearby Kiosk',
                        subtitle: 'Locate available printing kiosks.',
                        icon: Icons.location_on_outlined,
                        onTap: () {
                          Navigator.pushNamed(context, '/kiosks');
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 28),
                Text('Recent Print Jobs',
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                SizedBox(height: 12),
                ...printJobs.map((job) => _printJobCard(context, job)).toList(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _actionCard({
    required String title,
    required String subtitle,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Color(0xFFE8EDFF)),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            Icon(icon, size: 28, color: Color(0xFF4F6AF6)),
            SizedBox(height: 10),
            Text(title,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
            SizedBox(height: 4),
            Text(subtitle,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12, color: Colors.grey[600])),
          ],
        ),
      ),
    );
  }

  Widget _printJobCard(BuildContext context, Map<String, String> job) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 0,
      margin: EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Color(0xFFE8EDFF),
                borderRadius: BorderRadius.circular(8),
              ),
              padding: EdgeInsets.all(8),
              child: Icon(Icons.insert_drive_file_outlined,
                  color: Color(0xFF4F6AF6), size: 28),
            ),
            SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(job['fileName']!,
                      style: TextStyle(fontWeight: FontWeight.w600)),
                  SizedBox(height: 2),
                  Text(job['date']!,
                      style: TextStyle(fontSize: 13, color: Colors.grey[600])),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: Color(0xFFD6F5E7),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text('Completed',
                      style: TextStyle(
                          color: Color(0xFF2DB783),
                          fontWeight: FontWeight.w600,
                          fontSize: 12)),
                ),
                SizedBox(height: 8),
                GestureDetector(
                  onTap: () {},
                  child: Text('View Receipt',
                      style: TextStyle(
                          color: Color(0xFF4F6AF6),
                          fontWeight: FontWeight.w500,
                          fontSize: 13)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
