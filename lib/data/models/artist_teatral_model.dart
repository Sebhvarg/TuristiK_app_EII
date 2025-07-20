import './artist_model.dart';
import '../enum/genre_teatro.dart';

class TeatralArtistModel extends ArtistModel {
  final String teatroType;
  final List<GenreTeatro> genres;
  final String type = 'Teatral';
  TeatralArtistModel({
    required super.id,
    required super.name,
    required super.imagePath,
    required super.description,
    required this.teatroType,
    required this.genres,
  });
}
