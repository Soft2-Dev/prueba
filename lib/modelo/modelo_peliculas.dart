class Peliculas {
  List<Pelicula> dato = [];
  Peliculas();

  Peliculas.fromlist(List<dynamic> datos) {
    if (datos == null) return;

    for (var item in datos) {
      final detalle = Pelicula.fromJsonMap(item);
      dato.add(detalle);
    }
  }
}

class Pelicula {
  bool? adult;
  String? backdropPath;
  List? genreIds;
  String? id;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  double? popularity;
  String? posterPath;
  String? releaseDate;
  String? title;
  bool? video;
  String? voteAverage;
  String? voteCount;

  get fullPosterImg {
    if (posterPath != null) {
      return 'https://image.tmdb.org/t/p/w500$posterPath';
    } else {
      return 'https://i.stack.imgur.com/GNhxO.png';
    }
  }

  Pelicula({
    this.adult,
    this.backdropPath,
    this.genreIds,
    this.id,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.releaseDate,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
  });

  Pelicula.fromJsonMap(Map<String, dynamic> datos) {
    adult = datos['adult'];
    backdropPath = datos['backdrop_path'];
    genreIds = datos['genre_ids'];
    id = datos['id'].toString();
    originalLanguage = datos['original_language'];
    originalTitle = datos['original_title'];
    overview = datos['overview'];
    popularity = datos['popularity'];
    posterPath = datos['poster_path'];
    releaseDate = datos['release_date'];
    title = datos['title'];
    video = datos['video'];
    voteAverage = datos['vote_average'].toString();
    voteCount = datos['vote_count'].toString();
  }
}
