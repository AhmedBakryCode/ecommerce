import 'package:e_commerce/modules/search_page/screens/search_screen.dart';
import 'package:flutter/material.dart';


class BottomNavBarPage extends StatefulWidget {
  @override
  _BottomNavBarPageState createState() => _BottomNavBarPageState();
}

class _BottomNavBarPageState extends State<BottomNavBarPage> {
  int _selectedIndex = 0;
  List<String> _titles = ['Home', 'Search', 'Profile', 'Settings', 'More'];

  // A list of widget screens for navigation
  final List<Widget> _screens = [
    Center(child: Text('Home Screen')), // Placeholder for Home
    SearchScreen(),                      // Call SearchScreen here
    Center(child: Text('Profile Screen')), // Placeholder for Profile
    Center(child: Text('Settings Screen')), // Placeholder for Settings
    Center(child: Text('More Screen')), // Placeholder for More
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex], // Show the selected screen
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: [
          _buildNavItem(Icons.home, 'Home', 0),
          _buildNavItem(Icons.search, 'Search', 1),
          _buildNavItem(Icons.person, 'Profile', 2),
          _buildNavItem(Icons.settings, 'Settings', 3),
          _buildNavItem(Icons.more_horiz, 'More', 4),
        ],
      ),
    );
  }

  BottomNavigationBarItem _buildNavItem(IconData icon, String label, int index) {
    bool isSelected = _selectedIndex == index;
    return BottomNavigationBarItem(
      icon: Column(
        children: [
          CircleAvatar(
            backgroundColor: isSelected ? Colors.blue : Colors.transparent,
            child: Icon(
              icon,
              color: isSelected ? Colors.white : Colors.black,
            ),
          ),
          SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              color: isSelected ? Colors.blue : Colors.black,
              decoration: isSelected ? TextDecoration.underline : TextDecoration.none,
            ),
          ),
        ],
      ),
      label: '',
    );
  }
}