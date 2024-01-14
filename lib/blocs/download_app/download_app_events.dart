import 'package:freezed_annotation/freezed_annotation.dart';

part 'download_app_events.freezed.dart';

// Eventi associati al download
@freezed
class DownloadEvent with _$DownloadEvent {
  const factory DownloadEvent.startDownload() = StartDownloadEvent;
}
