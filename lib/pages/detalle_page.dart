import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:movietest/modelo/modelo_peliculas.dart';
import 'package:provider/provider.dart';

import '../provider/get_peliculas_provider.dart';
import '../widgets/casting_card.dart';

class DetallePage extends StatefulWidget {
  const DetallePage({Key? key}) : super(key: key);

  @override
  State<DetallePage> createState() => _DetallePageState();
}

class _DetallePageState extends State<DetallePage> {
  @override
  void initState() {
    Provider.of<GetPeliculasProvider>(context, listen: false).getCreditos();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final peliculas =
        Provider.of<GetPeliculasProvider>(context).isSelectPelicula;
    final provider = Provider.of<GetPeliculasProvider>(context);

    print(peliculas.title);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _CustomAppBar(peliculas: peliculas),
          SliverList(
              delegate: SliverChildListDelegate([
            _PosterAndtitle(peliculas: peliculas),
            _Overview(peliculas: peliculas),
            CastingCard(
              actores: provider.actores,
            )
          ]))
        ],
      ),
    );
  }
}

class _CustomAppBar extends StatelessWidget {
  const _CustomAppBar({Key? key, required this.peliculas}) : super(key: key);

  final Pelicula peliculas;
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.indigo,
      expandedHeight: 190,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: const EdgeInsets.all(0),
        centerTitle: true,
        title: Container(
            color: Colors.black12,
            alignment: Alignment.bottomCenter,
            width: double.infinity,
            child: Text(
              peliculas.title!,
              style: TextStyle(fontSize: 16),
            )),
        background: FadeInImage(
          placeholder: AssetImage('img/loading.gif'),
          image: NetworkImage(peliculas.fullPosterImg),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _PosterAndtitle extends StatelessWidget {
  const _PosterAndtitle({Key? key, required this.peliculas}) : super(key: key);

  final Pelicula peliculas;
  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;

    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Hero(
            tag: peliculas.id!,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                placeholder: const AssetImage('img/no-image.jpg'),
                image: NetworkImage(peliculas.fullPosterImg),
                height: 150,
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ConstrainedBox(
                constraints: BoxConstraints(maxWidth: size.width * 0.55),
                child: Text(
                  peliculas.title!,
                  style: textTheme.headline5,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ),
              ConstrainedBox(
                constraints: BoxConstraints(maxWidth: size.width * 0.6),
                child: Text(
                  peliculas.originalTitle!,
                  style: textTheme.subtitle2,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ),
              Row(
                children: [
                  const Icon(
                    Icons.star_outline,
                    size: 15,
                    color: Colors.grey,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    peliculas.voteCount!,
                    style: textTheme.caption,
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

class _Overview extends StatelessWidget {
  const _Overview({Key? key, required this.peliculas}) : super(key: key);

  final Pelicula peliculas;
  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Text(
        peliculas.overview!,
        textAlign: TextAlign.justify,
        style: textTheme.subtitle1,
      ),
    );
  }
}
