import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  final Widget child;
  final int currentPageIndex;
  final ValueChanged<int> onDestinationSelected;

  const MainScreen({
    super.key,
    required this.child,
    required this.currentPageIndex,
    required this.onDestinationSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentPageIndex,
        onDestinationSelected: (index) {
          onDestinationSelected(index);
        },
        destinations: const [
          NavigationDestination(icon: Icon(Icons.today), label: 'Today'),
          NavigationDestination(icon: Icon(Icons.refresh), label: 'Hourly'),
          NavigationDestination(
              icon: Icon(Icons.watch_later_outlined), label: '10-Day'),
          NavigationDestination(icon: Icon(Icons.radar), label: 'Radar'),
          NavigationDestination(icon: Icon(Icons.settings), label: 'Settings'),
        ],
      ),
    );
  }
}
