import 'package:flutter/material.dart';
import '../../data/models/artist_model.dart';
import 'package:url_launcher/url_launcher.dart';

class ArtistScreen extends StatelessWidget {
  final ArtistModel artist;

  const ArtistScreen({super.key, required this.artist});

  // ignore: unused_element
  void _launchUrl(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar:
          true, // Permite que el cuerpo esté detrás del AppBar
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(
          color: Theme.of(context).primaryColor,
          shadows: [
            Shadow(
              color: Colors.black.withOpacity(0.7), // sombra oscura
              offset: Offset(1, 1),
              blurRadius: 4,
            ),
            Shadow(
              color: Theme.of(
                context,
              ).scaffoldBackgroundColor, // simula borde blanco
              offset: Offset(0, 0),
              blurRadius: 2,
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(10)),
            child: Image.asset(
              artist.imagePath,
              height: 250, // Puedes ajustar la altura si lo deseas
              fit: BoxFit.cover,
              width: double.infinity,
              color: Colors.black.withOpacity(0.2), // Filtro de color
              colorBlendMode: BlendMode.darken, // Modo de mezcla
            ),
          ),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 250), // Espacio para la imagen

                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.vertical(
                        bottom: Radius.circular(10),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          artist.name,
                          style: Theme.of(context).textTheme.titleLarge
                              ?.copyWith(
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                              ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "Género ${artist.genre}",
                          style: TextStyle(fontStyle: FontStyle.italic),
                        ),
                        const SizedBox(height: 4),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            artist.description ?? '',
                            textAlign: TextAlign.justify,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        const SizedBox(height: 18),

                        Wrap(
                          spacing: 10,
                          runSpacing: 10,
                          alignment: WrapAlignment.center,
                          children: [
                            ElevatedButton.icon(
                              onPressed: () {},
                              icon: Icon(Icons.music_note),
                              label: Text(
                                "Escucha su música",
                                style: TextStyle(color: Colors.white),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black,
                                iconColor: Colors.white,
                                textStyle: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                              ),
                            ),
                          ],
                        ),
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
