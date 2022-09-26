// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

import '../api/api/AllApi.dart';
import '../modelo/modelo_generos.dart';

class GetGenerosProvider extends ChangeNotifier {
  List<Genero> generos = [];

  getGeneros() async {
    String url =
        'genre/movie/list?api_key=73a82f66dd9b489f8449fb8e9dd6f17e&language=es-ES';
    print(AllApi.url + url);

    final resp = await AllApi.httpGet(url);
    final Generos generos = Generos.fromlist(resp['genres']);
    print(generos.dato[0].name);
    this.generos = generos.dato;
    notifyListeners();
  }
}
