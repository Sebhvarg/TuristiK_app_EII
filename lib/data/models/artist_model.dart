class ArtistModel {
  final String name;
  final String imagePath;
  final String? description;
  final String type;
  final String? genre;
  final String spotifyUrl;
  final String? nextEventDate;
  final List<String> socialLinks;

  ArtistModel({
    required this.name,
    required this.imagePath,
    this.description,
    required this.type,
    required this.genre,
    required this.spotifyUrl,
    this.nextEventDate,
    required this.socialLinks,
  });
}
