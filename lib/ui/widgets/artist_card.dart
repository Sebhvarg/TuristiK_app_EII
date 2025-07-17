import 'package:flutter/material.dart';
import '../../data/models/artist_model.dart';

class ArtistCard extends StatelessWidget {
  final ArtistModel artist;

  const ArtistCard({super.key, required this.artist});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Image.asset(
            artist.imagePath,
            fit: BoxFit.cover,
            height: 100,
            width: double.infinity,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              artist.name,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
