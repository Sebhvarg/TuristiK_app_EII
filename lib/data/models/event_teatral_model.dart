import 'event_model.dart';

class TeatralEventModel extends EventModel {
  final String teatroType;
  final List<String> artistNames;
  final String director;

  TeatralEventModel({
    required super.title,
    required super.date,
    required super.hour,
    required super.location,
    required super.imagePath,
    required super.description,
    required super.isFree,
    required super.price,
    required this.teatroType,
    required this.artistNames,
    required this.director,
    required super.artistId,
  }) : super(type: 'Teatral');
}
