import 'package:flutter/material.dart';
import 'package:og/widgets/bottom_nav_bar.dart';

class NearbyKioskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavBar(currentIndex: 3),
      appBar: AppBar(title: Text("Find Nearby Kiosks")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // MAP Mock
            Container(
              height: 250,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Text(
                  "🗺️ Map View Placeholder",
                  style: TextStyle(color: Colors.grey, fontSize: 16),
                ),
              ),
            ),

            SizedBox(height: 20),

            // Navigate Button
            ElevatedButton.icon(
              onPressed: () {
                // TODO: Launch Maps app with real location later
              },
              icon: Icon(Icons.navigation),
              label: Text("Navigate with Maps"),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 48),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
              ),
            ),

            SizedBox(height: 20),

            // Optional: list view in future
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Map View", style: TextStyle(fontWeight: FontWeight.bold)),
                TextButton(
                    onPressed: () {
                      // TODO: List view logic
                    },
                    child: Text("List View"))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
