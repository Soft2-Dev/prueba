import 'package:flutter/material.dart';
import 'package:movietest/widgets/movie_slider.dart';
import 'package:provider/provider.dart';

import '../provider/get_peliculas_provider.dart';
import '../widgets/card_swiper.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    Provider.of<GetPeliculasProvider>(context, listen: false).getGeneros();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final generos = Provider.of<GetPeliculasProvider>(context);

    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView(children: [
        CardSwiper(genero: generos.generos),
        MovieSlider(
            generos: generos.generos, name: 'General'),
        const Divider(height: 30),
        MovieSlider(generos: generos.generos, name: 'Populares'),
        const Divider(height: 30),
        MovieSlider(
            generos: generos.generos, name: 'Proximos Extrenos'),
      ]),
    ));
  }
}
