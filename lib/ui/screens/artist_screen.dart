import 'package:flutter/material.dart';
import '../../data/models/artist_model.dart';
import 'package:url_launcher/url_launcher.dart';

class ArtistScreen extends StatefulWidget {
  final ArtistModel artist;

  const ArtistScreen({super.key, required this.artist});

  @override
  _ArtistScreenState createState() => _ArtistScreenState();
}

class _ArtistScreenState extends State<ArtistScreen> {
  bool isFavorite = false;

  void _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  @override
  Widget build(BuildContext context) {
    final artist = widget.artist;
    Text('Géneros: ${artist.genresText}');
    Text('Tipo: ${artist.artistTypeText}');

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(
          color: Theme.of(context).primaryColor,
          shadows: [
            Shadow(
              color: Colors.black.withOpacity(0.7),
              offset: Offset(1, 1),
              blurRadius: 4,
            ),
            Shadow(
              color: Theme.of(context).scaffoldBackgroundColor,
              offset: Offset(0, 0),
              blurRadius: 2,
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              color: isFavorite ? Colors.red : Theme.of(context).primaryColor,
            ),
            onPressed: () {
              setState(() {
                isFavorite = !isFavorite;
              });
            },
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(
              bottom: Radius.circular(10),
            ),
            child: Image.asset(
              artist.imagePath,
              height: 250,
              fit: BoxFit.cover,
              width: double.infinity,
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
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
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
                          "Tipo de artista: ${artist.artistTypeText}",
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "Géneros: ${artist.genresText}",
                          style: const TextStyle(fontStyle: FontStyle.italic),
                        ),
                        const SizedBox(height: 4),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            artist.description,
                            textAlign: TextAlign.justify,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        const SizedBox(height: 18),
                        const Text(
                          "Muestra artística:",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.black54,
                          ),
                        ),
                        Wrap(
                          spacing: 10,
                          runSpacing: 10,
                          alignment: WrapAlignment.center,
                          children: [
                            if ((artist as dynamic).spotifyUrl != null)
                              ElevatedButton.icon(
                                onPressed: () =>
                                    _launchUrl((artist as dynamic).spotifyUrl),
                                icon: const Icon(Icons.music_note),
                                label: const Text(
                                  "Escucha su música",
                                  style: TextStyle(color: Colors.white),
                                ),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.black,
                                  iconColor: Colors.white,
                                  textStyle: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                ),
                              ),
                          ],
                        ),
                        const SizedBox(height: 18),

                        const SizedBox(height: 18),
                        if ((artist as dynamic).socialLinks != null)
                          const Text(
                            "Enlaces sociales:",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.black54,
                            ),
                          ),
                        const SizedBox(height: 8),
                        if ((artist as dynamic).socialLinks != null)
                          Wrap(
                            spacing: 10,
                            runSpacing: 10,
                            alignment: WrapAlignment.center,
                            children: (artist as dynamic).socialLinks
                                .map<Widget>((link) {
                                  return ElevatedButton(
                                    onPressed: () => _launchUrl(link),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.blue,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                    ),
                                    child: Text(
                                      link.split('//')[1],
                                      style: const TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  );
                                })
                                .toList(),
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
