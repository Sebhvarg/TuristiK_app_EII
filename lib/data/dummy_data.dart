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
  ArtistModel(
    name: 'That Day',
    imagePath: Assets.artistPlaceholder[0],
    description:
        'Grupo formado en Guayaquil/Ecuador, en el año 2017. Sus cuatro integrantes: Nahin Naranjo (guitarrista), Ariel Reyes (baterista), Joe Haner (bajista) y Miguel Ash (vocalista/guitarrista) apuestan por un sonido melancólico y energético a la vez, siendo estas a raíz del pop/punk/rock. Viéndose influenciado por bandas como Blink 182, Sum 41 y PXNDX, llevan a cabo el proyecto That Day, lanzando su primer sencillo Verano.',
    genre: 'Rock - Punk',
    spotifyUrl:
        'https://open.spotify.com/artist/1wc3fmOxTvj3AxBBxgHuio?si=yuh186NJReK0y0axI76bmQ',
    nextEventDate: '2025-08-09',
    socialLinks: [
      'https://www.facebook.com/thatday',
      'https://www.instagram.com/thatday',
    ],
  ),
  ArtistModel(
    name: 'Escarlatas Band',
    imagePath: Assets.artistPlaceholder[2],
    description: 'Banda de rock en español.',
    genre: 'Rock en Español',
    spotifyUrl: 'https://open.spotify.com/artist/1sNOF9nA2nq8c2j8c2j8c2',
    nextEventDate: '2025-07-15',
    socialLinks: [
      'https://www.facebook.com/escarlatasband',
      'https://www.instagram.com/escarlatasband',
    ],
  ),
  ArtistModel(
    name: 'Aspy Band',
    imagePath: Assets.artistPlaceholder[3],
    description: 'Banda de metal progresivo.',
    genre: 'Metal Progresivo',
    spotifyUrl: 'https://open.spotify.com/artist/2sNOF9nA2nq8c2j8c2j8c2',
    nextEventDate: '2025-08-20',
    socialLinks: [
      'https://www.facebook.com/aspyband',
      'https://www.instagram.com/aspyband',
    ],
  ),
  ArtistModel(
    name: 'Guardarraya',
    imagePath: Assets.artistPlaceholder[1],
    description: 'Banda de música fusión.',
    genre: 'Fusión',
    spotifyUrl: 'https://open.spotify.com/artist/3sNOF9nA2nq8c2j8c2j8c2',
    nextEventDate: '2025-07-30',
    socialLinks: [
      'https://www.facebook.com/guardarraya',
      'https://www.instagram.com/guardarraya',
    ],
  ),
];
