import 'dart:convert';

import 'package:http/http.dart' as http;

const urlPrefix = "https://pokeapi.co/api/v2/pokemon/";

int extractPokemonID(Map<String, dynamic> json) {
  final url = json['url'] as String;
  final idstr = url.substring(urlPrefix.length, url.length - 1);
  return int.parse(idstr);
}

class Pokemon {
  int id;
  String name;
  String? type;
  String? avatarUrl;
  // int hp, attack, defense, specialAttack, specialDefense, speed;

  // Pokemon({
  //   required this.name,
  //   required this.type,
  //   required this.avatarUrl,
  //   // required this.hp,
  //   // required this.attack,
  //   // required this.defense,
  //   // required this.specialAttack,
  //   // required this.specialDefense,
  //   // required this.speed,
  // });

  Pokemon.fromJsonFull(Map<String, dynamic> json)
      : id = extractPokemonID(json),
        name = json["name"],
        type = json["types"]["type"]["name"],
        avatarUrl = json["sprites"]["front_default"];
  // hp = json["dob"]["age"],
  // attack = json["email"],
  // defense = json["login"]["username"],
  // specialAttack = json["login"]["username"],
  // specialDefense = json["login"]["username"],
  // speed = json["login"]["username"];

  Pokemon.fromJsonLean(Map<String, dynamic> json)
      : id = extractPokemonID(json),
        name = json["name"];
}
//We are only using the 1st gen pokemons (151)

Future<List<Pokemon>> loadUserList([int numPokemons = 151]) async {
  final url = Uri.parse(
      "https://pokeapi.co/api/v2/pokemon?limit=$numPokemons&offset=0");
  final response = await http.get(url);
  final json = jsonDecode(response.body);
  final List jsonPokemonList = json["results"];
  List<Pokemon> userList = [];
  for (final jsonPokemon in jsonPokemonList) {
    userList.add(Pokemon.fromJsonLean(jsonPokemon));
  }
  return userList;
}

Future<Pokemon> loadPokemon(int id) async {
  final url = Uri.parse("https://pokeapi.co/api/v2/pokemon/$id/");
  final response = await http.get(url);
  final json = jsonDecode(response.body);
  return Pokemon.fromJsonFull(json);
}
