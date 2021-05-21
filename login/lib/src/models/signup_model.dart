// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';


class signup {
  signup({
    this.message,
    this.user,
  });

  String ? message;
  User ? user;

  factory signup.fromJson(Map<String, dynamic> json) => signup(
    message: json["message"],
    user: User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "user": user!.toJson(),
  };
}

class User {
  User({
    this.isAdmin,
    this.id,
    this.name,
    this.email,
    this.password,
    this.phone,
    this.city,
    this.registrationDate,
    this.v,
  });

  bool ? isAdmin;
  String ? id;
  String ? name;
  String? email;
  String ? password;
  int ? phone;
  String ? city;
  DateTime ? registrationDate;
  int? v;

  factory User.fromJson(Map<String, dynamic> json) => User(
    isAdmin: json["isAdmin"],
    id: json["_id"],
    name: json["name"],
    email: json["email"],
    password: json["password"],
    phone: json["phone"],
    city: json["city"],
    registrationDate: DateTime.parse(json["registrationDate"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "isAdmin": isAdmin,
    "_id": id,
    "name": name,
    "email": email,
    "password": password,
    "phone": phone,
    "city": city,
    "registrationDate": registrationDate!.toIso8601String(),
    "__v": v,
  };
}
