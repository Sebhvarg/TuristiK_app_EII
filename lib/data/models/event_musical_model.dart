import './event_model.dart';

class MusicalEventModel extends EventModel {
  final String musicalType;
  final List<String> artistNames;
  final String? spotifyUrl;

  MusicalEventModel({
    required super.title,
    required super.date,
    required super.hour,
    required super.location,
    required super.imagePath,
    required super.description,
    required super.isFree,
    required super.price,
    this.spotifyUrl,
    required this.musicalType,
    required this.artistNames,
  });
}
