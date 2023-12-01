import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:practicafinalt3_miquelmartorell/models/characters.dart';
import 'package:practicafinalt3_miquelmartorell/models/models.dart';

/**
 * La classe CCardSwiper es una classe encarregada de mostrar un CardSwiper amb tots els personatges que rep l'api,
 * primer de tot es crea el constructor que necesita rebre els personarges per parametre. Seguidament comprova si la llista esta buida,
 * si esta buida mostra un Icone de un cercle carregant, sino dins un container es realitza un swiper  on la longitud del swiper es la longitud de la llsita de caracters, finalment
 * amb l'itembuilder s'introdueixen totes les imatges al seu lloc corresponent, si es pitja damunt la imatge amb el Navigator duu cap a la pagina mapetjada "detailsCharacter"
 */
class CardSwiper extends StatelessWidget {
  final List<Character> characters;

  const CardSwiper({super.key, required this.characters});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    if (characters.isEmpty) {
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
        // Aquest multiplicador estableix el tant per cent de pantalla ocupada 50%
        height: size.height * 0.5,
        // color: Colors.red,
        child: Swiper(
          itemCount: characters.length,
          layout: SwiperLayout.STACK,
          itemWidth: size.width * 0.6,
          itemHeight: size.height * 0.4,
          itemBuilder: (BuildContext context, int index) {
            final character = characters[index];

            return GestureDetector(
              onTap: () => Navigator.pushNamed(context, 'detailsCharacter',
                  arguments: character),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: FadeInImage(
                    placeholder: AssetImage('assets/no-image.jpg'),
                    image: NetworkImage(character.fullPosterPath),
                    fit: BoxFit.cover),
              ),
            );
          },
        ));
  }
}
