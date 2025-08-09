import 'package:feen_mobile/base/res/styles/app_styles.dart';
import 'package:feen_mobile/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'dart:ui';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final appScreens = [
    HomeScreen(),
    // Statistics screen suggestion: show stats and charts
    Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.stacked_bar_chart, size: 60, color: Colors.green),
          SizedBox(height: 16),
          Text(
            "Statistics",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text("View trends and key numbers.", textAlign: TextAlign.center),
          // TODO: Add charts or cards for statistics
        ],
      ),
    ),
    // Settings screen suggestion: user preferences
    Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.settings, size: 60, color: Colors.grey),
          SizedBox(height: 16),
          Text(
            "Settings",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text("Manage your preferences.", textAlign: TextAlign.center),
          // TODO: Add settings options (theme, notifications, account info, logout)
        ],
      ),
    ),
  ];

  // Change the index of the bottom navbar
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      extendBodyBehindAppBar: true,
      appBar: _selectedIndex == 0
          ? PreferredSize(
              preferredSize: const Size.fromHeight(kToolbarHeight),
              child: ClipRRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                  child: AppBar(
                    backgroundColor: Colors.white.withOpacity(0.18),
                    elevation: 0,
                    automaticallyImplyLeading: false,
                    leadingWidth: 56,
                    leading: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: const CircleAvatar(
                        backgroundImage: AssetImage('assets/avatar.png'),
                        radius: 18,
                      ),
                    ),
                    title: const Text(
                      'فين',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 32,
                        letterSpacing: 2,
                      ),
                    ),
                    centerTitle: true,
                    actions: [
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: IconButton(
                          icon: const Icon(Icons.tune, color: Colors.black),
                          onPressed: () {
                            _scaffoldKey.currentState?.openEndDrawer();
                          },
                        ),
                      ),
                    ],
                    toolbarHeight: kToolbarHeight,
                  ),
                ),
              ),
            )
          : null,
      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text('Drawer Header'),
            ),
            ListTile(
              title: const Text('Item 1'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Item 2'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: appScreens[_selectedIndex],
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
        child: BottomNavigationBar(
          backgroundColor: AppStyles.primaryColor,
          type: BottomNavigationBarType.fixed,
          onTap: _onItemTapped,
          currentIndex: _selectedIndex,
          selectedItemColor: AppStyles.secondaryColor,
          unselectedItemColor: Colors.white,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              activeIcon: Icon(Icons.home_filled),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.stacked_bar_chart_outlined),
              activeIcon: Icon(Icons.stacked_bar_chart),
              label: "Statistics",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings_outlined),
              activeIcon: Icon(Icons.settings),
              label: "Settings",
            ),
          ],
        ),
      ),
    );
  }
}
