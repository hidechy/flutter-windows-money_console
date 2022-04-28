// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'spend_item_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$SpendItemStateTearOff {
  const _$SpendItemStateTearOff();

  _SpendItemState call(
      {required String koumoku, required String price, required int bank}) {
    return _SpendItemState(
      koumoku: koumoku,
      price: price,
      bank: bank,
    );
  }
}

/// @nodoc
const $SpendItemState = _$SpendItemStateTearOff();

/// @nodoc
mixin _$SpendItemState {
  String get koumoku => throw _privateConstructorUsedError;
  String get price => throw _privateConstructorUsedError;
  int get bank => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SpendItemStateCopyWith<SpendItemState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SpendItemStateCopyWith<$Res> {
  factory $SpendItemStateCopyWith(
          SpendItemState value, $Res Function(SpendItemState) then) =
      _$SpendItemStateCopyWithImpl<$Res>;
  $Res call({String koumoku, String price, int bank});
}

/// @nodoc
class _$SpendItemStateCopyWithImpl<$Res>
    implements $SpendItemStateCopyWith<$Res> {
  _$SpendItemStateCopyWithImpl(this._value, this._then);

  final SpendItemState _value;
  // ignore: unused_field
  final $Res Function(SpendItemState) _then;

  @override
  $Res call({
    Object? koumoku = freezed,
    Object? price = freezed,
    Object? bank = freezed,
  }) {
    return _then(_value.copyWith(
      koumoku: koumoku == freezed
          ? _value.koumoku
          : koumoku // ignore: cast_nullable_to_non_nullable
              as String,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
      bank: bank == freezed
          ? _value.bank
          : bank // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$SpendItemStateCopyWith<$Res>
    implements $SpendItemStateCopyWith<$Res> {
  factory _$SpendItemStateCopyWith(
          _SpendItemState value, $Res Function(_SpendItemState) then) =
      __$SpendItemStateCopyWithImpl<$Res>;
  @override
  $Res call({String koumoku, String price, int bank});
}

/// @nodoc
class __$SpendItemStateCopyWithImpl<$Res>
    extends _$SpendItemStateCopyWithImpl<$Res>
    implements _$SpendItemStateCopyWith<$Res> {
  __$SpendItemStateCopyWithImpl(
      _SpendItemState _value, $Res Function(_SpendItemState) _then)
      : super(_value, (v) => _then(v as _SpendItemState));

  @override
  _SpendItemState get _value => super._value as _SpendItemState;

  @override
  $Res call({
    Object? koumoku = freezed,
    Object? price = freezed,
    Object? bank = freezed,
  }) {
    return _then(_SpendItemState(
      koumoku: koumoku == freezed
          ? _value.koumoku
          : koumoku // ignore: cast_nullable_to_non_nullable
              as String,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
      bank: bank == freezed
          ? _value.bank
          : bank // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_SpendItemState implements _SpendItemState {
  const _$_SpendItemState(
      {required this.koumoku, required this.price, required this.bank});

  @override
  final String koumoku;
  @override
  final String price;
  @override
  final int bank;

  @override
  String toString() {
    return 'SpendItemState(koumoku: $koumoku, price: $price, bank: $bank)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SpendItemState &&
            const DeepCollectionEquality().equals(other.koumoku, koumoku) &&
            const DeepCollectionEquality().equals(other.price, price) &&
            const DeepCollectionEquality().equals(other.bank, bank));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(koumoku),
      const DeepCollectionEquality().hash(price),
      const DeepCollectionEquality().hash(bank));

  @JsonKey(ignore: true)
  @override
  _$SpendItemStateCopyWith<_SpendItemState> get copyWith =>
      __$SpendItemStateCopyWithImpl<_SpendItemState>(this, _$identity);
}

abstract class _SpendItemState implements SpendItemState {
  const factory _SpendItemState(
      {required String koumoku,
      required String price,
      required int bank}) = _$_SpendItemState;

  @override
  String get koumoku;
  @override
  String get price;
  @override
  int get bank;
  @override
  @JsonKey(ignore: true)
  _$SpendItemStateCopyWith<_SpendItemState> get copyWith =>
      throw _privateConstructorUsedError;
}
