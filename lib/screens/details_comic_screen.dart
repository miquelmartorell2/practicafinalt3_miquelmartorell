import 'package:flutter/material.dart';
import 'package:practicafinalt3_miquelmartorell/models/comics.dart';

/**
 * Clase DetailsCharacterScreen encargegada de mostrar els detalls dels comics seleccionat, pimer de tot 
 * introdueix dins una varaible d'objecte Comic el comic rebut per argument de la pagina anterior,
 * una vegada rebut, primer de tot retorna un scaffold amb una appbar amb el titol del comic rebut, seguidament dins el body
 * primer de tot de mostren les classes _CustomAppBar, _PosterAndTitle, _Text i _Overview que son les encarregades de mostrar el 
 * contingut
 */
class DetailsComicScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Comic comic = ModalRoute.of(context)?.settings.arguments as Comic;

    return Scaffold(
      appBar: AppBar(
        title: Text(comic.title),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _CustomAppBar(comic: comic),
          Expanded(
            child: ListView(
              children: [
                _PosterAndTitle(comic: comic),
                _Text(),
                _Overview(comic: comic),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/**
 * Classe _CustomAppBar es una classe que rep el comic per paramete, on es crea un container on s'introdueix la imatge del
 * comic i seguidament amb un center el seu nom
 */
class _CustomAppBar extends StatelessWidget {
  final Comic comic;

  const _CustomAppBar({Key? key, required this.comic}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(comic.fullPosterPath),
          fit: BoxFit.cover,
        ),
      ),
      child: Center(
        child: Text(
          comic.title,
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
      ),
    );
  }
}


/**
 * Classe _PosterAndTitle que rep per parametre el comic, aquesta clase s'encarrega de mostrar la imatge dinsun requadre petit i just a la 
 * dreta el seu nom.
 */
class _PosterAndTitle extends StatelessWidget {
  final Comic comic;

  const _PosterAndTitle({Key? key, required this.comic}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              comic.fullPosterPath,
              height: 150,
              width: 100,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Text(
              comic.title,
              style: TextStyle(fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}

/**
 * Classe _Overview encarregada de mostar el llistat de creadors del comic, ho fa a partir de l'objecte rebut
 * amb un ListTitle
 */
class _Overview extends StatelessWidget {
  final Comic comic;

  const _Overview({Key? key, required this.comic}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: comic.creators.items.map((creators) {
          return ListTile(
            title: Text(creators.name),
          );
        }).toList(),
      ),
    );
  }
}

/**
 * Classe _Text encarregada de mostrar el texte "Creadores"
 */
class _Text extends StatelessWidget {
  

  const _Text({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Creadores: ", style: TextStyle(fontSize: 30),)
        ]
      ),
    );
  }
}
