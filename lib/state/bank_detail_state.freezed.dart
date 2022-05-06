// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'bank_detail_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$BankDetailStateTearOff {
  const _$BankDetailStateTearOff();

  _BankDetailState call(
      {required String bank, required AsyncValue<List<BankData>> record}) {
    return _BankDetailState(
      bank: bank,
      record: record,
    );
  }
}

/// @nodoc
const $BankDetailState = _$BankDetailStateTearOff();

/// @nodoc
mixin _$BankDetailState {
  String get bank => throw _privateConstructorUsedError;
  AsyncValue<List<BankData>> get record => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BankDetailStateCopyWith<BankDetailState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BankDetailStateCopyWith<$Res> {
  factory $BankDetailStateCopyWith(
          BankDetailState value, $Res Function(BankDetailState) then) =
      _$BankDetailStateCopyWithImpl<$Res>;
  $Res call({String bank, AsyncValue<List<BankData>> record});
}

/// @nodoc
class _$BankDetailStateCopyWithImpl<$Res>
    implements $BankDetailStateCopyWith<$Res> {
  _$BankDetailStateCopyWithImpl(this._value, this._then);

  final BankDetailState _value;
  // ignore: unused_field
  final $Res Function(BankDetailState) _then;

  @override
  $Res call({
    Object? bank = freezed,
    Object? record = freezed,
  }) {
    return _then(_value.copyWith(
      bank: bank == freezed
          ? _value.bank
          : bank // ignore: cast_nullable_to_non_nullable
              as String,
      record: record == freezed
          ? _value.record
          : record // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<BankData>>,
    ));
  }
}

/// @nodoc
abstract class _$BankDetailStateCopyWith<$Res>
    implements $BankDetailStateCopyWith<$Res> {
  factory _$BankDetailStateCopyWith(
          _BankDetailState value, $Res Function(_BankDetailState) then) =
      __$BankDetailStateCopyWithImpl<$Res>;
  @override
  $Res call({String bank, AsyncValue<List<BankData>> record});
}

/// @nodoc
class __$BankDetailStateCopyWithImpl<$Res>
    extends _$BankDetailStateCopyWithImpl<$Res>
    implements _$BankDetailStateCopyWith<$Res> {
  __$BankDetailStateCopyWithImpl(
      _BankDetailState _value, $Res Function(_BankDetailState) _then)
      : super(_value, (v) => _then(v as _BankDetailState));

  @override
  _BankDetailState get _value => super._value as _BankDetailState;

  @override
  $Res call({
    Object? bank = freezed,
    Object? record = freezed,
  }) {
    return _then(_BankDetailState(
      bank: bank == freezed
          ? _value.bank
          : bank // ignore: cast_nullable_to_non_nullable
              as String,
      record: record == freezed
          ? _value.record
          : record // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<BankData>>,
    ));
  }
}

/// @nodoc

class _$_BankDetailState implements _BankDetailState {
  const _$_BankDetailState({required this.bank, required this.record});

  @override
  final String bank;
  @override
  final AsyncValue<List<BankData>> record;

  @override
  String toString() {
    return 'BankDetailState(bank: $bank, record: $record)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _BankDetailState &&
            const DeepCollectionEquality().equals(other.bank, bank) &&
            const DeepCollectionEquality().equals(other.record, record));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(bank),
      const DeepCollectionEquality().hash(record));

  @JsonKey(ignore: true)
  @override
  _$BankDetailStateCopyWith<_BankDetailState> get copyWith =>
      __$BankDetailStateCopyWithImpl<_BankDetailState>(this, _$identity);
}

abstract class _BankDetailState implements BankDetailState {
  const factory _BankDetailState(
      {required String bank,
      required AsyncValue<List<BankData>> record}) = _$_BankDetailState;

  @override
  String get bank;
  @override
  AsyncValue<List<BankData>> get record;
  @override
  @JsonKey(ignore: true)
  _$BankDetailStateCopyWith<_BankDetailState> get copyWith =>
      throw _privateConstructorUsedError;
}
