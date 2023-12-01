import 'package:practicafinalt3_miquelmartorell/models/models.dart';
/**
 * Classe CharacterResponse encarregada de crear l'objecte Character Response amb tots els
 * seus corresponents atributs
 */

class CharactersResponse {
  int code;
  String status;
  String copyright;
  String attributionText;
  String attributionHtml;
  String etag;
  Data data;

  CharactersResponse({
    required this.code,
    required this.status,
    required this.copyright,
    required this.attributionText,
    required this.attributionHtml,
    required this.etag,
    required this.data,
  });

  factory CharactersResponse.fromJson(String str) =>
      CharactersResponse.fromMap(json.decode(str));

  factory CharactersResponse.fromMap(Map<String, dynamic> json) =>
      CharactersResponse(
        code: json["code"],
        status: json["status"],
        copyright: json["copyright"],
        attributionText: json["attributionText"],
        attributionHtml: json["attributionHTML"],
        etag: json["etag"],
        data: Data.fromMap(json["data"]),
      );
}

class Data {
  int offset;
  int limit;
  int total;
  int count;
  List<Character> results;

  Data({
    required this.offset,
    required this.limit,
    required this.total,
    required this.count,
    required this.results,
  });

  factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

  factory Data.fromMap(Map<String, dynamic> json) => Data(
        offset: json["offset"],
        limit: json["limit"],
        total: json["total"],
        count: json["count"],
        results: List<Character>.from(
            json["results"].map((x) => Character.fromMap(x))),
      );
}
