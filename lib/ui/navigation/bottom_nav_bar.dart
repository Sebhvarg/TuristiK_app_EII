import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Inicio"),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: "Buscar"),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: "Perfil"),
      ],
      selectedItemColor: Theme.of(context).primaryColor,
      unselectedItemColor: Colors.grey,
    );
  }
}
