// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

import '../api/api/AllApi.dart';
import '../modelo/modelo_generos.dart';

class GetGenerosProvider extends ChangeNotifier {
  List<Genero> generos = [];

  getGeneros() async {
    String url =
        '?api_key=3b84b1bf6c66d9c7d56d687517f7681d1f1ea499&format=json';
    print(AllApi.url + url);

    final resp = await AllApi.httpGet(url);
    print(resp);
    final Generos generos = Generos.fromlist(resp['results']);
    print(generos.dato[0].name);
    this.generos = generos.dato;
    notifyListeners();
  }
}
