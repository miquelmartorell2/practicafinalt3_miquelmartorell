import 'package:flutter/material.dart';
import 'package:practicafinalt3_miquelmartorell/providers/comics_characters_provider.dart';
import 'package:practicafinalt3_miquelmartorell/screens/screens.dart';
import 'package:provider/provider.dart';
/**
 * Classe main encarregada de executar la app iniciant a primera pantalla
 */

void main() => runApp(AppState());

/**
 * Classe AppState encarregada de inicialitzar el provider que s'utilitzara
 */
class AppState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: ( _ ) => ComicsCharactersProvider(),
          lazy: false,
        )
        
      ],
      child: MyApp(),
    );
  }
}

/**
 * Classe MyApp encarregada de executar la primera pantalla, també hi ha definides les rutes
 */
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pel·lícules',
      initialRoute: 'home',
      routes: {
        'home': (BuildContext context) => HomeScreen(),
        'detailsComic': (BuildContext context) => DetailsComicScreen(),
        'detailsCharacter' : (BuildContext context) => DetailsCharacterScreen()
      },
      theme: ThemeData.light()
          .copyWith(appBarTheme: const AppBarTheme(color: Colors.indigo)),
    );
  }
}
