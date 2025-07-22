import 'package:flutter/material.dart';
import 'package:turistik/ui/screens/home_screen.dart';
import 'package:turistik/ui/screens/favorite_screen.dart';
import 'package:turistik/ui/screens/tickets_screen.dart';
import 'package:turistik/ui/screens/calendar_screen.dart';
import 'package:turistik/ui/screens/profile_screen.dart';
import 'package:turistik/data/dummy_data.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key, required int initialIndex});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 2;
  final PageController _pageController = PageController();

  final List<Widget> _screens = [
    const FavoriteScreen(),
    const TicketsScreen(),
    const HomeScreen(),
    const CalendarScreen(),
    ProfileScreen(
      userProfile: userProfile,
    ), // Asegúrate de pasar el perfil del usuario
  ];

  void _onItemTapped(int index) {
    if (_selectedIndex == index) return;
    // Cambia la página con animación deslizante
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
        physics: const NeverScrollableScrollPhysics(), // Evita swipe manual
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
