class Geo {
  late final String lat;
  late final String lng;
}

class Address{
  late final String street;
  late final String suite;
  late final String city;
  late final String zipcode;
  late final Geo geo;
}

class Company{
  late final String name;
  late final String catchPhrase;
  late final String bs;
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

  factory User.fromJson(Map<String, dynamic> json){
    return User(id: json['id'], name: json['name']);
  }

}