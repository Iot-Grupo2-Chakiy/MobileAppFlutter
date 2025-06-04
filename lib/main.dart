import 'package:flutter/material.dart';
import 'dashboard.dart';
import 'devices.dart';
import 'routines.dart';
import 'historial.dart';
import 'public/custom-nav-bar.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'App Principal',
      home: const HomeWithNavBar(),
    );
  }
}

class HomeWithNavBar extends StatefulWidget {
  const HomeWithNavBar({super.key});

  @override
  State<HomeWithNavBar> createState() => _HomeWithNavBarState();
}

class _HomeWithNavBarState extends State<HomeWithNavBar> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    HistorialScreen(),
    RutinasScreen(),
    DashboardScreen(),
    DevicesScreen(),
    PlaceholderScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}

class PlaceholderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('Pantalla Perfil u otra')),
    );
  }
}
