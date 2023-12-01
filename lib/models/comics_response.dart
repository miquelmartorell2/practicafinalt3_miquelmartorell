import 'dart:convert';

import 'package:practicafinalt3_miquelmartorell/models/comics.dart';

/**
 * Classe ComicsResponse encarregada de crear l'objecte ComicsResponse amb tots els
 * seus corresponents atributs
 */

class ComicsResponse {
  int code;
  String status;
  String copyright;
  String attributionText;
  String attributionHtml;
  String etag;
  Data data;

  ComicsResponse({
    required this.code,
    required this.status,
    required this.copyright,
    required this.attributionText,
    required this.attributionHtml,
    required this.etag,
    required this.data,
  });

  factory ComicsResponse.fromJson(String str) =>
      ComicsResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ComicsResponse.fromMap(Map<String, dynamic> json) => ComicsResponse(
        code: json["code"],
        status: json["status"],
        copyright: json["copyright"],
        attributionText: json["attributionText"],
        attributionHtml: json["attributionHTML"],
        etag: json["etag"],
        data: Data.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
        "code": code,
        "status": status,
        "copyright": copyright,
        "attributionText": attributionText,
        "attributionHTML": attributionHtml,
        "etag": etag,
        "data": data.toMap(),
      };
}

class Data {
  int offset;
  int limit;
  int total;
  int count;
  List<Comic> results;

  Data({
    required this.offset,
    required this.limit,
    required this.total,
    required this.count,
    required this.results,
  });

  factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Data.fromMap(Map<String, dynamic> json) => Data(
        offset: json["offset"],
        limit: json["limit"],
        total: json["total"],
        count: json["count"],
        results: List<Comic>.from(json["results"].map((x) => Comic.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "offset": offset,
        "limit": limit,
        "total": total,
        "count": count,
        "results": List<dynamic>.from(results.map((x) => x.toMap())),
      };
}
