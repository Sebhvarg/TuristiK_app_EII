class EventModel {
  final String title;
  final String date;
  final String hour;
  final String location;
  final String imagePath;
  final String description;
  final bool isFree;
  final double? price;
  final String type;
  final List<String> artistId;
  final String? director;

  EventModel({
    required this.title,
    required this.date,
    required this.hour,
    required this.location,
    required this.imagePath,
    required this.description,
    required this.isFree,
    this.price,
    required this.type,
    required this.artistId,
    this.director,
  });
}
