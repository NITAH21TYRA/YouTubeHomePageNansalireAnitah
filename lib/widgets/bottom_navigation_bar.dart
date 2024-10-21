import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({Key? key}) : super(key: key);

  @override
  _CustomBottomNavigationBarState createState() => _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int _selectedIndex = 0;

  // List of items for the bottom navigation bar
  final List<BottomNavigationBarItem> _navBarItems = const [
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.play_arrow),
      label: 'Shorts',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.add_circle_outline),
      label: 'Upload',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.subscriptions),
      label: 'Subscriptions',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.account_circle),
      label: 'You',
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Change selected index when tapped
    });

    // Add your navigation logic here
    // For example, you can navigate to different screens based on the index
    switch (index) {
      case 0:
        // Navigate to Home
        break;
      case 1:
        // Navigate to Shorts
        break;
      case 2:
        // Navigate to Upload
        break;
      case 3:
        // Navigate to Subscriptions
        break;
      case 4:
        // Navigate to Account
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.black, // Dark theme background
      selectedItemColor: Colors.white, // Active item color
      unselectedItemColor: Colors.grey, // Inactive item color
      currentIndex: _selectedIndex, // Currently selected index
      onTap: _onItemTapped, // Handle tap event
      items: _navBarItems, // Navigation bar items
      type: BottomNavigationBarType.fixed, // Fix all items in place
    );
  }
}
