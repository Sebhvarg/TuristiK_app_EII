import 'package:turistik/data/models/artist_musical_model.dart';
import 'package:turistik/data/models/artist_teatral_model.dart';
import 'package:turistik/data/models/event_musical_model.dart';

import 'models/profile_model.dart';
import '../core/constants/assets.dart';
import './enum/genre_musical.dart';
import './enum/genre_teatro.dart';
import 'models/event_teatral_model.dart';

final List<TeatralEventModel> teatroEvents = [
  TeatralEventModel(
    title: 'Las Pájaros',
    date: '25/Jul/2025',
    hour: '19:00',
    location: 'Espacio Muégano Teatro',
    imagePath: Assets.eventPlaceholder[1],
    description:
        'Las pájaros es una obra teatral surrealista del género de la tragicomedia que tiene un trasfondo de denuncia hacia el poder social y político...',
    isFree: false,
    price: 10.0,
    teatroType: 'Tragicomedia',
    artistNames: ['Las Pájaros'],
    artistId: ['las_pajaros_id'],
    director: 'Karla Guin',
  ),
  TeatralEventModel(
    title: 'El Autómata',
    date: '20/Ago/2025',
    hour: '18:00',
    location: 'Mz 14 Universidad de las Artes',
    imagePath: Assets.eventPlaceholder[0],
    description:
        'Es una obra contemporánea que rompe con la idea de presentar una historia...',
    isFree: true,
    price: null,
    teatroType: 'Teatro Contemporáneo',
    artistNames: ['Laboratorio LEUA'],
    artistId: ['leua_id'],
    director: 'Geovanny Chávez',
  ),
  TeatralEventModel(
    title: 'WY A KILL',
    date: '15/Sep/2025',
    hour: '20:00',
    location: 'Teatro Centro de Arte',
    imagePath: Assets.eventPlaceholder[2],
    description: 'WY A KILL, o de cómo las iguanas aprendieron a sobrevivir.',
    isFree: false,
    price: 10.0,
    teatroType: 'Teatro Comercial',
    artistNames: ['Laboratorio LEUA'],
    artistId: ['leua_id'],
    director: 'Benjamín Cortés Tapia',
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
        'Un concierto en vivo de las bandas de Pop-Punk, Rock y Metal más destacadas...',
    isFree: false,
    price: 6.0,
    musicalType: [
      GenreMusica.popPunk,
      GenreMusica.rock,
      GenreMusica.metal,
    ].map((e) => e.label).join(' - '),
    artistNames: [
      'That Day',
      'Otro Desafío',
      'Sesos',
      'Reasons to Return',
      'Última Vez',
    ],
    artistId: [
      'that_day_id',
      'otro_desafio_id',
      'sesos_id',
      'reasons_return_id',
      'ultima_vez_id',
    ],
  ),
  MusicalEventModel(
    title: 'Guardarraya - Me Fui A Volver',
    date: '30/jul/2025',
    hour: '19:00',
    location: 'Teatro Centro de Arte',
    imagePath: Assets.conciertoPlaceholder[1],
    description:
        'Un concierto en vivo de la banda Guardarraya, presentando su nuevo álbum...',
    isFree: true,
    price: null,
    spotifyUrl: 'https://open.spotify.com/artist/3sNOF9nA2nq8c2j8c2j8c2',
    musicalType: [
      GenreMusica.andino,
      GenreMusica.indie,
    ].map((e) => e.label).join(' - '),
    artistNames: ['Guardarraya'],
    artistId: ['guardarraya_id'],
  ),
];

final List<MusicalArtistModel> artistsmusical = [
  MusicalArtistModel(
    id: 'that_day_id',
    name: 'That Day',
    imagePath: Assets.artistPlaceholder[0],
    description:
        'Grupo formado en Guayaquil/Ecuador, en el año 2017. Sus cuatro integrantes: Nahin Naranjo (guitarrista), Ariel Reyes (baterista), Joe Haner (bajista) y Miguel Ash (vocalista/guitarrista) apuestan por un sonido melancólico y energético a la vez, siendo estas a raíz del pop/punk/rock. Viéndose influenciado por bandas como Blink-182, Sum-41  y PXNDX, llevan a cabo el proyecto That Day, lanzando su primer sencillo Verano.',
    musicalType: 'Banda de Música',
    genres: [GenreMusica.popPunk, GenreMusica.rock],
    spotifyUrl:
        'https://open.spotify.com/artist/1wc3fmOxTvj3AxBBxgHuio?si=LUR29J6iRxWd_pcXDTHpXQ',
  ),
  MusicalArtistModel(
    id: 'escarlatas_band_id',
    name: 'Escarlatas Band',
    imagePath: Assets.artistPlaceholder[2],
    description:
        'Banda de rock alternativo, indie, de 4 chicas, formada en la ciudad de Guayaquil. ',
    musicalType: 'Banda de Música',
    genres: [GenreMusica.rock],
    spotifyUrl:
        'https://soundcloud.com/jona-cedeno/rocking-around-the-christmas-tree-escarlatas-version?ref=clipboard&p=i&c=1&si=BD5C76BCEAFF4EEDB614A37A7344BC39&utm_source=clipboard&utm_medium=text&utm_campaign=social_sharing',
  ),
  MusicalArtistModel(
    id: 'guardarraya_id',
    name: 'Guardarraya',
    imagePath: Assets.artistPlaceholder[1],
    description:
        'Banda de música andina con influencias indie, originaria de Guayaquil.',
    musicalType: 'Banda de Música',
    genres: [GenreMusica.andino, GenreMusica.indie],
    spotifyUrl:
        'https://open.spotify.com/artist/2g2c4BKYVzU5nKD326EbXR?si=isasdugZSJ6zGMuvm1N-gA',
  ),
  MusicalArtistModel(
    id: 'reasons_return_id',
    name: 'Reasons to Return',
    imagePath: Assets.artistPlaceholder[4],
    description:
        'Banda de Hardcore Metal band from Guayaquil, Ecuador. Southamerica. Currently working on the 2nd album',
    musicalType: 'Banda de Música',
    genres: [GenreMusica.popPunk],
    spotifyUrl:
        'https://open.spotify.com/artist/2jPUXmDNL00FtXgiiWuBsr?si=LfUWVaDPT42TVNl_JZJFcw',
  ),
  MusicalArtistModel(
    id: 'ultima_vez_id',
    name: 'Última Vez',
    imagePath: Assets.artistPlaceholder[5],
    description:
        'Banda de Post Hardcore/Hardcore melódico de la ciudad de Guayaquil - Ecuador',
    musicalType: 'Banda de Música',
    genres: [GenreMusica.metal, GenreMusica.punk],
    spotifyUrl: 'https://www.youtube.com/c/%C3%9AltimaVezOfficial',
  ),
  MusicalArtistModel(
    id: 'otro_desafio_id',
    name: 'Otro Desafío',
    imagePath: Assets.artistPlaceholder[6],
    description:
        'Desde el corazón de Guayaquil, Otro Desafío emerge como una banda de rock que canaliza la energía de la ciudad y la transforma en música poderosa. Con un sonido que fusiona influencias del Metalcore y el Nu metal , la banda se ha convertido en una propuesta fresca dentro de la escena ecuatoriana.',
    musicalType: 'Banda de Música',
    genres: [GenreMusica.rock, GenreMusica.metal],
    spotifyUrl:
        'https://open.spotify.com/artist/2XFxqFzNic0Uah47oXs9hi?si=8ubovOtcRbWK34Ab2cgAeg',
  ),
  MusicalArtistModel(
    id: 'sesos_id',
    name: 'Sesos',
    imagePath: Assets.artistPlaceholder[7],
    description:
        'Pop punk/Emo/Post Hardcore band. Midwest Emo Ecuador. Descubre nuestra música en todas las plataformas.',
    musicalType: 'Banda de Música',
    genres: [GenreMusica.popPunk, GenreMusica.punk],
    spotifyUrl:
        'https://open.spotify.com/artist/6jTgQ7zieIAcI59w0UVuDx?si=mMS1XLlHQpiYtdYvKjrF3g',
  ),
];

final List<TeatralArtistModel> artistsTeatral = [
  TeatralArtistModel(
    id: 'las_pajaros_id',
    name: 'Las Pájaros',
    imagePath: Assets.artistTeatro[0],
    description:
        'Grupo emergente Independiente del Teatro de Guayaquil que trabaja con los géneros de la tragicomedia y la farsa.',
    teatroType:
        'Teatro del absurdo - Teatro expresionista - Teatro subrealista',
    genres: [GenreTeatro.tragicomedia, GenreTeatro.farsa],
  ),
  TeatralArtistModel(
    id: 'leua_id',
    name: 'Laboratorio LEUA',
    imagePath: Assets.artistTeatro[1],
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
