import 'package:freezed_annotation/freezed_annotation.dart';

part 'download_app_states.freezed.dart';

// Stati associati al download
@freezed
class DownloadState with _$DownloadState {
  // Stati per gestione download nuova versione app
  // Stato: download nuova versione app in corso
  const factory DownloadState.initDownload() = DownloadInitState;
  // Stato: download nuova versione app in corso
  const factory DownloadState.inProgress(int percentuale) =
      DownloadInProgressState;
  // Stato: download nuova versione app completato
  const factory DownloadState.complete() = DownloadCompleteState;
  // Stato: download nuova versione app in errore
  const factory DownloadState.error(String error) = DownloadErrorState;
}
