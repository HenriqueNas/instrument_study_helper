import 'package:flutter/material.dart';

import 'modules/pratice/pratice.page.dart';
import 'modules/settings/settings.page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

final screens = [
  const PraticePage(),
  const Center(child: Text('Metrônomo')),
  const SettingsPage(),
];

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.music_note),
            label: 'Praticar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.timer),
            label: 'Metrônomo',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Configurações',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
