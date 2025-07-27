import 'package:flutter/material.dart';
import 'package:flutter_rice_disease/screens/search_rice_disease_screen.dart';
import 'package:flutter_rice_disease/screens/search_rice_varieties_screen.dart';

import '../utils.dart';

class SearchMainScreen extends StatefulWidget {
  const SearchMainScreen({key});

  @override
  State<SearchMainScreen> createState() => _SearchMainScreenState();
}

class _SearchMainScreenState extends State<SearchMainScreen> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    SearchRiceDiseaseScreen(),
    SearchRiceVarietiesScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "ค้นหาทั่วไป",
          style: TextStyle(fontSize: 20),
        ),
        backgroundColor: firstColor,
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(null),
            label: 'โรคข้าว',
          ),
          BottomNavigationBarItem(
            icon: Icon(null),
            label: 'พันธุ์ข้าว',
          ),
        ],
        selectedFontSize: 24,
        unselectedFontSize: 24,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.w700),
        selectedIconTheme: IconThemeData(opacity: 0.0, size: 0),
        unselectedIconTheme: IconThemeData(opacity: 0.0, size: 0),
        currentIndex: _selectedIndex,
        selectedItemColor: firstColor,
        onTap: _onItemTapped,
      ),
    );
  }
}
