enum GenreMusica {
  rock,
  pop,
  jazz,
  reggaeton,
  electronica,
  andino,
  indie,
  popPunk,
  metal,
  punk,
}

extension GenreMusicaExtension on GenreMusica {
  String get label {
    switch (this) {
      case GenreMusica.rock:
        return 'Rock';
      case GenreMusica.pop:
        return 'Pop';
      case GenreMusica.jazz:
        return 'Jazz';
      case GenreMusica.reggaeton:
        return 'Reggaetón';
      case GenreMusica.electronica:
        return 'Electrónica';
      case GenreMusica.andino:
        return 'Andino';
      case GenreMusica.indie:
        return 'Indie';
      case GenreMusica.popPunk:
        return 'Pop Punk';
      case GenreMusica.metal:
        return 'Metal';
      case GenreMusica.punk:
        return 'Punk';
    }
  }
}
