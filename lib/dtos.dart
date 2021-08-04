import 'dart:convert';

List<User> modelUserFromJson(String str) => List<User>.from(
    json.decode(str).map((x) => User.fromJson(x)));

String modelUserToJson(List<User> data) => json.encode(
    List<dynamic>.from(data.map((x) => x.toJson())));

class Geo {
  late final String lat;
  late final String lng;

  Map<String, dynamic> toJson() => {
    "lat": lat,
    "lng": lng,
  };
}

class Address{
  late final String street;
  late final String suite;
  late final String city;
  late final String zipcode;
  late final Geo geo;

  toJson() {}
}

class Company{
  late final String name;
  late final String catchPhrase;
  late final String bs;

  Map<String, dynamic> toJson() => {
    "name": name,
    "catchPhrase": catchPhrase,
    "bs": bs,
  };
}
class User{
  User({
    required this.id,
    required this.name
  });

  late final int id;
  late final String name;
  late final String username;
  late final String email;
  late final Address address;
  late final String phone;
  late final String website;
  late final Company company;
  
  factory User.fromJson(Map<dynamic, dynamic> json){
    return User(id: json['id'], name: json['name']);
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "username": username,
    "email": email,
    "address": address.toJson(),
    "phone": phone,
    "website": website,
    "company": company.toJson(),
  };
}
