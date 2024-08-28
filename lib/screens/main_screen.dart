import 'package:flutter/material.dart';
import 'package:id_334/pages/art_price_page.dart';
import 'package:id_334/pages/settings_page.dart';

import '../pages/main_page.dart';
import '../widgets/bottom_navbar.dart';
import '../widgets/custom_appbar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  int _currentLevel = 0;
  bool _isGameStarted = false;
  bool _isGameFinished = false;

  final List<String> _titles = [
    'Main',
    'Guess the Price',
    'Settings',
  ];

  void _onItemTapped(int index) {
    setState(() {
      if (_selectedIndex == 1 && index != 1) {
        _isGameStarted = false;
        _isGameFinished = false;
      }

      _selectedIndex = index;
    });
  }

  void _onLevelChange(int level) {
    setState(() {
      _currentLevel = level;

      if (level > 31) {
        _isGameFinished = true;
        _isGameStarted = false;
      } else {
        _isGameStarted = true;
        _isGameFinished = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: _titles[_selectedIndex],
        levelIndicator:
            (_selectedIndex == 1 && _isGameStarted && !_isGameFinished)
                ? '$_currentLevel/31'
                : null,
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavbar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }

  List<Widget> get _pages {
    return [
      const MainPage(),
      ArtPricePage(onLevelChange: _onLevelChange),
      SettingsPage(),
    ];
  }
}
