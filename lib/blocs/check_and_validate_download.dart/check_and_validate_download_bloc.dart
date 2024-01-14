import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import '/blocs/check_and_validate_download.dart/check_and_validate_download_events.dart';
import '/blocs/check_and_validate_download.dart/check_and_validate_download_states.dart';
import '/repositories/download_app/download_app_repos_imp.dart';

// BLoC per gestire il download
class CheckAndValidateBloc
    extends Bloc<CheckAndValidateEvent, CheckAndValidateState> {
  // Gestione dei log
  var logger = Logger();

  final _downloadAppRepos = DownloadAppRepositoryImp();

  CheckAndValidateBloc() : super(const CheckDownloadState());

  @override
  Stream<CheckAndValidateState> mapEventToState(
      CheckAndValidateEvent event) async* {
    yield* event.when(
      checkForUpdate: () async* {
        // Controllo se è presente una nuova versione dell'app
        final nuovaVersioneApp = await _downloadAppRepos.checkNuovaVersione();

        // Controllo dello stato in base alla presenza della nuova versione
        if (nuovaVersioneApp == true) {
          yield const CheckValidationDownloadState();
        } else {
          logger.d('Stato: NoUpdateState');
          yield const NoUpdateState();
        }
      },
      validateDownload: () async* {
        // Permesso convalidato per il download della versione
        yield const ValidateDownloadState();
      },
      refuseDownload: () async* {
        // Permesso convalidato per il download della versione
        yield const RefuseDownloadState();
      },
    );
  }
}
