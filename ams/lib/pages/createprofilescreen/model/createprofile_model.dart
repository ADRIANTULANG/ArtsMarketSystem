import 'dart:convert';

List<PredictedPlaces> predictedPlacesFromJson(String str) =>
    List<PredictedPlaces>.from(
        json.decode(str).map((x) => PredictedPlaces.fromJson(x)));

String predictedPlacesToJson(List<PredictedPlaces> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PredictedPlaces {
  PredictedPlaces({
    required this.placename,
    required this.latitude,
    required this.longitude,
  });

  String placename;
  double latitude;
  double longitude;

  factory PredictedPlaces.fromJson(Map<String, dynamic> json) =>
      PredictedPlaces(
        placename: json["placename"],
        latitude: json["latitude"],
        longitude: json["longitude"],
      );

  Map<String, dynamic> toJson() => {
        "placename": placename,
        "latitude": latitude,
        "longitude": longitude,
      };
}
