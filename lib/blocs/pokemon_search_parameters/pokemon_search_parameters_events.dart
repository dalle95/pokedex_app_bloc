import 'package:equatable/equatable.dart';

abstract class SearchParametersEvent extends Equatable {
  const SearchParametersEvent();
}

class SpEvent extends SearchParametersEvent {
  @override
  List<Object> get props => [];
}
