// To parse this JSON data, do
//
//     final githubRepoJsonModel = githubRepoJsonModelFromJson(jsonString);

import 'dart:convert';

GithubRepoJsonModel? githubRepoJsonModelFromJson(String str) =>
    GithubRepoJsonModel.fromJson(json.decode(str));

String githubRepoJsonModelToJson(GithubRepoJsonModel? data) =>
    json.encode(data!.toJson());

class GithubRepoJsonModel {
  GithubRepoJsonModel({
    this.id,
    this.name,
    this.fullName,
    this.htmlUrl,
    this.description,
    this.createdAt,
    this.updatedAt,
    this.pushedAt,
    this.language,
  });

  int? id;
  String? name;
  String? fullName;
  String? htmlUrl;
  String? description;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? pushedAt;
  String? language;

  factory GithubRepoJsonModel.fromJson(Map<String, dynamic> json) =>
      GithubRepoJsonModel(
        id: json["id"],
        name: json["name"],
        fullName: json["full_name"],
        htmlUrl: json["html_url"],
        description: json["description"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        pushedAt: DateTime.parse(json["pushed_at"]),
        language: json["language"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "full_name": fullName,
        "html_url": htmlUrl,
        "description": description,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "pushed_at": pushedAt?.toIso8601String(),
        "language": language,
      };
}
