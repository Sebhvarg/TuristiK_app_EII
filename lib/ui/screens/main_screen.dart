import 'package:flutter/material.dart';
import 'package:turistik/ui/screens/home_screen.dart';
import 'package:turistik/ui/screens/favorite_screen.dart';
import 'package:turistik/ui/screens/tickets_screen.dart';
import 'package:turistik/ui/screens/calendar_screen.dart';
import 'package:turistik/ui/screens/profile_screen.dart';
import 'package:turistik/data/dummy_data.dart';

class MainScreen extends StatefulWidget {
  final int initialIndex;
  const MainScreen({super.key, required this.initialIndex});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late int _selectedIndex;
  late PageController _pageController;

  final List<Widget> _screens = [
    const FavoriteScreen(),
    const TicketsScreen(),
    const HomeScreen(),
    const CalendarScreen(),
    ProfileScreen(
      userProfile: userProfile,
    ),
  ];

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex;
    _pageController = PageController(initialPage: _selectedIndex);
  }

  void _onItemTapped(int index) {
    if (_selectedIndex == index) return;
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: _screens,
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: "Favoritos",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.local_activity),
              label: "Tickets",
            ),
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Inicio"),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today),
              label: "Calendario",
            ),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Perfil"),
          ],
          selectedItemColor: Theme.of(context).primaryColor,
          unselectedItemColor: Colors.grey,
          type: BottomNavigationBarType.fixed,
        ),
      ),
    );
  }
}
