import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:frangup/pages/diet_page.dart';
import 'package:frangup/pages/exercises_page.dart';
import 'package:frangup/pages/workout_page.dart';
import 'package:frangup/widgets/button_app_bar.dart';
import 'package:frangup/widgets/main_drawer.dart';
import 'package:frangup/widgets/main_navigation_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  late User? currentUser;

  @override
  void initState() {
    super.initState();
    currentUser = FirebaseAuth.instance.currentUser;
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1B1B23),
      drawer: MainDrawer(currentUser: currentUser),
      bottomNavigationBar: MainBottomNavigation(
        onPageChanged: _onPageChanged,
      ),
      appBar: ButtonAppBar(),
      body: IndexedStack(
        index: _currentIndex,
        children: pages,
      ),
    );
  }
}
