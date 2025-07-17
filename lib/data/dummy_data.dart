import 'models/event_model.dart';
import 'models/artist_model.dart';
import '../core/constants/assets.dart';

final List<EventModel> teatroEvents = [
  EventModel(
    title: 'El Autómata',
    date: '30/jun/2025',
    location: 'UArtes',
    imagePath: Assets.eventPlaceholder,
  ),
  EventModel(
    title: 'Las Pájaros',
    date: '06/jul/2025',
    location: 'Teatro GYE',
    imagePath: Assets.eventPlaceholder,
  ),
];

final List<EventModel> conciertos = [
  EventModel(
    title: 'That Day',
    date: '04/jul/2025',
    location: 'Red Black - Bar',
    imagePath: Assets.eventPlaceholder,
  ),
  EventModel(
    title: 'Guardarraya',
    date: '06/jul/2025',
    location: 'Coliseo Polo',
    imagePath: Assets.eventPlaceholder,
  ),
];

final List<ArtistModel> artists = [
  ArtistModel(name: 'That Day', imagePath: Assets.artistPlaceholder),
  ArtistModel(name: 'Guardarraya', imagePath: Assets.artistPlaceholder),
];
