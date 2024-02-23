import 'dart:convert';

class PostDetailsModel {
  int? userId;
  int? id;
  String? title;
  String? body;

  PostDetailsModel({
    this.userId,
    this.id,
    this.title,
    this.body,
  });

  factory PostDetailsModel.fromJson(Map<String, dynamic> json) => PostDetailsModel(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
      };
}
