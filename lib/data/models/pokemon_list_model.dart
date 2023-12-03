class PokemonListModel {
  final String id;
  final String nome;

  PokemonListModel({
    required this.id,
    required this.nome,
  });

  @override
  String toString() => 'ID: $id | Nome: $nome ';

  factory PokemonListModel.fromJson(Map<String, dynamic> json) {
    String id;
    String nome;
    // Caso: con filtro per pokedex
    if (json.containsKey('pokemon_species')) {
      id = json['pokemon_species']['url']
          .replaceAll('https://pokeapi.co/api/v2/pokemon-species/', '')
          .replaceAll('/', '');
      nome = json['pokemon_species']['name'];
    }

    // Caso: con filtro per tipo
    else if (json.containsKey('pokemon')) {
      id = json['pokemon']['url']
          .replaceAll('https://pokeapi.co/api/v2/pokemon/', '')
          .replaceAll('/', '');
      nome = json['pokemon']['name'];
    }

    // Caso: senza filtro o con filtro per generazione
    else {
      id = json['url']
          .replaceAll('https://pokeapi.co/api/v2/pokemon/', '')
          .replaceAll('https://pokeapi.co/api/v2/pokemon-species/', '')
          .replaceAll('/', '');
      nome = json['name'];
    }

    return PokemonListModel(
      id: id,
      nome: nome,
    );
  }
}
