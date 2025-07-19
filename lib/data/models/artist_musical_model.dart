import 'artist_model.dart';
import '../enum/genre_musical.dart';

class MusicalArtistModel extends ArtistModel {
  final String musicalType;
  final List<GenreMusica> genres;
  final String? spotifyUrl;

  MusicalArtistModel({
    required super.id,
    required super.name,
    required super.imagePath,
    required String super.description,
    required this.musicalType,
    required this.genres,
    this.spotifyUrl,
  });
}
