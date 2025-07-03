import 'package:flutter/material.dart';
import 'package:og/widgets/bottom_nav_bar.dart';
import '../widgets/print_job_card.dart';

class ProfileScreen extends StatelessWidget {
  final List<Map<String, String>> printHistory = [
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
      bottomNavigationBar: BottomNavBar(currentIndex: 2),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 8),
              Text('My Profile',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              SizedBox(height: 16),
              // Profile Card
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 28,
                      backgroundImage: AssetImage(
                          'assets/profile.jpg'), // Replace with your asset or NetworkImage
                      child: ClipOval(
                          child: Image.asset('assets/profile.jpg',
                              fit: BoxFit.cover)),
                      // fallback: child: Text('JD', style: TextStyle(fontSize: 20)),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Jane Doe',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold)),
                          Text('janedoe@example.com',
                              style: TextStyle(color: Colors.grey[700])),
                        ],
                      ),
                    ),
                    Icon(Icons.edit, color: Colors.grey[600]),
                  ],
                ),
              ),
              SizedBox(height: 24),
              Text('Print History',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
              SizedBox(height: 8),
              Expanded(
                child: ListView.builder(
                  itemCount: printHistory.length,
                  itemBuilder: (context, index) {
                    final job = printHistory[index];
                    return PrintJobCard(
                      fileName: job['fileName']!,
                      dateTime: job['date']!,
                      status: job['status']!,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
