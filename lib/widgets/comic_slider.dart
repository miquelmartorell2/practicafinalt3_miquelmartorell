import 'package:flutter/material.dart';
import 'package:practicafinalt3_miquelmartorell/models/comics.dart';

/**
 * Classe ComicSlider encarregada de mostrar els comics a slider a la part inferir de la pantalla
 * primer de tot es crea el contructro amb una llista de comics. Sefuidament es comrpova si la llista
 * esta buida, si esta buida mostra un cerce carregant, sino retorna un contaimer on primer de tot es posa un camp de
 * texte amb el texte 'comics' is eguidament amb un ListView.Bilder per cada comic cirada
 * la classe ComicPoster encarregada de mostrar la imatge
 */
class ComicSlider extends StatelessWidget {
  final List<Comic> comics;

  const ComicSlider({super.key, required this.comics});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    if (comics.isEmpty) {
      return Container(
        width: double.infinity,
        height: size.height * 0.5,
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Container(
      width: double.infinity,
      height: 260,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text('Comics',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ),
          SizedBox(
            height: 5,
          ),
          Expanded(
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: comics.length,
                itemBuilder: (BuildContext context, int index) {
                  final comic = comics[index];
                  return _ComicPoster(
                    comic: comic,
                  );
                }),
          )
        ],
      ),
    );
  }
}

/**
 * Classe _ComicPoster encarregada de rebre per parametre un comic, on per cada comic ficara la imatge dins un container amb la mida predefinida on
 * quan es pitja damunt l'imatge amb el navigator duu cap a la ruta nombrada "detailsComic"
 */
class _ComicPoster extends StatelessWidget {
  final comic;
  const _ComicPoster({Key? key, required this.comic}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      height: 190,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          GestureDetector(
            onTap: () =>
                Navigator.pushNamed(context, 'detailsComic', arguments: comic),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                placeholder: AssetImage('assets/no-image.jpg'),
                image: NetworkImage(comic.fullPosterPath),
                width: 130,
                height: 190,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            comic.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
