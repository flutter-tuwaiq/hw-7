class Post {
  int? id;
  String? title;
  String? content;
  String? auther;

  Post({this.id, this.title, this.content, this.auther});

  Post.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    content = json['content'];
    auther = json['auther'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['content'] = this.content;
    data['auther'] = this.auther;
    return data;
  }
}
