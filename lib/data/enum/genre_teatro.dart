// ignore: file_names
enum GenreTeatro { comedia, tragicomedia, opera, drama, absurdo, farsa }

extension GenreTeatroExtension on GenreTeatro {
  String get label {
    switch (this) {
      case GenreTeatro.comedia:
        return 'Comedia';
      case GenreTeatro.tragicomedia:
        return 'Tragicomedia';
      case GenreTeatro.opera:
        return 'Ópera';
      case GenreTeatro.drama:
        return 'Drama';
      case GenreTeatro.absurdo:
        return 'Teatro del absurdo';
      case GenreTeatro.farsa:
        return 'Farsa';
    }
  }
}
