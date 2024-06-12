class UserModel {
  String ?name;
  String ?email;
  String ?userId;
  String ?password;

  UserModel({this.name, this.email, this.userId, this.password});

  factory UserModel.fromJson(Map<String, dynamic>json)=>
      UserModel(
        name: json["name"],
        email: json["email"],
        userId: json["userId"],
        password: json['password'],

      );

  Map<String, dynamic> toJson() =>
      {

        "name": name,
        "email": email,
        "userId": userId,
        "password": password,


      };
}