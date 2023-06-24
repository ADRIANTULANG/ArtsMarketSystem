import 'dart:convert';

List<History> historyFromJson(String str) =>
    List<History>.from(json.decode(str).map((x) => History.fromJson(x)));

String historyToJson(List<History> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class History {
  History({
    required this.header,
    required this.date,
    required this.transactionId,
    required this.art,
  });

  Header header;
  Date date;
  String transactionId;
  Art art;

  factory History.fromJson(Map<String, dynamic> json) => History(
        header: Header.fromJson(json["header"]),
        date: Date.fromJson(json["date"]),
        transactionId: json["transactionId"],
        art: Art.fromJson(json["art"]),
      );

  Map<String, dynamic> toJson() => {
        "header": header.toJson(),
        "date": date.toJson(),
        "transactionId": transactionId,
        "art": art.toJson(),
      };
}

class Art {
  Art({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
  });

  String id;
  String title;
  String description;
  int price;

  factory Art.fromJson(Map<String, dynamic> json) => Art(
        id: json["_id"],
        title: json["title"],
        description: json["description"],
        price: json["price"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "title": title,
        "description": description,
        "price": price,
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

class Header {
  Header({
    required this.artist,
    required this.customer,
  });

  Artist artist;
  Artist customer;

  factory Header.fromJson(Map<String, dynamic> json) => Header(
        artist: Artist.fromJson(json["artist"]),
        customer: Artist.fromJson(json["customer"]),
      );

  Map<String, dynamic> toJson() => {
        "artist": artist.toJson(),
        "customer": customer.toJson(),
      };
}

class Artist {
  Artist({
    required this.name,
    required this.accountId,
    required this.avatar,
  });

  Name name;
  String accountId;
  String avatar;

  factory Artist.fromJson(Map<String, dynamic> json) => Artist(
        name: Name.fromJson(json["name"]),
        accountId: json["accountId"],
        avatar: json["avatar"],
      );

  Map<String, dynamic> toJson() => {
        "name": name.toJson(),
        "accountId": accountId,
        "avatar": avatar,
      };
}

class Name {
  Name({
    required this.first,
    required this.last,
  });

  String first;
  String last;

  factory Name.fromJson(Map<String, dynamic> json) => Name(
        first: json["first"],
        last: json["last"],
      );

  Map<String, dynamic> toJson() => {
        "first": first,
        "last": last,
      };
}
