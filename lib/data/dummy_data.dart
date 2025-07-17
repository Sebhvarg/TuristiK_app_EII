import 'models/event_model.dart';
import 'models/artist_model.dart';
import '../core/constants/assets.dart';

final List<EventModel> teatroEvents = [
  EventModel(
    title: 'El Autómata',
    date: '30/jun/2025',
    location: 'UArtes',
    imagePath: Assets.eventPlaceholder[0],
  ),
  EventModel(
    title: 'Las Pájaros',
    date: '06/jul/2025',
    location: 'Teatro GYE',
    imagePath: Assets.eventPlaceholder[1],
  ),
  EventModel(
    title: 'El Hombre Elefante',
    date: '09/Ago/2025',
    location: 'Teatro Centro de Arte',
    imagePath: Assets.eventPlaceholder[0],
  ),
];

final List<EventModel> conciertos = [
  EventModel(
    title: 'Nada Que Ver Fest',
    date: '09/Ago/2025',
    location: 'Red Black Bar',
    imagePath: Assets.conciertoPlaceholder[0],
  ),
  EventModel(
    title: 'Guardarraya',
    date: '06/jul/2025',
    location: 'Coliseo Polo',
    imagePath: Assets.conciertoPlaceholder[1],
  ),
];

final List<ArtistModel> artists = [
  ArtistModel(name: 'That Day', imagePath: Assets.artistPlaceholder[0]),
  ArtistModel(name: 'Escarlatas Band', imagePath: Assets.artistPlaceholder[2]),
  ArtistModel(name: 'Aspy Band', imagePath: Assets.artistPlaceholder[3]),
  ArtistModel(name: 'Guardarraya', imagePath: Assets.artistPlaceholder[1]),
];
