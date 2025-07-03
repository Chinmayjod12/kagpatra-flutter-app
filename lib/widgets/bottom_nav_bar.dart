import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;

  const BottomNavBar({required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.grey,
      onTap: (index) {
        if (index == currentIndex) return;
        if (index == 0) Navigator.pushReplacementNamed(context, '/');
        if (index == 1) Navigator.pushReplacementNamed(context, '/estimate');
        if (index == 2) Navigator.pushReplacementNamed(context, '/profile');
        if (index == 3) Navigator.pushReplacementNamed(context, '/kiosks');
      },
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.calculate), label: 'Estimate'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        BottomNavigationBarItem(icon: Icon(Icons.map), label: 'Nearby Kiosks'),
      ],
    );
  }
}
