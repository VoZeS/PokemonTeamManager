import 'dart:convert';

//import 'package:http/http.dart' as http;

class Pokemon {
  String name, type;
  String avatarUrl;
  int hp, attack, defense, specialAttack, specialDefense, speed;
  int weight;
  

  Pokemon({
    required this.name,
    required this.type,
    required this.avatarUrl,
    required this.hp,
    required this.attack,
    required this.defense,
    required this.specialAttack,
    required this.specialDefense,
    required this.speed,
    required this.weight,
    
  });

  // Pokemon.fromJson(Map<String, dynamic> json)
  //     : name = json["name"]["first"],
  //       type = json["name"]["last"],
  //       avatarUrl = json["picture"]["large"],
  //       hp = json["dob"]["age"],
  //       attack = json["email"],
  //       defense = json["login"]["username"];
  //       specialAttack = json["login"]["username"];
  //       specialDefense = json["login"]["username"];
  //       speed = json["login"]["username"];
  //       weight = json["login"]["username"];

  
}

// Future<List<User>> loadUserList([int numUsers = 50]) async {
//   final url = Uri.parse("https://randomuser.me/api/?results=$numUsers");
//   final response = await http.get(url);
//   final json = jsonDecode(response.body);
//   final List jsonUserList = json["results"];
//   List<User> userList = [];
//   for (final jsonUser in jsonUserList) {
//     userList.add(User.fromJson(jsonUser));
//   }
//   return userList;
// }
