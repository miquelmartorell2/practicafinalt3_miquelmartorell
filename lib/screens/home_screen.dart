import 'package:flutter/material.dart';
import 'package:practicafinalt3_miquelmartorell/providers/comics_characters_provider.dart';
import 'package:practicafinalt3_miquelmartorell/widgets/widgets.dart';
import 'package:provider/provider.dart';

/**
 * Classe HomeScreen encarregada de mostrar la informacio de la pagina princiapal, primer de tot inicialitzar comicsCHaractersProvider utilitzant
 * provider on seguidament retorna un Scaffold amb una appbar amb un titol i dins el body hi ha un SingleChildScrollView que conte un container amb columnes
 * on s'executen els widgets CardSwiper i MovieSlider
 */
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final comicsCHaractersProvider =
        Provider.of<ComicsCharactersProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Personatges Comics'),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              CardSwiper(
                characters: comicsCHaractersProvider.onDisplayCharacters,
              ),
              ComicSlider(comics: comicsCHaractersProvider.onDisplayComics),
            ],
          ),
        ),
      ),
    );
  }
}
