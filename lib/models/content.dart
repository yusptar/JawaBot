class Content {
  int? id;
  String? title;
  String? description;
  String? source;

  Content({this.id, this.title, this.description, this.source});

  Content.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    source = json['source'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['description'] = description;
    data['source'] = source;
    return data;
  }
}
