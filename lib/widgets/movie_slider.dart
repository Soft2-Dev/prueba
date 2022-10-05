import 'package:flutter/material.dart';
import 'package:movietest/modelo/modelo_generos.dart';
import 'package:provider/provider.dart';


import '../provider/get_peliculas_provider.dart';

class MovieSlider extends StatelessWidget {
  const MovieSlider({Key? key, required this.generos, required this.name})
      : super(key: key);

  final List<Genero> generos;
  final String name;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      width: double.infinity,
      height: size.height * 0.35,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              name,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
            ),
          ),
          Expanded(
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: generos.length,
                itemBuilder: (context, index) =>
                    _MoviePoster(peliculas: generos[index])),
          )
        ],
      ),
    );
  }
}

class _MoviePoster extends StatelessWidget {
  const _MoviePoster({
    Key? key,
    required this.peliculas,
  }) : super(key: key);
  final Genero peliculas;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              final provider =
                  Provider.of<GetPeliculasProvider>(context, listen: false);
              provider.isSelectGenero = peliculas;
              Navigator.pushNamed(context, 'DetallePage');
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                placeholder: const AssetImage('img/no-image.jpg'),
                image: NetworkImage(peliculas.img!),
                // width: 130,
                // height: 190,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            peliculas.name!,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.left,
          )
        ],
      ),
    );
  }
}
