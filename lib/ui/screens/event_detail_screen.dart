import 'package:flutter/material.dart';
import 'package:turistik/data/models/artist_musical_model.dart';
import 'package:turistik/data/models/artist_teatral_model.dart';
import 'package:turistik/data/models/event_musical_model.dart';
import '../../data/models/event_model.dart';
import 'package:turistik/ui/screens/artist_screen.dart';

class EventDetailScreen extends StatelessWidget {
  final EventModel event;
  final List<MusicalArtistModel> artistsMusical;
  final List<TeatralArtistModel> artistsTeatral;
  const EventDetailScreen({
    super.key,
    required this.event,
    required this.artistsMusical,
    required this.artistsTeatral,
  });

  @override
  Widget build(BuildContext context) {
    // Función para obtener artista musical por ID
    MusicalArtistModel? getMusicalArtist(String id) {
      try {
        return artistsMusical.firstWhere((a) => a.id == id);
      } catch (_) {
        return null;
      }
    }

    // Función para obtener artista teatral por ID
    TeatralArtistModel? getTeatralArtist(String id) {
      try {
        return artistsTeatral.firstWhere((a) => a.id == id);
      } catch (_) {
        return null;
      }
    }

    // Obtener TODOS los artistas del evento
    List<dynamic> eventArtists = [];
    List<String> notFoundArtistIds = [];

    if (event is MusicalEventModel) {
      // Para eventos musicales, obtener todos los artistas musicales
      for (String artistId in event.artistId) {
        final artist = getMusicalArtist(artistId);
        if (artist != null) {
          eventArtists.add(artist);
        } else {
          notFoundArtistIds.add(artistId);
        }
      }
    } else {
      // Para eventos teatrales, obtener todos los artistas teatrales
      for (String artistId in event.artistId) {
        final artist = getTeatralArtist(artistId);
        if (artist != null) {
          eventArtists.add(artist);
        } else {
          notFoundArtistIds.add(artistId);
        }
      }
    }

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(
          color: Theme.of(context).primaryColor,
          shadows: [
            Shadow(
              color: Colors.black.withOpacity(0.7),
              offset: const Offset(1, 1),
              blurRadius: 4,
            ),
            Shadow(
              color: Theme.of(context).scaffoldBackgroundColor,
              offset: const Offset(0, 0),
              blurRadius: 2,
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(
              bottom: Radius.circular(10),
            ),
            child: Image.asset(
              event.imagePath,
              height: 250,
              width: double.infinity,
              fit: BoxFit.cover,
              color: Colors.black.withOpacity(0.2),
              colorBlendMode: BlendMode.darken,
            ),
          ),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 250),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(10),
                      ),
                    ),
                    child: Column(
                      children: [
                        Text(
                          event.title,
                          style: Theme.of(context).textTheme.titleLarge
                              ?.copyWith(
                                fontWeight: FontWeight.bold,
                                fontSize: 28,
                              ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          "${event.date} • ${event.location}",
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.black54,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            event.description,
                            textAlign: TextAlign.justify,
                            style: const TextStyle(fontSize: 16),
                          ),
                        ),
                        const SizedBox(height: 24),
                        const Divider(),
                        const SizedBox(height: 12),
                        Text(
                          eventArtists.length == 1
                              ? "Artista Principal"
                              : "Artistas (${eventArtists.length})",
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(height: 12),

                        // Mostrar todos los artistas
                        if (eventArtists.isNotEmpty)
                          Column(
                            children: eventArtists.map<Widget>((artist) {
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: ListTile(
                                  leading: CircleAvatar(
                                    backgroundImage: AssetImage(
                                      artist.imagePath,
                                    ),
                                    radius: 25,
                                  ),
                                  title: Text(
                                    artist.name,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  subtitle: Text(
                                    event is MusicalEventModel
                                        ? "Artista musical"
                                        : "Grupo teatral",
                                  ),
                                  trailing: const Icon(Icons.arrow_forward_ios),
                                  onTap: () {
                                    // Navegar al detalle del artista
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => ArtistScreen(artist: artist),
                                      ),
                                    );
                                  },
                                ),
                              );
                            }).toList(),
                          )
                        else
                          Column(
                            children: [
                              const Text(
                                'No se encontraron artistas',
                                style: TextStyle(color: Colors.red),
                              ),
                              const SizedBox(height: 10),
                              // Debug info
                              Text(
                                'Debug: IDs buscados:  [1m${event.artistId.join(", ")} [0m',
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ),
                              Text(
                                'IDs no encontrados:  [1m${notFoundArtistIds.join(", ")} [0m',
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.red,
                                ),
                              ),
                              Text(
                                'Tipo de evento: ${event.runtimeType}',
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),

                        const SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {
                            // Acción para comprar entradas
                          },
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 32,
                              vertical: 12,
                            ),
                            backgroundColor: Theme.of(context).primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                          child: const Text(
                            "Comprar Entrada",
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
