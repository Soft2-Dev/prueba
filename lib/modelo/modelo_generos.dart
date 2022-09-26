class Generos {
  List<Genero> dato = [];
  Generos();

  Generos.fromlist(List<dynamic> datos) {
    if (datos == null) return;

    for (var item in datos) {
      final detalle = Genero.fromJsonMap(item);
      dato.add(detalle);
    }
  }
}

class Genero {
  int? id;
  String? name;

  Genero({
    this.id,
    this.name,
  });

  Genero.fromJsonMap(Map<String, dynamic> datos) {
    id = datos['id'];
    name = datos['name'];
  }
}
