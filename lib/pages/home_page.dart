import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:frangup/pages/diet_page.dart';
import 'package:frangup/pages/exercises_page.dart';
import 'package:frangup/pages/workout_page.dart';
import 'package:frangup/widgets/button_app_bar.dart';
import 'package:frangup/widgets/current_day.dart';
import 'package:frangup/widgets/main_drawer.dart';
import 'package:frangup/widgets/main_navigation_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.currentUser}) : super(key: key);

  final User currentUser;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  void _onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  final List<Widget> pages = [
    const ExercisesPage(),
    const WorkoutPage(),
    const DietPage()
  ];

  final drawers = [
    AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
    ),
    const ButtonAppBar(),
    const CurrentDay()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1B1B23),
      drawer: MainDrawer(currentUser: widget.currentUser),
      bottomNavigationBar: MainBottomNavigation(
        onPageChanged: _onPageChanged,
      ),
      appBar: drawers[_currentIndex],
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage("images/main_background.jpg"),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              const Color(0xFF1B1B23).withOpacity(0.2),
              BlendMode.srcOver,
            ),
          ),
        ),
        child: IndexedStack(
          index: _currentIndex,
          children: pages,
        ),
      ),
    );
  }
}
