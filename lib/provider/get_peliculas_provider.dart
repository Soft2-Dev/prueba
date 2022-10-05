// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

import '../api/api/AllApi.dart';
import '../modelo/modelo_actores.dart';
import '../modelo/modelo_detalle.dart';
import '../modelo/modelo_generos.dart';


class GetPeliculasProvider extends ChangeNotifier {
  List<Genero> generos = [];
  List<Genero> peliculasXGeneros = [];
  List<Genero> proximosExtrenos = [];
  List<Genero> pupulares = [];
  List<Detalle> detalle = [];
  List<Actor> actores = [];

  late Genero isSelectGenero;
  late int idGenero;
   String descrip ='';
  
  
    getGeneros() async {
    String url =
        '?api_key=3b84b1bf6c66d9c7d56d687517f7681d1f1ea499&format=json';
    print(AllApi.url + url);

    final resp = await AllApi.httpGet(url);
    print(resp['results']);
    final Generos generos = Generos.fromlist(resp['results']);
    print(generos.dato[0].name);
    this.generos = generos.dato;
    notifyListeners();
  }

   getdetalles() async {
    String id=isSelectGenero.urlDetalle!;
    String url =
        '$id?api_key=3b84b1bf6c66d9c7d56d687517f7681d1f1ea499&format=json';
    print(AllApi.url + url);

    final resp = await AllApi.httpGet(url);
    if (resp['results']['description']!=null) {
      
    descrip=resp['results']['description'];
    }
    print(resp['results']['description']);
  
    notifyListeners();
  }


}
