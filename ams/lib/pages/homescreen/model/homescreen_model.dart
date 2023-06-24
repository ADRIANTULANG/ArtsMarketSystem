import 'dart:convert';

import 'package:get/get.dart';

List<ArtStores> artStoresFromJson(String str) =>
    List<ArtStores>.from(json.decode(str).map((x) => ArtStores.fromJson(x)));

String artStoresToJson(List<ArtStores> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ArtStores {
  ArtStores({
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
    this.distanceBetween,
    required this.isSelected,
    required this.isLike,
  });

  ArtStoreDate date;
  Address address;
  String id;
  String accountId;
  int price;
  String title;
  String description;
  List<Image> images;
  List<String> tags;
  bool availability;
  String? distanceBetween;
  RxBool isSelected;
  RxBool isLike;

  factory ArtStores.fromJson(Map<String, dynamic> json) => ArtStores(
        date: ArtStoreDate.fromJson(json["date"]),
        address: Address.fromJson(json["address"]),
        id: json["_id"],
        accountId: json["accountId"],
        price: json["price"],
        title: json["title"],
        description: json["description"],
        images: List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
        tags: [],
        availability: json["availability"],
        distanceBetween: json["distanceBetween"] ?? "",
        isSelected: false.obs,
        isLike: false.obs,
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
        "tags": tags,
        "availability": availability,
        "distanceBetween": distanceBetween,
        "isSelected": isSelected,
        "isLike": isLike,
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

class ArtStoreDate {
  ArtStoreDate({
    required this.createdAt,
  });

  DateTime createdAt;

  factory ArtStoreDate.fromJson(Map<String, dynamic> json) => ArtStoreDate(
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

  ImageDate date;
  String url;
  String description;
  String title;
  String id;

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        date: ImageDate.fromJson(json["date"]),
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

class ImageDate {
  ImageDate({
    required this.createdAt,
  });

  DateTime createdAt;

  factory ImageDate.fromJson(Map<String, dynamic> json) => ImageDate(
        createdAt: DateTime.parse(json["createdAt"]),
      );

  Map<String, dynamic> toJson() => {
        "createdAt": createdAt.toIso8601String(),
      };
}
