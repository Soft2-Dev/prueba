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
  String? img;
  String? urlDetalle;


  Genero({
    this.id,
    this.name,
    this.img,
    this.urlDetalle,

  });

  Genero.fromJsonMap(Map<String, dynamic> datos) {
    id = datos['id'];
    img = datos['image']['original_url'];
    name = datos['volume']['name'];
    urlDetalle = datos['api_detail_url'];
  print('aaaaaaaaa '+urlDetalle!);

  }
}
