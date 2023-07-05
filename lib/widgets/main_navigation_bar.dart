import 'package:flutter/material.dart';

class MainBottomNavigation extends StatefulWidget {
  const MainBottomNavigation({Key? key, required this.onPageChanged }) : super(key: key);

  final Function(int) onPageChanged;

  @override
  State<MainBottomNavigation> createState() => _MainBottomNavigationState();
}

class _MainBottomNavigationState extends State<MainBottomNavigation> {

  int _currentIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
    widget.onPageChanged(index);
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: _onItemTapped,
      backgroundColor: Colors.transparent,
      elevation: 1,
      selectedItemColor: Colors.red,
      unselectedItemColor: const Color(0xFF6D6D6D),
      currentIndex: _currentIndex,
      items: const [
        BottomNavigationBarItem(
          label: "Exercícios",
          icon: Icon(
              Icons.schedule,
          ),
        ),
        BottomNavigationBarItem(
          label: "Treino",
          icon: Icon(
            Icons.fitness_center,
          ),
        ),
        BottomNavigationBarItem(
          label: "Nutrição",
          icon: Icon(
              Icons.restaurant,
          ),
        ),
      ],
    );
  }
}
