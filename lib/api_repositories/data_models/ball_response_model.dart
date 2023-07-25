import 'dart:convert';

BallResponseModel ballResponseModelFromJson(String str) => BallResponseModel.fromJson(json.decode(str));

class BallResponseModel {
  String? reading;
  String? error;

  BallResponseModel({
    this.reading,
    this.error,
  });

  factory BallResponseModel.fromJson(Map<String, dynamic> json) => BallResponseModel(
    reading: json["reading"],
  );
}
