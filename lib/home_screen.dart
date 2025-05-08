import 'package:flutter/material.dart';
import 'package:flutter_application_1/items_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final _navigatorKeys = List.generate(3, (_) => GlobalKey<NavigatorState>());

  void _onTabTapped(int index) {
    if (index == _selectedIndex) {
      _navigatorKeys[index].currentState?.popUntil((route) => route.isFirst);
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  Widget _buildOffstageNavigator(int index) {
    return Offstage(
      offstage: _selectedIndex != index,
      child: Navigator(
        key: _navigatorKeys[index],
        onGenerateRoute: (settings) {
          return MaterialPageRoute(
            builder: (context) => ItemsScreen(index: index),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (!didPop) {
          final isFirstRouteInCurrentTab = !await _navigatorKeys[_selectedIndex].currentState!.maybePop();
          // If we're already at the root, we could exit app or show a dialog
          // return;
        }
      },
      child: Scaffold(
        body: Stack(
          children: List.generate(3, _buildOffstageNavigator),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onTabTapped,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Tab 1'),
            BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Tab 2'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Tab 3'),
          ],
        ),
      ),
    );
  }
}
