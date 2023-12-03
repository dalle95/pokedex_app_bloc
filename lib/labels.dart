final LabelMap labels = LabelMap();

class LabelMap {
  // Homepage
  String get homepageTitolo => 'Pokedex';

  // Pagina di ricerca
  String get searchPageTipo => 'Tipo';
  String get searchPagePokedex => 'Pokedex';
  String get searchPageGenerazione => 'Generazione';
  String get searchPageCerca => 'Cerca';

  // Pagina di dettaglio Pokemon
  String get pokemonDetailTipo => 'Tipo';
  String get pokemonDetailAltezza => 'Altezza';
  String get pokemonDetailPeso => 'Peso';
  String get pokemonDetailInfo => 'Info';
  String get pokemonDetailAbilita => 'Abilità';
  String get pokemonDetailStatistiche => 'Statistiche';
  String get pokemonDetailStatisticheTotali => 'Statistiche Totali';
  String get pokemonDetailMosse => 'Mosse';
  String get pokemonDetailHP => 'HP';
  String get pokemonDetailAttacco => 'ATK';
  String get pokemonDetailDifesa => 'DEF';
  String get pokemonDetailVelocita => 'SP';
  String get pokemonDetailAttaccoSpeciale => 'SP.ATK';
  String get pokemonDetailDifesaSpeciale => 'SP.DEF';

  // Formato data
  String get formatoData => 'dd/MM/yyyy';

  // Generiche
  String get conferma => 'Conferma';
  String get annulla => 'Annulla';

  // Aggiornamento App
  String get aggiornamentoApp => 'Aggiornamento';
  String get messaggioAggiornamento =>
      'É disponibile una nuova versione dell\'applicazione.\nPremendo su scarica verrà eseguito il download e aggiornata.';
  String get messaggioAggiornamentoErrore =>
      'Non è possibile aggiornare al momento aggiornare la versione.\nRiprova più tardi.';
  String get scarica => 'Scarica';
  String get initDownload => 'Inizializzazione download';
  String get progressDownload => 'Download in corso';

  // Errori
  String get erroreTitolo => 'Si è verificato un errore';
}
