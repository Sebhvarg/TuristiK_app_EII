class ArtistModel {
  final String name;
  final String imagePath;
  final String description;
  final String id;
  final List<String>? socialLinks;

  ArtistModel({
    required this.name,
    required this.imagePath,
    required this.description,
    required this.id,
    this.socialLinks,
  });

  String get genresText => 'No definido';
  String get artistTypeText => 'Desconocido';
}
