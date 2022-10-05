import 'package:flutter/material.dart';
import 'package:movietest/provider/get_generos_provider.dart';
import 'package:provider/provider.dart';

import '../provider/get_peliculas_provider.dart';

class GenerosPages extends StatefulWidget {
  const GenerosPages({Key? key}) : super(key: key);

  @override
  State<GenerosPages> createState() => _GenerosPagesState();
}

class _GenerosPagesState extends State<GenerosPages> {
  @override
  void initState() {
    Provider.of<GetGenerosProvider>(context, listen: false).getGeneros();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final generos = Provider.of<GetGenerosProvider>(context).generos;
    List<Widget> itemMap = generos
        .map((e) => ListTile(
              onTap: () {
                final provider =
                    Provider.of<GetPeliculasProvider>(context, listen: false);
                provider.idGenero = e.id!;
               
                print(e.id);
                Navigator.pushNamed(context, 'HomePage');
              },
              title: Text(e.name!),
            ))
        .toList();
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(title: const Text('Generos')),
      body: ListView(
        children: [...itemMap],
      ),
    ));
  }
}
