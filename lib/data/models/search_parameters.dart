class SearchParametersModel {
  final List<String> tipi;
  final List<String> pokedex;
  final List<String> generazioni;

  SearchParametersModel({
    required this.tipi,
    required this.pokedex,
    required this.generazioni,
  });

  @override
  String toString() =>
      'tipo: $tipi | pokedex: $pokedex | generazione: $generazioni';
}
