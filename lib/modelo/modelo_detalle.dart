class Detalles {
  List<Detalle> dato = [];
  Detalles();

  Detalles.fromlist(List<dynamic> datos) {
    if (datos == null) return;

    for (var item in datos) {
      final detalle = Detalle.fromJsonMap(item);
      dato.add(detalle);
    }
  }
}

//description
class Detalle {
  int? id;
  String? name;
  String? img;
  String? urlDetalle;
  String? description;


  Detalle({
    this.id,
    this.name,
    this.img,
    this.urlDetalle,
    this.description,

  });

  Detalle.fromJsonMap(Map<String, dynamic> datos) {
    id = datos['id'];
    img = datos['image']['original_url'];
    name = datos['volume']['name'];
    
    description = datos['description'];
  print('aaaaaaaaa '+urlDetalle!);

  }
}
