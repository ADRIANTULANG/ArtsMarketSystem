import 'dart:convert';

ArtDetail artDetailFromJson(String str) => ArtDetail.fromJson(json.decode(str));

String artDetailToJson(ArtDetail data) => json.encode(data.toJson());

class ArtDetail {
  ArtDetail({
    required this.date,
    required this.address,
    required this.id,
    required this.accountId,
    required this.price,
    required this.title,
    required this.description,
    required this.images,
    required this.tags,
    required this.availability,
  });

  Date date;
  Address address;
  String id;
  String accountId;
  int price;
  String title;
  String description;
  List<Image> images;
  List<String> tags;
  bool availability;

  factory ArtDetail.fromJson(Map<String, dynamic> json) => ArtDetail(
        date: Date.fromJson(json["date"]),
        address: Address.fromJson(json["address"]),
        id: json["_id"],
        accountId: json["accountId"],
        price: json["price"],
        title: json["title"],
        description: json["description"],
        images: List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
        tags: List<String>.from(json["tags"].map((x) => x)),
        availability: json["availability"],
      );

  Map<String, dynamic> toJson() => {
        "date": date.toJson(),
        "address": address.toJson(),
        "_id": id,
        "accountId": accountId,
        "price": price,
        "title": title,
        "description": description,
        "images": List<dynamic>.from(images.map((x) => x.toJson())),
        "tags": List<dynamic>.from(tags.map((x) => x)),
        "availability": availability,
      };
}

class Address {
  Address({
    required this.coordinates,
    required this.name,
  });

  Coordinates coordinates;
  String name;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        coordinates: Coordinates.fromJson(json["coordinates"]),
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "coordinates": coordinates.toJson(),
        "name": name,
      };
}

class Coordinates {
  Coordinates({
    required this.latitude,
    required this.longitude,
  });

  String latitude;
  String longitude;

  factory Coordinates.fromJson(Map<String, dynamic> json) => Coordinates(
        latitude: json["latitude"],
        longitude: json["longitude"],
      );

  Map<String, dynamic> toJson() => {
        "latitude": latitude,
        "longitude": longitude,
      };
}

class Date {
  Date({
    required this.createdAt,
  });

  DateTime createdAt;

  factory Date.fromJson(Map<String, dynamic> json) => Date(
        createdAt: DateTime.parse(json["createdAt"]),
      );

  Map<String, dynamic> toJson() => {
        "createdAt": createdAt.toIso8601String(),
      };
}

class Image {
  Image({
    required this.date,
    required this.url,
    required this.description,
    required this.title,
    required this.id,
  });

  Date date;
  String url;
  String description;
  String title;
  String id;

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        date: Date.fromJson(json["date"]),
        url: json["url"],
        description: json["description"],
        title: json["title"],
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "date": date.toJson(),
        "url": url,
        "description": description,
        "title": title,
        "_id": id,
      };
}
