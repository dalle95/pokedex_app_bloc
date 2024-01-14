import 'package:freezed_annotation/freezed_annotation.dart';

part 'check_and_validate_download_states.freezed.dart';

// Stati associati al download
@freezed
class CheckAndValidateState with _$CheckAndValidateState {
  // Stati per gestione controllo nuova versione app
  // Stato: inizio controllo nuova versione app
  const factory CheckAndValidateState.check() = CheckDownloadState;
  // Stato: errore nel controllo nuova versione app
  const factory CheckAndValidateState.errorCheck() = ErrorCheckDownloadState;
  // Stato: nuova versione app non presente
  const factory CheckAndValidateState.noUpdate() = NoUpdateState;
  // Stato: nuova versione app presente, controllo validazione download nuova versione
  const factory CheckAndValidateState.checkValidationDownload() =
      CheckValidationDownloadState;
  // Stato: conferma download nuova versione
  const factory CheckAndValidateState.validateDownload() =
      ValidateDownloadState;
  // Stato: conferma negata download nuova versione
  const factory CheckAndValidateState.refuseDownload() = RefuseDownloadState;
}
