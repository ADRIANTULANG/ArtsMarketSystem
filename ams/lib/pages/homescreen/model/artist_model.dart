// To parse this JSON data, do
//
//     final artistModel = artistModelFromJson(jsonString);

import 'dart:convert';

List<ArtistModel> artistModelFromJson(String str) => List<ArtistModel>.from(
    json.decode(str).map((x) => ArtistModel.fromJson(x)));

String artistModelToJson(List<ArtistModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ArtistModel {
  ArtistModel({
    this.name,
    this.address,
    this.contact,
    this.date,
    this.account,
    this.accountId,
    this.birthdate,
    this.gallery,
    this.avatar,
    this.distanceBetween,
  });

  Name? name;
  Address? address;
  Contact? contact;
  Date? date;
  Account? account;
  String? accountId;
  DateTime? birthdate;
  List<dynamic>? gallery;
  String? avatar;
  String? distanceBetween;

  factory ArtistModel.fromJson(Map<String, dynamic> json) => ArtistModel(
        name: json["name"] == null
            ? Name(first: "", last: "")
            : Name.fromJson(json["name"]),
        address: json["address"] == null
            ? Address(
                name: "",
                coordinates: Coordinates(latitude: "0.0", longitude: "0.0"))
            : Address.fromJson(json["address"]),
        contact: json["contact"] == null
            ? Contact(email: "", number: "0999999999")
            : Contact.fromJson(json["contact"]),
        date: json["date"] == null
            ? Date(createdAt: DateTime.now(), updatedAt: DateTime.now())
            : Date.fromJson(json["date"]),
        account: json["account"] == null
            ? Account(
                role: Role.ARTIST,
              )
            : Account.fromJson(json["account"]),
        accountId: json["accountId"] == null ? "" : json["accountId"],
        birthdate: json["birthdate"] == null
            ? DateTime.now()
            : DateTime.parse(json["birthdate"]),
        gallery: json["gallery"] == null
            ? []
            : List<dynamic>.from(json["gallery"].map((x) => x)),
        avatar: json["avatar"] == null ? "" : json["avatar"],
        distanceBetween:
            json["distanceBetween"] == null ? "" : json["distanceBetween"],
      );

  Map<String, dynamic> toJson() => {
        "name": name == null ? null : name!.toJson(),
        "address": address == null ? null : address!.toJson(),
        "contact": contact == null ? null : contact!.toJson(),
        "date": date == null ? null : date!.toJson(),
        "account": account == null ? null : account!.toJson(),
        "accountId": accountId == null ? null : accountId,
        "birthdate": birthdate == null ? null : birthdate!.toIso8601String(),
        "gallery":
            gallery == null ? null : List<dynamic>.from(gallery!.map((x) => x)),
        "avatar": avatar == null ? null : avatar,
        "distanceBetween": distanceBetween == null ? null : distanceBetween,
      };
}

class Account {
  Account({
    this.role,
    this.visibility,
    this.verified,
    this.authorization,
  });

  Role? role;
  bool? visibility;
  bool? verified;
  bool? authorization;

  factory Account.fromJson(Map<String, dynamic> json) => Account(
        role: json["role"] == null ? null : roleValues.map![json["role"]],
        visibility: json["visibility"] == null ? null : json["visibility"],
        verified: json["verified"] == null ? null : json["verified"],
        authorization:
            json["authorization"] == null ? null : json["authorization"],
      );

  Map<String, dynamic> toJson() => {
        "role": role == null ? null : roleValues.reverse[role],
        "visibility": visibility == null ? null : visibility,
        "verified": verified == null ? null : verified,
        "authorization": authorization == null ? null : authorization,
      };
}

enum Role { ARTIST }

final roleValues = EnumValues({"artist": Role.ARTIST});

class Address {
  Address({
    this.coordinates,
    this.name,
  });

  Coordinates? coordinates;
  String? name;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        coordinates: json["coordinates"] == null
            ? null
            : Coordinates.fromJson(json["coordinates"]),
        name: json["name"] == null ? null : json["name"],
      );

  Map<String, dynamic> toJson() => {
        "coordinates": coordinates == null ? null : coordinates!.toJson(),
        "name": name == null ? null : name,
      };
}

class Coordinates {
  Coordinates({
    this.latitude,
    this.longitude,
  });

  String? latitude;
  String? longitude;

  factory Coordinates.fromJson(Map<String, dynamic> json) => Coordinates(
        latitude: json["latitude"] == null ? null : json["latitude"],
        longitude: json["longitude"] == null ? null : json["longitude"],
      );

  Map<String, dynamic> toJson() => {
        "latitude": latitude == null ? null : latitude,
        "longitude": longitude == null ? null : longitude,
      };
}

class Contact {
  Contact({
    this.email,
    this.number,
  });

  String? email;
  String? number;

  factory Contact.fromJson(Map<String, dynamic> json) => Contact(
        email: json["email"] == null ? null : json["email"],
        number: json["number"] == null ? null : json["number"],
      );

  Map<String, dynamic> toJson() => {
        "email": email == null ? null : email,
        "number": number == null ? null : number,
      };
}

class Date {
  Date({
    this.createdAt,
    this.updatedAt,
  });

  DateTime? createdAt;
  DateTime? updatedAt;

  factory Date.fromJson(Map<String, dynamic> json) => Date(
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "createdAt": createdAt == null ? null : createdAt!.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt!.toIso8601String(),
      };
}

class Name {
  Name({
    this.first,
    this.last,
  });

  String? first;
  String? last;

  factory Name.fromJson(Map<String, dynamic> json) => Name(
        first: json["first"] == null ? null : json["first"],
        last: json["last"] == null ? null : json["last"],
      );

  Map<String, dynamic> toJson() => {
        "first": first == null ? null : first,
        "last": last == null ? null : last,
      };
}

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map!.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap!;
  }
}
