import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:practicafinalt3_miquelmartorell/models/comics.dart';
import 'package:practicafinalt3_miquelmartorell/models/comics_response.dart';
import 'package:practicafinalt3_miquelmartorell/models/models.dart';
import 'package:crypto/crypto.dart';

/**
 * Classe ComicsCharacterseProvider on s'encarrega de realitzar les peticions a la api utilitzant el provider
 * per generar la peticio a la api, en aquest cas es necesiari la _baseUrl, _apiKeyPrivate i un limit
 * Per a aquesta api es necesri crear un hash amb un timestamp + apiKeyPrivate  + apiKey
 */
class ComicsCharactersProvider extends ChangeNotifier {
  String _baseUrl = "gateway.marvel.com:443";
  String _apiKey = 'd03da45ba74e8e2bc04d6e49bd9a57b6';
  String _apiKeyPrivate = '02fcaa8858957add537ca944aab78f813c4ee9f3';
  String _limit = '10';

  //Inicialització de Lists on s'almacenara la informacio rebuda de la api
  List<Character> onDisplayCharacters = [];
  List<Comic> onDisplayComics = [];

  /**
   * Métode ComicsCharacterseProvider encarregat de cridar els métodes asyncrons on es realitza la peticó a la api
   */
  ComicsCharactersProvider() {
    this.getOnDisplayCharacters();
    this.getOnDisplayComics();
  }

  /**
   * Métode getOnDisplayCharacters encarregat de fer la petició a la api, on primer  de tot genera un timestamp seguidament genera el md5
   * amb el métode necesri i finalment amb tots els arguments genera la url, una vegada generada la url, realitza la petició
   * http.get i guarda els resultats corresponents dins la llista necesaria. Finalment el notifyListeners per a notificar-ho
   * En aquesta peticio s'accedeix a 'v1/public/characters'
   */
  getOnDisplayCharacters() async {
    final timestamp = DateTime.now().millisecondsSinceEpoch;
    final String hash =
        generateMd5(timestamp.toString() + _apiKeyPrivate + _apiKey);
    final url = Uri.https(_baseUrl, 'v1/public/characters', {
      'ts': timestamp.toString(),
      'apikey': _apiKey,
      'hash': hash,
      'limit': _limit,
    });

    final result = await http.get(url);
    final nowPlayingResponse = CharactersResponse.fromJson(result.body);

    onDisplayCharacters = nowPlayingResponse.data.results;
    print(onDisplayCharacters);

    notifyListeners();
  }

  /**
   * Métode getOnDisplayComics encarregat de fer la petició a la api, on primer  de tot genera un timestamp seguidament genera el md5
   * amb el métode necesri i finalment amb tots els arguments genera la url, una vegada generada la url, realitza la petició
   * http.get i guarda els resultats corresponents dins la llista necesaria. Finalment el notifyListeners per a notificar-ho
   * En aquesta peticio s'accedeix a 'v1/public/comics'
   */
  getOnDisplayComics() async {
    print('getOnDisplayComics');

    final timestamp = DateTime.now().millisecondsSinceEpoch;
    final String hash =
        generateMd5(timestamp.toString() + _apiKeyPrivate + _apiKey);
    print(timestamp);
    print(hash);

    final url = Uri.https(_baseUrl, 'v1/public/comics', {
      'ts': timestamp.toString(),
      'apikey': _apiKey,
      'hash': hash,
      'limit': _limit,
    });

    print(url);

    final result = await http.get(url);
    final nowPlayingResponse = ComicsResponse.fromJson(result.body);

    onDisplayComics = nowPlayingResponse.data.results;
    print(onDisplayCharacters);

    notifyListeners();
  }
}

/**
 * Classe generateMd5 encarregada de generar el hash md5 a partir de l'imput que rep per parametre, utilitza la llibreria de crypto
 */
String generateMd5(String input) {
  return md5.convert(utf8.encode(input)).toString();
}
