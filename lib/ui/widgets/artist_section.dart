import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../../data/models/artist_model.dart';
import 'artist_card.dart';

class ArtistSection extends StatelessWidget {
  final String title;
  final IconData icon;
  final List<ArtistModel> artists;

  const ArtistSection({
    super.key,
    required this.title,
    required this.icon,
    required this.artists,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, color: Theme.of(context).primaryColor),
            const SizedBox(width: 8),
            Text(
              title,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        const SizedBox(height: 10),
        CarouselSlider(
          options: CarouselOptions(
            height: 180,
            viewportFraction: 0.4,
            enableInfiniteScroll: false,
            padEnds: false,
          ),
          items: artists.map((artist) => ArtistCard(artist: artist)).toList(),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
