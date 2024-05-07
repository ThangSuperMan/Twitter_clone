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
    this.author,
  });

  int? id;
  String? title;
  String? content;
  String? imageUrl;
  int? authorId;
  DateTime? createdAt;
  DateTime? updatedAt;
  Author? author; // Change here

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        id: json["id"],
        title: json["title"],
        content: json["content"],
        imageUrl: json["image_url"],
        authorId: json["author_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at "]),
        author: Author.fromJson(json["author"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "content": content,
        "image_url": imageUrl,
        "author_id": authorId,
        "created_at": createdAt!.toIso8601String(),
        "updated_at ": updatedAt!.toIso8601String(),
        "author": author!.toJson(),
      };
}

class Author {
  Author({
    this.firstName,
    this.lastName,
  });

  String? firstName;
  String? lastName;

  factory Author.fromJson(Map<String, dynamic> json) => Author(
        firstName: json["first_name"],
        lastName: json["last_name"],
      );

  Map<String, dynamic> toJson() => {
        "first_name": firstName,
        "last_name": lastName,
      };
}
