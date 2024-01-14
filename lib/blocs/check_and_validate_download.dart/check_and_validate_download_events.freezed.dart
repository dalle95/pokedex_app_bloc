// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'check_and_validate_download_events.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CheckAndValidateEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() checkForUpdate,
    required TResult Function() validateDownload,
    required TResult Function() refuseDownload,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? checkForUpdate,
    TResult? Function()? validateDownload,
    TResult? Function()? refuseDownload,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? checkForUpdate,
    TResult Function()? validateDownload,
    TResult Function()? refuseDownload,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CheckForUpdateEvent value) checkForUpdate,
    required TResult Function(ValidateDownloadEvent value) validateDownload,
    required TResult Function(RefuseDownloadEvent value) refuseDownload,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CheckForUpdateEvent value)? checkForUpdate,
    TResult? Function(ValidateDownloadEvent value)? validateDownload,
    TResult? Function(RefuseDownloadEvent value)? refuseDownload,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CheckForUpdateEvent value)? checkForUpdate,
    TResult Function(ValidateDownloadEvent value)? validateDownload,
    TResult Function(RefuseDownloadEvent value)? refuseDownload,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CheckAndValidateEventCopyWith<$Res> {
  factory $CheckAndValidateEventCopyWith(CheckAndValidateEvent value,
          $Res Function(CheckAndValidateEvent) then) =
      _$CheckAndValidateEventCopyWithImpl<$Res, CheckAndValidateEvent>;
}

/// @nodoc
class _$CheckAndValidateEventCopyWithImpl<$Res,
        $Val extends CheckAndValidateEvent>
    implements $CheckAndValidateEventCopyWith<$Res> {
  _$CheckAndValidateEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$CheckForUpdateEventImplCopyWith<$Res> {
  factory _$$CheckForUpdateEventImplCopyWith(_$CheckForUpdateEventImpl value,
          $Res Function(_$CheckForUpdateEventImpl) then) =
      __$$CheckForUpdateEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CheckForUpdateEventImplCopyWithImpl<$Res>
    extends _$CheckAndValidateEventCopyWithImpl<$Res, _$CheckForUpdateEventImpl>
    implements _$$CheckForUpdateEventImplCopyWith<$Res> {
  __$$CheckForUpdateEventImplCopyWithImpl(_$CheckForUpdateEventImpl _value,
      $Res Function(_$CheckForUpdateEventImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$CheckForUpdateEventImpl implements CheckForUpdateEvent {
  const _$CheckForUpdateEventImpl();

  @override
  String toString() {
    return 'CheckAndValidateEvent.checkForUpdate()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CheckForUpdateEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() checkForUpdate,
    required TResult Function() validateDownload,
    required TResult Function() refuseDownload,
  }) {
    return checkForUpdate();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? checkForUpdate,
    TResult? Function()? validateDownload,
    TResult? Function()? refuseDownload,
  }) {
    return checkForUpdate?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? checkForUpdate,
    TResult Function()? validateDownload,
    TResult Function()? refuseDownload,
    required TResult orElse(),
  }) {
    if (checkForUpdate != null) {
      return checkForUpdate();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CheckForUpdateEvent value) checkForUpdate,
    required TResult Function(ValidateDownloadEvent value) validateDownload,
    required TResult Function(RefuseDownloadEvent value) refuseDownload,
  }) {
    return checkForUpdate(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CheckForUpdateEvent value)? checkForUpdate,
    TResult? Function(ValidateDownloadEvent value)? validateDownload,
    TResult? Function(RefuseDownloadEvent value)? refuseDownload,
  }) {
    return checkForUpdate?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CheckForUpdateEvent value)? checkForUpdate,
    TResult Function(ValidateDownloadEvent value)? validateDownload,
    TResult Function(RefuseDownloadEvent value)? refuseDownload,
    required TResult orElse(),
  }) {
    if (checkForUpdate != null) {
      return checkForUpdate(this);
    }
    return orElse();
  }
}

abstract class CheckForUpdateEvent implements CheckAndValidateEvent {
  const factory CheckForUpdateEvent() = _$CheckForUpdateEventImpl;
}

/// @nodoc
abstract class _$$ValidateDownloadEventImplCopyWith<$Res> {
  factory _$$ValidateDownloadEventImplCopyWith(
          _$ValidateDownloadEventImpl value,
          $Res Function(_$ValidateDownloadEventImpl) then) =
      __$$ValidateDownloadEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ValidateDownloadEventImplCopyWithImpl<$Res>
    extends _$CheckAndValidateEventCopyWithImpl<$Res,
        _$ValidateDownloadEventImpl>
    implements _$$ValidateDownloadEventImplCopyWith<$Res> {
  __$$ValidateDownloadEventImplCopyWithImpl(_$ValidateDownloadEventImpl _value,
      $Res Function(_$ValidateDownloadEventImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ValidateDownloadEventImpl implements ValidateDownloadEvent {
  const _$ValidateDownloadEventImpl();

  @override
  String toString() {
    return 'CheckAndValidateEvent.validateDownload()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ValidateDownloadEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() checkForUpdate,
    required TResult Function() validateDownload,
    required TResult Function() refuseDownload,
  }) {
    return validateDownload();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? checkForUpdate,
    TResult? Function()? validateDownload,
    TResult? Function()? refuseDownload,
  }) {
    return validateDownload?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? checkForUpdate,
    TResult Function()? validateDownload,
    TResult Function()? refuseDownload,
    required TResult orElse(),
  }) {
    if (validateDownload != null) {
      return validateDownload();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CheckForUpdateEvent value) checkForUpdate,
    required TResult Function(ValidateDownloadEvent value) validateDownload,
    required TResult Function(RefuseDownloadEvent value) refuseDownload,
  }) {
    return validateDownload(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CheckForUpdateEvent value)? checkForUpdate,
    TResult? Function(ValidateDownloadEvent value)? validateDownload,
    TResult? Function(RefuseDownloadEvent value)? refuseDownload,
  }) {
    return validateDownload?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CheckForUpdateEvent value)? checkForUpdate,
    TResult Function(ValidateDownloadEvent value)? validateDownload,
    TResult Function(RefuseDownloadEvent value)? refuseDownload,
    required TResult orElse(),
  }) {
    if (validateDownload != null) {
      return validateDownload(this);
    }
    return orElse();
  }
}

abstract class ValidateDownloadEvent implements CheckAndValidateEvent {
  const factory ValidateDownloadEvent() = _$ValidateDownloadEventImpl;
}

/// @nodoc
abstract class _$$RefuseDownloadEventImplCopyWith<$Res> {
  factory _$$RefuseDownloadEventImplCopyWith(_$RefuseDownloadEventImpl value,
          $Res Function(_$RefuseDownloadEventImpl) then) =
      __$$RefuseDownloadEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RefuseDownloadEventImplCopyWithImpl<$Res>
    extends _$CheckAndValidateEventCopyWithImpl<$Res, _$RefuseDownloadEventImpl>
    implements _$$RefuseDownloadEventImplCopyWith<$Res> {
  __$$RefuseDownloadEventImplCopyWithImpl(_$RefuseDownloadEventImpl _value,
      $Res Function(_$RefuseDownloadEventImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$RefuseDownloadEventImpl implements RefuseDownloadEvent {
  const _$RefuseDownloadEventImpl();

  @override
  String toString() {
    return 'CheckAndValidateEvent.refuseDownload()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RefuseDownloadEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() checkForUpdate,
    required TResult Function() validateDownload,
    required TResult Function() refuseDownload,
  }) {
    return refuseDownload();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? checkForUpdate,
    TResult? Function()? validateDownload,
    TResult? Function()? refuseDownload,
  }) {
    return refuseDownload?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? checkForUpdate,
    TResult Function()? validateDownload,
    TResult Function()? refuseDownload,
    required TResult orElse(),
  }) {
    if (refuseDownload != null) {
      return refuseDownload();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CheckForUpdateEvent value) checkForUpdate,
    required TResult Function(ValidateDownloadEvent value) validateDownload,
    required TResult Function(RefuseDownloadEvent value) refuseDownload,
  }) {
    return refuseDownload(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CheckForUpdateEvent value)? checkForUpdate,
    TResult? Function(ValidateDownloadEvent value)? validateDownload,
    TResult? Function(RefuseDownloadEvent value)? refuseDownload,
  }) {
    return refuseDownload?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CheckForUpdateEvent value)? checkForUpdate,
    TResult Function(ValidateDownloadEvent value)? validateDownload,
    TResult Function(RefuseDownloadEvent value)? refuseDownload,
    required TResult orElse(),
  }) {
    if (refuseDownload != null) {
      return refuseDownload(this);
    }
    return orElse();
  }
}

abstract class RefuseDownloadEvent implements CheckAndValidateEvent {
  const factory RefuseDownloadEvent() = _$RefuseDownloadEventImpl;
}
