import 'package:freezed_annotation/freezed_annotation.dart';

part 'check_and_validate_download_events.freezed.dart';

// Eventi associati al download
@freezed
class CheckAndValidateEvent with _$CheckAndValidateEvent {
  // Eventi per gestione controllo nuova versione app
  // Evento: controllo nuova versione app
  const factory CheckAndValidateEvent.checkForUpdate() = CheckForUpdateEvent;
  // Evento: download validato
  const factory CheckAndValidateEvent.validateDownload() =
      ValidateDownloadEvent;
  // Evento: download rifiutato
  const factory CheckAndValidateEvent.refuseDownload() = RefuseDownloadEvent;
}
