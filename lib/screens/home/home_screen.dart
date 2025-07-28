import 'package:flutter/material.dart';
import 'package:rideo/screens/home/ActivityTab/activity_screen.dart';
import 'package:rideo/screens/home/HomeTab/postajob_screen.dart';
import 'package:rideo/screens/home/HomeTab/ridelater_screen.dart';
import 'package:rideo/screens/home/HomeTab/ridenow_screen.dart';

import 'package:rideo/utils/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0; // Tracks current bottom nav index
  int _homeTabIndex = 0; // Tracks current inner home tab index

  // Labels for Home Sub Tabs
  final List<String> _homeTabs = ["Ride Now", "Ride Later", "Post a Job"];

  // Body content based on selected bottom tab
  Widget _getCurrentTabWidget() {
    switch (_selectedIndex) {
      case 0:
        return _buildHomeContent();
      case 1:
        return const Center(child: Text("Services Coming Soon"));
      case 2:
        return ActivityScreen();
      case 3:
        return const Center(child: Text("Profile Page"));
      default:
        return const Center(child: Text("Unknown Tab"));
    }
  }

  // Home Tab UI with sub navigation (Ride Now, Ride Later, Post a Job)
  Widget _buildHomeContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Text(
            "Sarthi",
            style: GoogleFonts.poppins(
              fontSize: 26,
              fontWeight: FontWeight.w700,
              color: primaryColor,
            ),
          ),
        ),
        const SizedBox(height: 15),

        // Sub-tab navigation inside Home
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(_homeTabs.length, (index) {
              final isSelected = _homeTabIndex == index;
              return GestureDetector(
                onTap: () {
                  setState(() => _homeTabIndex = index);
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      _homeTabs[index],
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight:
                            isSelected ? FontWeight.bold : FontWeight.w600,
                        color: isSelected ? Colors.blue : Colors.grey[600],
                      ),
                    ),
                    const SizedBox(height: 4), // Gap between text and underline
                    if (isSelected)
                      Container(
                        height: 2.5, // Thickness of underline
                        width: 85, // Length of underline
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                  ],
                ),
              );
            }),
          ),
        ),

        const SizedBox(height: 15),

        // Content based on selected home tab
        if (_homeTabIndex == 0) ...[
          Expanded(child: RidenowScreen()),
        ] else if (_homeTabIndex == 1) ...[
          Expanded(child: RideLaterScreen()),
        ] else if (_homeTabIndex == 2) ...[
          Expanded(child: PostajobScreen()),
        ],
      ],
    );
  }

  // Handle bottom tab changes
  void _onBottomTabTapped(int index) {
    setState(() => _selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(child: _getCurrentTabWidget()),
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
        child: Container(
          height: 70, // ✅ Increased height
          decoration: const BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 8,
                offset: Offset(0, -2),
              ),
            ],
          ),
          child: BottomNavigationBar(
            currentIndex: _selectedIndex,
            onTap: _onBottomTabTapped,
            selectedItemColor: primaryColor,
            unselectedItemColor: Colors.grey[600],
            backgroundColor: const Color.fromARGB(
              255,
              87,
              151,
              255,
            ).withOpacity(0.1),
            elevation: 0,
            type: BottomNavigationBarType.fixed,
            selectedLabelStyle: const TextStyle(fontSize: 13),
            unselectedLabelStyle: const TextStyle(fontSize: 12),
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.miscellaneous_services),
                label: 'Services',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.history),
                label: 'Activity',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_outline),
                label: 'Profile',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
