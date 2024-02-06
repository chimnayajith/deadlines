import 'package:deadlines/models/user_data.dart';
import 'package:deadlines/repositories/user_repository.dart';
import 'package:deadlines/screens/groups_screen.dart';
import 'package:deadlines/screens/profile_screen.dart';
import 'package:deadlines/screens/upcoming_screen.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _currentIndex = 0;
  UserUtils userUtils = UserUtils();
  late Future<UserData> currentUser;
  late List<Widget> _pages;
  @override
  void initState() {
    super.initState();
    _pages = [
      HomePage(),
      UpcomingPage(),
      ProfilePage(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _pages[_currentIndex],
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Container(
          margin: const EdgeInsets.all(16),
          height: MediaQuery.of(context).size.height * 0.07,
          decoration: BoxDecoration(
              color: Color.fromARGB(255, 26, 26, 26),
              borderRadius: BorderRadius.circular(15)),
          child: NavigationBar(
            backgroundColor: Colors.transparent,
            indicatorColor: Colors.transparent,
            labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
            animationDuration: const Duration(milliseconds: 500),
            selectedIndex: _currentIndex,
            onDestinationSelected: (value) {
              setState(() {
                _currentIndex = value;
              });
            },
            destinations: const [
              NavigationDestination(
                  icon: Icon(Icons.home, color: Colors.white),
                  selectedIcon: Icon(Icons.home,
                      color: Color.fromARGB(255, 219, 200, 26)),
                  label: "Home"),
              NavigationDestination(
                  icon: Icon(Icons.calendar_month, color: Colors.white),
                  selectedIcon: Icon(Icons.home,
                      color: Color.fromARGB(255, 219, 200, 26)),
                  label: "Upcoming"),
              NavigationDestination(
                icon: Icon(Icons.person, color: Colors.white),
                selectedIcon:
                    Icon(Icons.home, color: Color.fromARGB(255, 219, 200, 26)),
                label: "Profile",
              )
            ],
          ),
        ));
  }
}
