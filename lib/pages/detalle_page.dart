import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:movietest/modelo/modelo_detalle.dart';

import 'package:provider/provider.dart';

import '../modelo/modelo_generos.dart';
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
  Provider.of<GetPeliculasProvider>(context, listen: false).getdetalles();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final peliculas =
        Provider.of<GetPeliculasProvider>(context).isSelectGenero;
    final descrip = Provider.of<GetPeliculasProvider>(context).descrip;

    print(peliculas.name);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _CustomAppBar(detalle: peliculas),
          SliverList(
              delegate: SliverChildListDelegate([
            _PosterAndtitle(peliculas: peliculas),
            _Overview(descrip: descrip),
           
          ]))
        ],
      ),
    );
  }
}

class _CustomAppBar extends StatelessWidget {
  const _CustomAppBar({Key? key, required this.detalle}) : super(key: key);

  final Genero detalle;
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
              detalle.name!,
              style: TextStyle(fontSize: 16),
            )),
        background: FadeInImage(
          placeholder: AssetImage('img/loading.gif'),
          image: NetworkImage(detalle.img!),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _PosterAndtitle extends StatelessWidget {
  const _PosterAndtitle({Key? key, required this.peliculas}) : super(key: key);

  final Genero peliculas;
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
                image: NetworkImage(peliculas.img!),
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
                  peliculas.name!,
                  style: textTheme.headline5,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ),
              ConstrainedBox(
                constraints: BoxConstraints(maxWidth: size.width * 0.6),
                child: Text(
                  peliculas.name!,
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
                    peliculas.name!,
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
  const _Overview({Key? key, required this.descrip}) : super(key: key);

  final String descrip;
  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Text(
        descrip,
        textAlign: TextAlign.justify,
        style: textTheme.subtitle1,
      ),
    );
  }
}
