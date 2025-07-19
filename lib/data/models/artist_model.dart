class ArtistModel {
  final String name;
  final String imagePath;
  final String? description;
  final String id;
  final List<String>? socialLinks;

  ArtistModel({
    required this.name,
    required this.imagePath,
    this.description,
    required this.id,
    this.socialLinks,
  });
}
