// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'download_app_states.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DownloadState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initDownload,
    required TResult Function(int percentuale) inProgress,
    required TResult Function() complete,
    required TResult Function(String error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initDownload,
    TResult? Function(int percentuale)? inProgress,
    TResult? Function()? complete,
    TResult? Function(String error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initDownload,
    TResult Function(int percentuale)? inProgress,
    TResult Function()? complete,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DownloadInitState value) initDownload,
    required TResult Function(DownloadInProgressState value) inProgress,
    required TResult Function(DownloadCompleteState value) complete,
    required TResult Function(DownloadErrorState value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DownloadInitState value)? initDownload,
    TResult? Function(DownloadInProgressState value)? inProgress,
    TResult? Function(DownloadCompleteState value)? complete,
    TResult? Function(DownloadErrorState value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DownloadInitState value)? initDownload,
    TResult Function(DownloadInProgressState value)? inProgress,
    TResult Function(DownloadCompleteState value)? complete,
    TResult Function(DownloadErrorState value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DownloadStateCopyWith<$Res> {
  factory $DownloadStateCopyWith(
          DownloadState value, $Res Function(DownloadState) then) =
      _$DownloadStateCopyWithImpl<$Res, DownloadState>;
}

/// @nodoc
class _$DownloadStateCopyWithImpl<$Res, $Val extends DownloadState>
    implements $DownloadStateCopyWith<$Res> {
  _$DownloadStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$DownloadInitStateImplCopyWith<$Res> {
  factory _$$DownloadInitStateImplCopyWith(_$DownloadInitStateImpl value,
          $Res Function(_$DownloadInitStateImpl) then) =
      __$$DownloadInitStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DownloadInitStateImplCopyWithImpl<$Res>
    extends _$DownloadStateCopyWithImpl<$Res, _$DownloadInitStateImpl>
    implements _$$DownloadInitStateImplCopyWith<$Res> {
  __$$DownloadInitStateImplCopyWithImpl(_$DownloadInitStateImpl _value,
      $Res Function(_$DownloadInitStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$DownloadInitStateImpl implements DownloadInitState {
  const _$DownloadInitStateImpl();

  @override
  String toString() {
    return 'DownloadState.initDownload()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$DownloadInitStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initDownload,
    required TResult Function(int percentuale) inProgress,
    required TResult Function() complete,
    required TResult Function(String error) error,
  }) {
    return initDownload();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initDownload,
    TResult? Function(int percentuale)? inProgress,
    TResult? Function()? complete,
    TResult? Function(String error)? error,
  }) {
    return initDownload?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initDownload,
    TResult Function(int percentuale)? inProgress,
    TResult Function()? complete,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (initDownload != null) {
      return initDownload();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DownloadInitState value) initDownload,
    required TResult Function(DownloadInProgressState value) inProgress,
    required TResult Function(DownloadCompleteState value) complete,
    required TResult Function(DownloadErrorState value) error,
  }) {
    return initDownload(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DownloadInitState value)? initDownload,
    TResult? Function(DownloadInProgressState value)? inProgress,
    TResult? Function(DownloadCompleteState value)? complete,
    TResult? Function(DownloadErrorState value)? error,
  }) {
    return initDownload?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DownloadInitState value)? initDownload,
    TResult Function(DownloadInProgressState value)? inProgress,
    TResult Function(DownloadCompleteState value)? complete,
    TResult Function(DownloadErrorState value)? error,
    required TResult orElse(),
  }) {
    if (initDownload != null) {
      return initDownload(this);
    }
    return orElse();
  }
}

abstract class DownloadInitState implements DownloadState {
  const factory DownloadInitState() = _$DownloadInitStateImpl;
}

/// @nodoc
abstract class _$$DownloadInProgressStateImplCopyWith<$Res> {
  factory _$$DownloadInProgressStateImplCopyWith(
          _$DownloadInProgressStateImpl value,
          $Res Function(_$DownloadInProgressStateImpl) then) =
      __$$DownloadInProgressStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int percentuale});
}

/// @nodoc
class __$$DownloadInProgressStateImplCopyWithImpl<$Res>
    extends _$DownloadStateCopyWithImpl<$Res, _$DownloadInProgressStateImpl>
    implements _$$DownloadInProgressStateImplCopyWith<$Res> {
  __$$DownloadInProgressStateImplCopyWithImpl(
      _$DownloadInProgressStateImpl _value,
      $Res Function(_$DownloadInProgressStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? percentuale = null,
  }) {
    return _then(_$DownloadInProgressStateImpl(
      null == percentuale
          ? _value.percentuale
          : percentuale // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$DownloadInProgressStateImpl implements DownloadInProgressState {
  const _$DownloadInProgressStateImpl(this.percentuale);

  @override
  final int percentuale;

  @override
  String toString() {
    return 'DownloadState.inProgress(percentuale: $percentuale)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DownloadInProgressStateImpl &&
            (identical(other.percentuale, percentuale) ||
                other.percentuale == percentuale));
  }

  @override
  int get hashCode => Object.hash(runtimeType, percentuale);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DownloadInProgressStateImplCopyWith<_$DownloadInProgressStateImpl>
      get copyWith => __$$DownloadInProgressStateImplCopyWithImpl<
          _$DownloadInProgressStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initDownload,
    required TResult Function(int percentuale) inProgress,
    required TResult Function() complete,
    required TResult Function(String error) error,
  }) {
    return inProgress(percentuale);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initDownload,
    TResult? Function(int percentuale)? inProgress,
    TResult? Function()? complete,
    TResult? Function(String error)? error,
  }) {
    return inProgress?.call(percentuale);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initDownload,
    TResult Function(int percentuale)? inProgress,
    TResult Function()? complete,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (inProgress != null) {
      return inProgress(percentuale);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DownloadInitState value) initDownload,
    required TResult Function(DownloadInProgressState value) inProgress,
    required TResult Function(DownloadCompleteState value) complete,
    required TResult Function(DownloadErrorState value) error,
  }) {
    return inProgress(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DownloadInitState value)? initDownload,
    TResult? Function(DownloadInProgressState value)? inProgress,
    TResult? Function(DownloadCompleteState value)? complete,
    TResult? Function(DownloadErrorState value)? error,
  }) {
    return inProgress?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DownloadInitState value)? initDownload,
    TResult Function(DownloadInProgressState value)? inProgress,
    TResult Function(DownloadCompleteState value)? complete,
    TResult Function(DownloadErrorState value)? error,
    required TResult orElse(),
  }) {
    if (inProgress != null) {
      return inProgress(this);
    }
    return orElse();
  }
}

abstract class DownloadInProgressState implements DownloadState {
  const factory DownloadInProgressState(final int percentuale) =
      _$DownloadInProgressStateImpl;

  int get percentuale;
  @JsonKey(ignore: true)
  _$$DownloadInProgressStateImplCopyWith<_$DownloadInProgressStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DownloadCompleteStateImplCopyWith<$Res> {
  factory _$$DownloadCompleteStateImplCopyWith(
          _$DownloadCompleteStateImpl value,
          $Res Function(_$DownloadCompleteStateImpl) then) =
      __$$DownloadCompleteStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DownloadCompleteStateImplCopyWithImpl<$Res>
    extends _$DownloadStateCopyWithImpl<$Res, _$DownloadCompleteStateImpl>
    implements _$$DownloadCompleteStateImplCopyWith<$Res> {
  __$$DownloadCompleteStateImplCopyWithImpl(_$DownloadCompleteStateImpl _value,
      $Res Function(_$DownloadCompleteStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$DownloadCompleteStateImpl implements DownloadCompleteState {
  const _$DownloadCompleteStateImpl();

  @override
  String toString() {
    return 'DownloadState.complete()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DownloadCompleteStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initDownload,
    required TResult Function(int percentuale) inProgress,
    required TResult Function() complete,
    required TResult Function(String error) error,
  }) {
    return complete();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initDownload,
    TResult? Function(int percentuale)? inProgress,
    TResult? Function()? complete,
    TResult? Function(String error)? error,
  }) {
    return complete?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initDownload,
    TResult Function(int percentuale)? inProgress,
    TResult Function()? complete,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (complete != null) {
      return complete();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DownloadInitState value) initDownload,
    required TResult Function(DownloadInProgressState value) inProgress,
    required TResult Function(DownloadCompleteState value) complete,
    required TResult Function(DownloadErrorState value) error,
  }) {
    return complete(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DownloadInitState value)? initDownload,
    TResult? Function(DownloadInProgressState value)? inProgress,
    TResult? Function(DownloadCompleteState value)? complete,
    TResult? Function(DownloadErrorState value)? error,
  }) {
    return complete?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DownloadInitState value)? initDownload,
    TResult Function(DownloadInProgressState value)? inProgress,
    TResult Function(DownloadCompleteState value)? complete,
    TResult Function(DownloadErrorState value)? error,
    required TResult orElse(),
  }) {
    if (complete != null) {
      return complete(this);
    }
    return orElse();
  }
}

abstract class DownloadCompleteState implements DownloadState {
  const factory DownloadCompleteState() = _$DownloadCompleteStateImpl;
}

/// @nodoc
abstract class _$$DownloadErrorStateImplCopyWith<$Res> {
  factory _$$DownloadErrorStateImplCopyWith(_$DownloadErrorStateImpl value,
          $Res Function(_$DownloadErrorStateImpl) then) =
      __$$DownloadErrorStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$DownloadErrorStateImplCopyWithImpl<$Res>
    extends _$DownloadStateCopyWithImpl<$Res, _$DownloadErrorStateImpl>
    implements _$$DownloadErrorStateImplCopyWith<$Res> {
  __$$DownloadErrorStateImplCopyWithImpl(_$DownloadErrorStateImpl _value,
      $Res Function(_$DownloadErrorStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$DownloadErrorStateImpl(
      null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$DownloadErrorStateImpl implements DownloadErrorState {
  const _$DownloadErrorStateImpl(this.error);

  @override
  final String error;

  @override
  String toString() {
    return 'DownloadState.error(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DownloadErrorStateImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DownloadErrorStateImplCopyWith<_$DownloadErrorStateImpl> get copyWith =>
      __$$DownloadErrorStateImplCopyWithImpl<_$DownloadErrorStateImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initDownload,
    required TResult Function(int percentuale) inProgress,
    required TResult Function() complete,
    required TResult Function(String error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initDownload,
    TResult? Function(int percentuale)? inProgress,
    TResult? Function()? complete,
    TResult? Function(String error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initDownload,
    TResult Function(int percentuale)? inProgress,
    TResult Function()? complete,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DownloadInitState value) initDownload,
    required TResult Function(DownloadInProgressState value) inProgress,
    required TResult Function(DownloadCompleteState value) complete,
    required TResult Function(DownloadErrorState value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DownloadInitState value)? initDownload,
    TResult? Function(DownloadInProgressState value)? inProgress,
    TResult? Function(DownloadCompleteState value)? complete,
    TResult? Function(DownloadErrorState value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DownloadInitState value)? initDownload,
    TResult Function(DownloadInProgressState value)? inProgress,
    TResult Function(DownloadCompleteState value)? complete,
    TResult Function(DownloadErrorState value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class DownloadErrorState implements DownloadState {
  const factory DownloadErrorState(final String error) =
      _$DownloadErrorStateImpl;

  String get error;
  @JsonKey(ignore: true)
  _$$DownloadErrorStateImplCopyWith<_$DownloadErrorStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
