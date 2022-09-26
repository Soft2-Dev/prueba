import 'package:flutter/material.dart';

import '../modelo/modelo_actores.dart';

class CastingCard extends StatelessWidget {
  CastingCard({Key? key, required this.actores}) : super(key: key);
  List<Actor> actores = [];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      margin: const EdgeInsets.only(bottom: 30),
      width: double.infinity,
      height: size.height * 0.3,
      child: SizedBox(
        height: size.height * 0.2,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: actores.length,
            itemBuilder: (context, index) {
              return _MoviePoster(actor: actores[index]);
            }),
      ),
    );
  }
}

class _MoviePoster extends StatelessWidget {
  const _MoviePoster({
    Key? key,
    required this.actor,
  }) : super(key: key);

  final Actor actor;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: 100,
      height: 100,
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        children: [
          GestureDetector(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                placeholder: AssetImage('img/no-image.jpg'),
                image: NetworkImage(actor.fullPosterImg),
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
            actor.name!,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.left,
          )
        ],
      ),
    );
  }
}
