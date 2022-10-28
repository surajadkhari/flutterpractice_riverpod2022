// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

List<commentModel> welcomeFromJson(String str) =>
    List<commentModel>.from(json.decode(str).map((x) => commentModel.fromJson(x)));

class commentModel {
  commentModel({
    required this.postId,
    required this.id,
    required this.name,
    required this.email,
    required this.body,
  });

  int postId;
  int id;
  String name;
  String email;
  String body;

  factory commentModel.fromJson(Map<String, dynamic> json) => commentModel(
        postId: json["postId"],
        id: json["id"],
        name: json["name"],
        email: json["email"],
        body: json["body"],
      );
}
