class LoginModel{
  String? status;
  User? user;
  Authorisation? authorisation;

  LoginModel.fromJson(Map<String, dynamic> json){
    status = json['status'];
    user = User.fromJson(json['user']);
    authorisation = Authorisation.fromJson(json['authorisation']);
  }
}

class User{
  int? id;
  String? name;
  String? email;
  String? email_verified_at;
  String? profile_image;
  String? created_at;
  String? updated_at;
  String? profile_url;

  User.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    email = json['email'];
    email_verified_at = json['email_verified_at'];
    profile_image = json['profile_image'];
    created_at = json['created_at'];
    updated_at = json['updated_at'];
    profile_url = json['profile_url'];

  }
}

class Authorisation{
  String? token;
  String? type;

  Authorisation.fromJson(Map<String, dynamic> json){
    token = json['token'];
    type = json['type'];
  }
}