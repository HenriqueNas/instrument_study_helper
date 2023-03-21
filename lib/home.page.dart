import 'package:flutter/cupertino.dart';

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
    return CupertinoTabScaffold(
      backgroundColor: CupertinoTheme.of(context).scaffoldBackgroundColor,
      tabBar: CupertinoTabBar(
        height: 60,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.music_note_list),
            label: 'Praticar',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.metronome),
            label: 'Metrônomo',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.settings_solid),
            label: 'Configurações',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
      tabBuilder: (context, index) {
        return CupertinoTabView(
          builder: (context) {
            return screens[index];
          },
        );
      },
    );
  }
}
