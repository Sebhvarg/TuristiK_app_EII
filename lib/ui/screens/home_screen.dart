import 'package:flutter/material.dart';
import 'package:turistik/data/models/artist_musical_model.dart';
import 'package:turistik/data/models/event_musical_model.dart';
import 'package:turistik/data/models/event_teatral_model.dart';
import '../widgets/top_bar.dart';
import '../widgets/search_bar.dart';
import '../widgets/event_section.dart';
import '../widgets/artist_section.dart';
import '../../data/dummy_data.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  List<MusicalEventModel> get conciertos => concerts;
  List<TeatralEventModel> get teatrosE => teatroEvents;
  List<MusicalArtistModel> get artists => artistsmusical;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    // Línea debajo de la barra de búsqueda
                    const Padding(
                      padding: EdgeInsets.only(top: 0, bottom: 10),
                      child: Divider(thickness: 1.5, color: Colors.grey),
                    ),

                    const Text(
                      "Eventos Cercanos a ti",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
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
