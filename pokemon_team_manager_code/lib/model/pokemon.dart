import 'dart:convert';

import 'package:http/http.dart' as http;

class Pokemon {
  String name, type;
  String avatarUrl;
 // int hp, attack, defense, specialAttack, specialDefense, speed;
  

  Pokemon({
    required this.name,
    required this.type,
    required this.avatarUrl,
    // required this.hp,
    // required this.attack,
    // required this.defense,
    // required this.specialAttack,
    // required this.specialDefense,
    // required this.speed,
    
  });

  Pokemon.fromJson(Map<String, dynamic> json)
      : name = json["name"],
        type = json["types"]["type"]["name"],
        avatarUrl = json["sprites"]["front_default"];
        // hp = json["dob"]["age"],
        // attack = json["email"],
        // defense = json["login"]["username"],
        // specialAttack = json["login"]["username"],
        // specialDefense = json["login"]["username"],
        // speed = json["login"]["username"];
         
}
//We are only using the 1st gen pokemons (151)

 Future<List<Pokemon>> loadUserList([int numPokemons = 151]) async {
   final url = Uri.parse("https://pokeapi.co/api/v2/pokemon/$numPokemons/");
   final response = await http.get(url);
   final json = jsonDecode(response.body);
   final List jsonPokemonList = json["results"];
   List<Pokemon> userList = [];
   for (final jsonPokemon in jsonPokemonList) {
     userList.add(Pokemon.fromJson(jsonPokemon));
   }
   return userList;
 }
