// ignore_for_file: file_names

class Post {
  String? title;
  String? body;

  Post({
    this.title,
    this.body,
  });

  factory Post.fromJson({required Map json}) {
    return Post(
      title: json["title"],
      body: json["body"],
    );
  }
}
