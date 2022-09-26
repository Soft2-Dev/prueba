class Actores {
  List<Actor> dato = [];
  Actores();

  Actores.fromlist(List<dynamic> datos) {
    if (datos == null) return;

    for (var item in datos) {
      final detalle = Actor.fromJsonMap(item);
      dato.add(detalle);
    }
  }
}

class Actor {
  bool? adult;
  String? gender;
  String? id;
  String? knownForDepartment;
  String? name;
  String? originalName;
  String? popularity;
  String? posterPath;
  String? castId;
  String? creditId;
  String? order;

  get fullPosterImg {
    if (posterPath != null) {
      return 'https://image.tmdb.org/t/p/w500$posterPath';
    } else {
      return 'https://i.stack.imgur.com/GNhxO.png';
    }
  }

  Actor({
    this.adult,
    this.gender,
    this.id,
    this.knownForDepartment,
    this.name,
    this.originalName,
    this.popularity,
    this.posterPath,
    this.castId,
    this.creditId,
    this.order,
  });

  Actor.fromJsonMap(Map<String, dynamic> datos) {
    adult = datos['adult'];
    gender = datos['gender'].toString();
    id = datos['id'].toString();
    knownForDepartment = datos['known_for_department'].toString();
    name = datos['name'];
    originalName = datos['original_name'];
    popularity = datos['popularity'].toString();
    posterPath = datos['profile_path'];
    castId = datos['cast_id'].toString();
    creditId = datos['credit_id'].toString();
    order = datos['order'].toString();
  }
}
