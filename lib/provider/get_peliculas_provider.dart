// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

import '../api/api/AllApi.dart';
import '../modelo/modelo_actores.dart';
import '../modelo/modelo_peliculas.dart';

class GetPeliculasProvider extends ChangeNotifier {
  List<Pelicula> peliculas = [];
  List<Pelicula> peliculasXGeneros = [];
  List<Pelicula> proximosExtrenos = [];
  List<Pelicula> pupulares = [];
  List<Actor> actores = [];

  late Pelicula isSelectPelicula;
  late int idGenero;
  late String name;

  getPeliculas() async {
    peliculasXGeneros = [];
    String url =
        'movie/now_playing?api_key=73a82f66dd9b489f8449fb8e9dd6f17e&language=es-ES&page=1';
    print(AllApi.url + url);

    final resp = await AllApi.httpGet(url);
    final Peliculas peliculas = Peliculas.fromlist(resp['results']);
    print(peliculas.dato[0].posterPath);

    this.peliculas = peliculas.dato;
    clasifica();
    getPeliculasProximos();
    getPeliculasPopulares();
    notifyListeners();
  }

  getPeliculasProximos() async {
    String url =
        'movie/upcoming?api_key=73a82f66dd9b489f8449fb8e9dd6f17e&language=es-ES&page=1';
    print(AllApi.url + url);

    final resp = await AllApi.httpGet(url);
    final Peliculas proximosExtrenos = Peliculas.fromlist(resp['results']);

    this.proximosExtrenos = proximosExtrenos.dato;
    notifyListeners();
  }

  getPeliculasPopulares() async {
    String url =
        'movie/popular?api_key=73a82f66dd9b489f8449fb8e9dd6f17e&language=es-ES&page=1';
    print(AllApi.url + url);

    final resp = await AllApi.httpGet(url);
    final Peliculas pupulares = Peliculas.fromlist(resp['results']);

    this.pupulares = pupulares.dato;
    notifyListeners();
  }

  getCreditos() async {
    final String idmovie = isSelectPelicula.id!;
    String url =
        'movie/$idmovie/credits?api_key=73a82f66dd9b489f8449fb8e9dd6f17e&language=es-ES';
    print(AllApi.url + url);

    final resp = await AllApi.httpGet(url);
    final Actores actores = Actores.fromlist(resp['cast']);

    this.actores = actores.dato;
    notifyListeners();
  }

  clasifica() {
    for (var i = 0; i < peliculas.length; i++) {
      if (peliculas[i].genreIds!.any((item) => item == idGenero)) {
        peliculasXGeneros.add(peliculas[i]);
      }
    }
  }
}
