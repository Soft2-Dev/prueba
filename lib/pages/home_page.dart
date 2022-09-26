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
    Provider.of<GetPeliculasProvider>(context, listen: false).getPeliculas();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final peliculas = Provider.of<GetPeliculasProvider>(context);

    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text(peliculas.name),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView(children: [
        CardSwiper(peliculas: peliculas.peliculasXGeneros),
        MovieSlider(
            peliculas: peliculas.peliculasXGeneros, name: peliculas.name),
        const Divider(height: 30),
        MovieSlider(peliculas: peliculas.pupulares, name: 'Populares'),
        const Divider(height: 30),
        MovieSlider(
            peliculas: peliculas.proximosExtrenos, name: 'Proximos Extrenos'),
      ]),
    ));
  }
}
