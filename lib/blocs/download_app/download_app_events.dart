import 'package:equatable/equatable.dart';

abstract class DownloadAppEventBloc extends Equatable {
  const DownloadAppEventBloc();
}

class DownloadAppEvent extends DownloadAppEventBloc {
  @override
  List<Object> get props => [];
}
