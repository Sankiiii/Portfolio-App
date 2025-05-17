import 'package:flutter/material.dart';
import 'package:portfolio_assi/widgets/custom_bottom_navigation.dart';
import 'package:portfolio_assi/screens/portfolio_screen.dart';
import 'package:portfolio_assi/screens/home_screen.dart';
import 'package:portfolio_assi/screens/input_screen.dart';
import 'package:portfolio_assi/screens/profile_screen.dart';



class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 2; // Default to portfolio (message icon)

  final List<Widget> _screens = [
    const HomeScreen(),
    const InputScreen(),
    const PortfolioScreen(),
    const ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: CustomBottomNavigation(
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}