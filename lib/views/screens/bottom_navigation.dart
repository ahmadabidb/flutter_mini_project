import 'package:flutter/material.dart';
import 'package:flutter_diet_planner/views/screens/progress_screen.dart';
import 'package:flutter_diet_planner/views/screens/workout_screen.dart';
import 'package:flutter_diet_planner/views/screens/home_screen.dart';
import 'package:flutter_diet_planner/views/screens/meal_plan_screen.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _selectedIndex = 0;

  final List<Widget> _widgetOptions = <Widget>[
    const HomeScreen(),
    const MealPlanScreen(),
    WorkoutScreen(),
    ProgressScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: ConvexAppBar(
        backgroundColor: Colors.green,
        items: const [
          TabItem(icon: Icons.home, title: 'Home'),
          TabItem(icon: Icons.restaurant, title: 'Meal Plan'),
          TabItem(icon: Icons.fitness_center, title: 'Workout'),
          TabItem(icon: Icons.people, title: 'Profile'),
        ],
        onTap: _onItemTapped,
      ),
    );
  }
}
