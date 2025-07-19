import 'package:flutter/material.dart';
import '../../ui/screens/home_screen.dart';
import '../../ui/screens/favorite_screen.dart';
import '../../ui/screens/tickets_screen.dart';
import '../../ui/screens/profile_screen.dart';
import '../../ui/screens/calendar_screen.dart';

class AppRoutes {
  static const String home = '/home';
  static const String favorites = '/favorites';
  static const String tickets = '/tickets';
  static const String calendar = '/calendar';
  static const String profile = '/profile';

  static Map<String, WidgetBuilder> routes = {
    AppRoutes.favorites: (context) => const FavoriteScreen(),
    AppRoutes.tickets: (context) => const TicketsScreen(),
    AppRoutes.calendar: (context) => const CalendarScreen(),
    AppRoutes.profile: (context) => const ProfileScreen(),
    AppRoutes.home: (context) => const HomeScreen(),
  };
}
