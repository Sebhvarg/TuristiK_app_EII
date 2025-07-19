import 'package:turistik/data/models/artist_musical_model.dart';
import 'package:turistik/data/models/artist_teatral_model.dart';
import 'package:turistik/data/models/event_musical_model.dart';

import 'models/event_model.dart';
import 'models/artist_model.dart';
import 'models/profile_model.dart';
import '../core/constants/assets.dart';
import './enum/genre_musical.dart';
import './enum/genre_teatro.dart';
import 'models/event_teatral_model.dart';

final List<EventModel> teatroEvents = [
  TeatralEventModel(
    title: 'Las Pájaros',
    date: '25/Jul/2025',
    hour: '19:00',
    location: 'Espacio Muégano Teatro',
    imagePath: Assets.eventPlaceholder[0],
    description:
        'Una obra de teatro que explora la vida de un grupo de mujeres en un mundo lleno de absurdos y situaciones cómicas.',
    isFree: false,
    price: 10.0,
    teatroType: 'Tragicomedia',
    artistNames: ['Las Pájaros'],
    director: 'Karla Guin',
  ),
  TeatralEventModel(
    title: 'Hamlet',
    date: '20/Ago/2025',
    hour: '18:00',
    location: 'Teatro Nacional',
    imagePath: Assets.eventPlaceholder[1],
    description:
        'Una representación clásica de la obra maestra de Shakespeare, "Hamlet", con un enfoque contemporáneo.',
    isFree: true,
    price: null,
    teatroType: 'Drama',
    artistNames: ['Compañía Dramática ABC'],
    director: 'María López',
  ),
];

final List<MusicalEventModel> concerts = [
  MusicalEventModel(
    title: 'Nada que perder Fest',
    date: '09/Ago/2025',
    hour: '20:30',
    location: 'Red Black Bar',
    imagePath: Assets.conciertoPlaceholder[0],
    description:
        'Un concierto en vivo de la bandas de Pop-Punk, Rock y Metal más destacadas de la escena local.',
    isFree: false,
    price: 6.0,
    musicalType: '${GenreMusica.rock} - ${GenreMusica.popPunk}',
    artistNames: [
      'That Day',
      'Otro Desafío',
      'Sesos',
      'Reasons Return',
      'Última Vez',
    ],
  ),
  MusicalEventModel(
    title: 'Guardarraya - Me Fui A Volver',
    date: '30/jul/2025',
    hour: '19:00',
    location: 'Teatro Centro de Arte',
    imagePath: Assets.eventPlaceholder[1],
    description:
        'Un concierto en vivo de la banda Guardarraya, presentando su nuevo álbum "Me Fui A Volver".',
    isFree: true,
    price: null,
    spotifyUrl: 'https://open.spotify.com/artist/3sNOF9nA2nq8c2j8c2j8c2',
    musicalType: "${GenreMusica.andino} - ${GenreMusica.indie}",
    artistNames: ['Guardarraya'],
  ),
];

final List<MusicalArtistModel> artistsmusical = [
  MusicalArtistModel(
    id: '1',
    name: 'That Day',
    imagePath: Assets.artistPlaceholder[0],
    description: 'Banda de música andina con influencias indie.',
    musicalType: '${GenreMusica.andino} - ${GenreMusica.indie}',
    genres: [GenreMusica.andino, GenreMusica.indie],
    spotifyUrl: 'https://open.spotify.com/artist/3sNOF9nA2nq8c2j8c2j8c2',
  ),
  MusicalArtistModel(
    id: '2',
    name: 'Reasons Return',
    imagePath: Assets.artistPlaceholder[1],
    description: 'Banda de rock alternativo con letras profundas.',
    musicalType: GenreMusica.rock.toString(),
    genres: [GenreMusica.rock],
  ),
];
final List<TeatralArtistModel> artistsTeatral = [
  TeatralArtistModel(
    id: '1',
    name: 'Las Pájaros',
    imagePath: Assets.artistPlaceholder[2],
    description:
        'Grupo emergente Independiente del Teatro de Guayaquil que trabaja con los géneros de la tragicomedia y la farsa.',
    teatroType:
        'Teatro del absurdo - Teatro expresionista - Teatro subrealista',
    genres: [GenreTeatro.tragicomedia, GenreTeatro.farsa],
  ),
  TeatralArtistModel(
    id: '2',
    name: 'Laboratorio LEUA',
    imagePath: Assets.artistPlaceholder[3],
    description:
        'Laboratorio escénico de la Universidad de las Artes es un grupo de estudiantes que trabajan con el género de la comedia y la tragicomedia.',
    teatroType: 'Teatro del absurdo - Teatro épico',
    genres: [
      GenreTeatro.absurdo,
      GenreTeatro.comedia,
      GenreTeatro.tragicomedia,
    ],
  ),
];

final ProfileModel userProfile = ProfileModel(
  name: 'Felipe Brooks',
  email: 'johncena@espol.edu.ec',
  phoneNumber: '096 123 5556',
  profilePictureUrl: Assets.profilePlaceholder,
);
