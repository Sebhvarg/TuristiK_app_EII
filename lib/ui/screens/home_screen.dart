import 'package:flutter/material.dart';
import '../widgets/top_bar.dart';
import '../widgets/search_bar.dart';
import '../widgets/event_section.dart';
import '../widgets/artist_card.dart';
import '../widgets/artist_section.dart';
import '../../data/dummy_data.dart';

// Add this import or definition if 'newArtists' is missing from dummy_data.dart
// import or define 'newArtists' here if not already present
import '../navigation/bottom_nav_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomNavBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TopBar(),
              const SizedBox(height: 20),
              const SearchBarWidget(),
              const SizedBox(height: 20),
              Expanded(
                child: ListView(
                  children: [
                    // Poner una linea debajo de la barra de búsqueda
                    Padding(
                      padding: EdgeInsets.only(top: 0, bottom: 10),
                      child: Divider(thickness: 1.5, color: Colors.grey),
                    ),

                    const Text(
                      "Eventos Cercanos",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    EventSection(
                      title: 'Teatro',
                      icon: Icons.theater_comedy,
                      events: teatroEvents,
                    ),
                    EventSection(
                      title: 'Conciertos',
                      icon: Icons.music_note,
                      events: conciertos,
                    ),

                    const SizedBox(height: 10),
                    ArtistSection(
                      title: 'Artistas',
                      icon: Icons.person,
                      artists: artists,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
