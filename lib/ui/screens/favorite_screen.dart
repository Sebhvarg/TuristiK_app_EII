import 'package:flutter/material.dart';
import 'package:turistik/core/constants/colors.dart';
import '../../ui/widgets/artist_card.dart';
import 'artist_screen.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.background,
        title: const Text(
          'Favoritos',
          style: TextStyle(
            color: AppColors.accent,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: favoriteArtists.isEmpty
          ? const Center(
              child: Text(
                'Aquí se mostrarán tus artistas favoritos 💖',
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.8,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                ),
                itemCount: favoriteArtists.length,
                itemBuilder: (context, index) {
                  final artist = favoriteArtists[index];
                  return ArtistCard(artist: artist);
                },
              ),
            ),
    );
  }
}
