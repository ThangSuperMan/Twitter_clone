import 'dart:convert';

List<Post> postFromJson(String str) =>
    List<Post>.from(json.decode(str)["metadata"].map((x) => Post.fromJson(x)));

String postToJson(List<Post> data) =>
    json.encode({"metadata": List<dynamic>.from(data.map((x) => x.toJson()))});

class Post {
  Post({
    this.id,
    this.title,
    this.content,
    this.imageUrl,
    this.authorId,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? title;
  String? content;
  String? imageUrl;
  int? authorId;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        id: json["id"],
        title: json["title"],
        content: json["content"],
        imageUrl: json["image_url"],
        authorId: json["author_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at "]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "content": content,
        "image_url": imageUrl,
        "author_id": authorId,
        "created_at": createdAt!.toIso8601String(),
        "updated_at ": updatedAt!.toIso8601String(),
      };
}
