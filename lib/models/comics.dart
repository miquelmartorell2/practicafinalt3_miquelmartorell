import 'dart:convert';

/**
 * Classe Comic encarregada de crear l'objecte Comic amb tots els
 * seus corresponents atributs
 */
class Comic {
  int id;
  int digitalId;
  String title;
  int issueNumber;
  String variantDescription;
  Description? description;
  String modified;
  String upc;
  DiamondCode diamondCode;
  String ean;
  String issn;
  Format format;
  int pageCount;
  List<TextObject> textObjects;
  String resourceUri;
  List<Url> urls;
  Series series;
  List<Series> variants;
  List<dynamic> collections;
  List<Series> collectedIssues;
  List<Date> dates;
  List<Price> prices;
  Thumbnail thumbnail;
  List<Thumbnail> images;
  Creators creators;
  Characters characters;
  Stories stories;
  Characters events;

  Comic({
    required this.id,
    required this.digitalId,
    required this.title,
    required this.issueNumber,
    required this.variantDescription,
    required this.description,
    required this.modified,
    required this.upc,
    required this.diamondCode,
    required this.ean,
    required this.issn,
    required this.format,
    required this.pageCount,
    required this.textObjects,
    required this.resourceUri,
    required this.urls,
    required this.series,
    required this.variants,
    required this.collections,
    required this.collectedIssues,
    required this.dates,
    required this.prices,
    required this.thumbnail,
    required this.images,
    required this.creators,
    required this.characters,
    required this.stories,
    required this.events,
  });

  get fullPosterPath {
    String a = '${thumbnail.path}.${thumbnail.extension.name.toLowerCase()}';
    return a;
  }

  factory Comic.fromJson(String str) => Comic.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Comic.fromMap(Map<String, dynamic> json) => Comic(
        id: json["id"],
        digitalId: json["digitalId"],
        title: json["title"],
        issueNumber: json["issueNumber"],
        variantDescription: json["variantDescription"],
        description: descriptionValues.map[json["description"]]!,
        modified: json["modified"],
        upc: json["upc"],
        diamondCode: diamondCodeValues.map[json["diamondCode"]]!,
        ean: json["ean"],
        issn: json["issn"],
        format: formatValues.map[json["format"]]!,
        pageCount: json["pageCount"],
        textObjects: List<TextObject>.from(
            json["textObjects"].map((x) => TextObject.fromMap(x))),
        resourceUri: json["resourceURI"],
        urls: List<Url>.from(json["urls"].map((x) => Url.fromMap(x))),
        series: Series.fromMap(json["series"]),
        variants:
            List<Series>.from(json["variants"].map((x) => Series.fromMap(x))),
        collections: List<dynamic>.from(json["collections"].map((x) => x)),
        collectedIssues: List<Series>.from(
            json["collectedIssues"].map((x) => Series.fromMap(x))),
        dates: List<Date>.from(json["dates"].map((x) => Date.fromMap(x))),
        prices: List<Price>.from(json["prices"].map((x) => Price.fromMap(x))),
        thumbnail: Thumbnail.fromMap(json["thumbnail"]),
        images: List<Thumbnail>.from(
            json["images"].map((x) => Thumbnail.fromMap(x))),
        creators: Creators.fromMap(json["creators"]),
        characters: Characters.fromMap(json["characters"]),
        stories: Stories.fromMap(json["stories"]),
        events: Characters.fromMap(json["events"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "digitalId": digitalId,
        "title": title,
        "issueNumber": issueNumber,
        "variantDescription": variantDescription,
        "description": descriptionValues.reverse[description],
        "modified": modified,
        "upc": upc,
        "diamondCode": diamondCodeValues.reverse[diamondCode],
        "ean": ean,
        "issn": issn,
        "format": formatValues.reverse[format],
        "pageCount": pageCount,
        "textObjects": List<dynamic>.from(textObjects.map((x) => x.toMap())),
        "resourceURI": resourceUri,
        "urls": List<dynamic>.from(urls.map((x) => x.toMap())),
        "series": series.toMap(),
        "variants": List<dynamic>.from(variants.map((x) => x.toMap())),
        "collections": List<dynamic>.from(collections.map((x) => x)),
        "collectedIssues":
            List<dynamic>.from(collectedIssues.map((x) => x.toMap())),
        "dates": List<dynamic>.from(dates.map((x) => x.toMap())),
        "prices": List<dynamic>.from(prices.map((x) => x.toMap())),
        "thumbnail": thumbnail.toMap(),
        "images": List<dynamic>.from(images.map((x) => x.toMap())),
        "creators": creators.toMap(),
        "characters": characters.toMap(),
        "stories": stories.toMap(),
        "events": events.toMap(),
      };
}

class Characters {
  int available;
  String collectionUri;
  List<Series> items;
  int returned;

  Characters({
    required this.available,
    required this.collectionUri,
    required this.items,
    required this.returned,
  });

  factory Characters.fromJson(String str) =>
      Characters.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Characters.fromMap(Map<String, dynamic> json) => Characters(
        available: json["available"],
        collectionUri: json["collectionURI"],
        items: List<Series>.from(json["items"].map((x) => Series.fromMap(x))),
        returned: json["returned"],
      );

  Map<String, dynamic> toMap() => {
        "available": available,
        "collectionURI": collectionUri,
        "items": List<dynamic>.from(items.map((x) => x.toMap())),
        "returned": returned,
      };
}

class Series {
  String resourceUri;
  String name;

  Series({
    required this.resourceUri,
    required this.name,
  });

  factory Series.fromJson(String str) => Series.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Series.fromMap(Map<String, dynamic> json) => Series(
        resourceUri: json["resourceURI"],
        name: json["name"],
      );

  Map<String, dynamic> toMap() => {
        "resourceURI": resourceUri,
        "name": name,
      };
}

class Creators {
  int available;
  String collectionUri;
  List<CreatorsItem> items;
  int returned;

  Creators({
    required this.available,
    required this.collectionUri,
    required this.items,
    required this.returned,
  });

  factory Creators.fromJson(String str) => Creators.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Creators.fromMap(Map<String, dynamic> json) => Creators(
        available: json["available"],
        collectionUri: json["collectionURI"],
        items: List<CreatorsItem>.from(
            json["items"].map((x) => CreatorsItem.fromMap(x))),
        returned: json["returned"],
      );

  Map<String, dynamic> toMap() => {
        "available": available,
        "collectionURI": collectionUri,
        "items": List<dynamic>.from(items.map((x) => x.toMap())),
        "returned": returned,
      };
}

class CreatorsItem {
  String resourceUri;
  String name;
  Role role;

  CreatorsItem({
    required this.resourceUri,
    required this.name,
    required this.role,
  });

  factory CreatorsItem.fromJson(String str) =>
      CreatorsItem.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CreatorsItem.fromMap(Map<String, dynamic> json) => CreatorsItem(
        resourceUri: json["resourceURI"],
        name: json["name"],
        role: roleValues.map[json["role"]]!,
      );

  Map<String, dynamic> toMap() => {
        "resourceURI": resourceUri,
        "name": name,
        "role": roleValues.reverse[role],
      };
}

enum Role {
  COLORIST,
  EDITOR,
  INKER,
  LETTERER,
  PENCILER,
  PENCILLER,
  PENCILLER_COVER,
  WRITER
}

final roleValues = EnumValues({
  "colorist": Role.COLORIST,
  "editor": Role.EDITOR,
  "inker": Role.INKER,
  "letterer": Role.LETTERER,
  "penciler": Role.PENCILER,
  "penciller": Role.PENCILLER,
  "penciller (cover)": Role.PENCILLER_COVER,
  "writer": Role.WRITER
});

class Date {
  DateType type;
  String date;

  Date({
    required this.type,
    required this.date,
  });

  factory Date.fromJson(String str) => Date.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Date.fromMap(Map<String, dynamic> json) => Date(
        type: dateTypeValues.map[json["type"]]!,
        date: json["date"],
      );

  Map<String, dynamic> toMap() => {
        "type": dateTypeValues.reverse[type],
        "date": date,
      };
}

enum DateType { DIGITAL_PURCHASE_DATE, FOC_DATE, ONSALE_DATE, UNLIMITED_DATE }

final dateTypeValues = EnumValues({
  "digitalPurchaseDate": DateType.DIGITAL_PURCHASE_DATE,
  "focDate": DateType.FOC_DATE,
  "onsaleDate": DateType.ONSALE_DATE,
  "unlimitedDate": DateType.UNLIMITED_DATE
});

enum Description { EMPTY, N_A }

final descriptionValues =
    EnumValues({"": Description.EMPTY, "#N/A": Description.N_A});

enum DiamondCode { EMPTY, JUL190068 }

final diamondCodeValues =
    EnumValues({"": DiamondCode.EMPTY, "JUL190068": DiamondCode.JUL190068});

enum Format { COMIC, DIGEST, EMPTY, TRADE_PAPERBACK }

final formatValues = EnumValues({
  "Comic": Format.COMIC,
  "Digest": Format.DIGEST,
  "": Format.EMPTY,
  "Trade Paperback": Format.TRADE_PAPERBACK
});

class Thumbnail {
  String path;
  Extension extension;

  Thumbnail({
    required this.path,
    required this.extension,
  });

  factory Thumbnail.fromJson(String str) => Thumbnail.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Thumbnail.fromMap(Map<String, dynamic> json) => Thumbnail(
        path: json["path"],
        extension: extensionValues.map[json["extension"]]!,
      );

  Map<String, dynamic> toMap() => {
        "path": path,
        "extension": extensionValues.reverse[extension],
      };
}

enum Extension { JPG }

final extensionValues = EnumValues({"jpg": Extension.JPG});

class Price {
  PriceType type;
  double price;

  Price({
    required this.type,
    required this.price,
  });

  factory Price.fromJson(String str) => Price.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Price.fromMap(Map<String, dynamic> json) => Price(
        type: priceTypeValues.map[json["type"]]!,
        price: json["price"]?.toDouble(),
      );

  Map<String, dynamic> toMap() => {
        "type": priceTypeValues.reverse[type],
        "price": price,
      };
}

enum PriceType { DIGITAL_PURCHASE_PRICE, PRINT_PRICE }

final priceTypeValues = EnumValues({
  "digitalPurchasePrice": PriceType.DIGITAL_PURCHASE_PRICE,
  "printPrice": PriceType.PRINT_PRICE
});

class Stories {
  int available;
  String collectionUri;
  List<StoriesItem> items;
  int returned;

  Stories({
    required this.available,
    required this.collectionUri,
    required this.items,
    required this.returned,
  });

  factory Stories.fromJson(String str) => Stories.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Stories.fromMap(Map<String, dynamic> json) => Stories(
        available: json["available"],
        collectionUri: json["collectionURI"],
        items: List<StoriesItem>.from(
            json["items"].map((x) => StoriesItem.fromMap(x))),
        returned: json["returned"],
      );

  Map<String, dynamic> toMap() => {
        "available": available,
        "collectionURI": collectionUri,
        "items": List<dynamic>.from(items.map((x) => x.toMap())),
        "returned": returned,
      };
}

class StoriesItem {
  String resourceUri;
  String name;
  ItemType type;

  StoriesItem({
    required this.resourceUri,
    required this.name,
    required this.type,
  });

  factory StoriesItem.fromJson(String str) =>
      StoriesItem.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory StoriesItem.fromMap(Map<String, dynamic> json) => StoriesItem(
        resourceUri: json["resourceURI"],
        name: json["name"],
        type: itemTypeValuesComics.map[json["type"]]!,
      );

  Map<String, dynamic> toMap() => {
        "resourceURI": resourceUri,
        "name": name,
        "type": itemTypeValuesComics.reverse[type],
      };
}

enum ItemType { COVER, INTERIOR_STORY, PROMO }

final itemTypeValuesComics = EnumValues({
  "cover": ItemType.COVER,
  "interiorStory": ItemType.INTERIOR_STORY,
  "promo": ItemType.PROMO
});

class TextObject {
  TextObjectType type;
  Language language;
  String text;

  TextObject({
    required this.type,
    required this.language,
    required this.text,
  });

  factory TextObject.fromJson(String str) =>
      TextObject.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory TextObject.fromMap(Map<String, dynamic> json) => TextObject(
        type: textObjectTypeValues.map[json["type"]]!,
        language: languageValues.map[json["language"]]!,
        text: json["text"],
      );

  Map<String, dynamic> toMap() => {
        "type": textObjectTypeValues.reverse[type],
        "language": languageValues.reverse[language],
        "text": text,
      };
}

enum Language { EN_US }

final languageValues = EnumValues({"en-us": Language.EN_US});

enum TextObjectType { ISSUE_SOLICIT_TEXT }

final textObjectTypeValues =
    EnumValues({"issue_solicit_text": TextObjectType.ISSUE_SOLICIT_TEXT});

class Url {
  UrlType type;
  String url;

  Url({
    required this.type,
    required this.url,
  });

  factory Url.fromJson(String str) => Url.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Url.fromMap(Map<String, dynamic> json) => Url(
        type: urlTypeValuesComics.map[json["type"]]!,
        url: json["url"],
      );

  Map<String, dynamic> toMap() => {
        "type": urlTypeValuesComics.reverse[type],
        "url": url,
      };
}

enum UrlType { DETAIL, IN_APP_LINK, PURCHASE, READER }

final urlTypeValuesComics = EnumValues({
  "detail": UrlType.DETAIL,
  "inAppLink": UrlType.IN_APP_LINK,
  "purchase": UrlType.PURCHASE,
  "reader": UrlType.READER
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
