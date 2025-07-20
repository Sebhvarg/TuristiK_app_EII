import 'artist_model.dart';
import '../enum/genre_musical.dart';

class MusicalArtistModel extends ArtistModel {
  final String musicalType;
  final List<GenreMusica> genres;
  final String? spotifyUrl;
  final String type = 'Musical';

  MusicalArtistModel({
    required super.id,
    required super.name,
    required super.imagePath,
    required super.description,
    required this.musicalType,
    required this.genres,
    this.spotifyUrl,
  });
  @override
  String get genresText => genres.map((e) => e.label).join(', ');

  @override
  String get artistTypeText => musicalType;
}
