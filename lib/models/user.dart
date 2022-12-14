class Users {
  String? id;
  String? email;
  String? name;
  String? password;
  String? status;
  String? bio;

  Users({this.id, this.email, this.name, this.password, this.status, this.bio});

  Users.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    name = json['name'];
    password = json['password'];
    status = json['status'];
    bio = json['bio'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['email'] = email;
    data['name'] = name;
    data['password'] = password;
    data['status'] = status;
    data['bio'] = bio;
    return data;
  }
}
