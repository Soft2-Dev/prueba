import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:movietest/modelo/modelo_peliculas.dart';
import 'package:provider/provider.dart';

import '../provider/get_peliculas_provider.dart';

class CardSwiper extends StatelessWidget {
  const CardSwiper({Key? key, required this.peliculas}) : super(key: key);

  final List<Pelicula> peliculas;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      height: size.height * 0.5,
      child: Swiper(
        itemCount: peliculas.length,
        layout: SwiperLayout.STACK,
        itemWidth: size.width * 0.6,
        itemHeight: size.height * 0.4,
        itemBuilder: (context, index) {
          final moviePaht = peliculas[index];

          return GestureDetector(
            onTap: () {
              final provider =
                  Provider.of<GetPeliculasProvider>(context, listen: false);
              provider.isSelectPelicula = peliculas[index];
              Navigator.pushNamed(context, 'DetallePage');
            },
            child: Hero(
              tag: moviePaht.id!,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: FadeInImage(
                    fit: BoxFit.cover,
                    placeholder: AssetImage('img/no-image.jpg'),
                    image: NetworkImage(moviePaht.fullPosterImg)),
              ),
            ),
          );
        },
      ),
    );
  }
}
