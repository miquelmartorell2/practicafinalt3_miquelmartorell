import 'package:flutter/material.dart';
import 'package:practicafinalt3_miquelmartorell/models/models.dart';

/**
 * Clase DetailsCharacterScreen encargegada de mostrar els detalls dels personatge seleccionat, pimer de tot 
 * introdueix dins una varaible d'objecte Character el personatge rebut per argument de la pagina anterior,
 * una vegada rebut, primer de tot retorna un scaffola amb una appbar amb el nom del personatge rebut, seguidament dins el body
 * primer de tot de mostren les classes _CustomAppBar, _PosterAndTitle, _Text i _Overview que son les encarregades de mostrar el 
 * contingut
 */
class DetailsCharacterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Character character =
        ModalRoute.of(context)?.settings.arguments as Character;

    return Scaffold(
      appBar: AppBar(
        title: Text(character.name),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _CustomAppBar(character: character),
          Expanded(
            child: ListView(
              children: [
                _PosterAndTitle(character: character),
                _Text(),
                _Overview(character: character),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/**
 * Classe _CustomAppBar es una classe que rep el personatge per paramete, on es crea un container on s'introdueix la imatge del
 * personatge i seguidament amb un center el seu nom
 */
class _CustomAppBar extends StatelessWidget {
  final Character character;

  const _CustomAppBar({Key? key, required this.character}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(character.fullPosterPath),
          fit: BoxFit.cover,
        ),
      ),
      child: Center(
        child: Text(
          character.name,
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
      ),
    );
  }
}


/**
 * Classe _PosterAndTitle que rep per parametre el personatge, aquesta clase s'encarrega de mostrar la imatge dinsun requadre petit i just a la 
 * dreta el seu nom.
 */
class _PosterAndTitle extends StatelessWidget {
  final Character character;

  const _PosterAndTitle({Key? key, required this.character}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              character.fullPosterPath,
              height: 150,
              width: 100,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Text(
              character.name,
              style: TextStyle(fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}

/**
 * Classe _Overview encarregada de mostar el llistat de comincs en els que apareix el personatge, ho fa a partir de l'objecte rebut
 * amb un ListTitle
 */
class _Overview extends StatelessWidget {
  final Character character;

  const _Overview({Key? key, required this.character}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: character.comics.items.map((comic) {
          return ListTile(
            title: Text(comic.name),
          );
        }).toList(),
      ),
    );
  }
}

/**
 * Classe _Text encarregada de mostrar el texte "Comics en los que aparece"
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
          Text("Comics en los que aparece: ", style: TextStyle(fontSize: 30),)
        ]
      ),
    );
  }
}
