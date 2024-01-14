// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'download_app_events.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DownloadEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() startDownload,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? startDownload,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? startDownload,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(StartDownloadEvent value) startDownload,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(StartDownloadEvent value)? startDownload,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StartDownloadEvent value)? startDownload,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DownloadEventCopyWith<$Res> {
  factory $DownloadEventCopyWith(
          DownloadEvent value, $Res Function(DownloadEvent) then) =
      _$DownloadEventCopyWithImpl<$Res, DownloadEvent>;
}

/// @nodoc
class _$DownloadEventCopyWithImpl<$Res, $Val extends DownloadEvent>
    implements $DownloadEventCopyWith<$Res> {
  _$DownloadEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$StartDownloadEventImplCopyWith<$Res> {
  factory _$$StartDownloadEventImplCopyWith(_$StartDownloadEventImpl value,
          $Res Function(_$StartDownloadEventImpl) then) =
      __$$StartDownloadEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StartDownloadEventImplCopyWithImpl<$Res>
    extends _$DownloadEventCopyWithImpl<$Res, _$StartDownloadEventImpl>
    implements _$$StartDownloadEventImplCopyWith<$Res> {
  __$$StartDownloadEventImplCopyWithImpl(_$StartDownloadEventImpl _value,
      $Res Function(_$StartDownloadEventImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$StartDownloadEventImpl implements StartDownloadEvent {
  const _$StartDownloadEventImpl();

  @override
  String toString() {
    return 'DownloadEvent.startDownload()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$StartDownloadEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() startDownload,
  }) {
    return startDownload();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? startDownload,
  }) {
    return startDownload?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? startDownload,
    required TResult orElse(),
  }) {
    if (startDownload != null) {
      return startDownload();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(StartDownloadEvent value) startDownload,
  }) {
    return startDownload(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(StartDownloadEvent value)? startDownload,
  }) {
    return startDownload?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StartDownloadEvent value)? startDownload,
    required TResult orElse(),
  }) {
    if (startDownload != null) {
      return startDownload(this);
    }
    return orElse();
  }
}

abstract class StartDownloadEvent implements DownloadEvent {
  const factory StartDownloadEvent() = _$StartDownloadEventImpl;
}
