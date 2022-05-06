// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'salary_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$SalaryStateTearOff {
  const _$SalaryStateTearOff();

  _SalaryState call(
      {required String date,
      required String ym,
      required String price,
      required String company}) {
    return _SalaryState(
      date: date,
      ym: ym,
      price: price,
      company: company,
    );
  }
}

/// @nodoc
const $SalaryState = _$SalaryStateTearOff();

/// @nodoc
mixin _$SalaryState {
  String get date => throw _privateConstructorUsedError;
  String get ym => throw _privateConstructorUsedError;
  String get price => throw _privateConstructorUsedError;
  String get company => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SalaryStateCopyWith<SalaryState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SalaryStateCopyWith<$Res> {
  factory $SalaryStateCopyWith(
          SalaryState value, $Res Function(SalaryState) then) =
      _$SalaryStateCopyWithImpl<$Res>;
  $Res call({String date, String ym, String price, String company});
}

/// @nodoc
class _$SalaryStateCopyWithImpl<$Res> implements $SalaryStateCopyWith<$Res> {
  _$SalaryStateCopyWithImpl(this._value, this._then);

  final SalaryState _value;
  // ignore: unused_field
  final $Res Function(SalaryState) _then;

  @override
  $Res call({
    Object? date = freezed,
    Object? ym = freezed,
    Object? price = freezed,
    Object? company = freezed,
  }) {
    return _then(_value.copyWith(
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      ym: ym == freezed
          ? _value.ym
          : ym // ignore: cast_nullable_to_non_nullable
              as String,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
      company: company == freezed
          ? _value.company
          : company // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$SalaryStateCopyWith<$Res>
    implements $SalaryStateCopyWith<$Res> {
  factory _$SalaryStateCopyWith(
          _SalaryState value, $Res Function(_SalaryState) then) =
      __$SalaryStateCopyWithImpl<$Res>;
  @override
  $Res call({String date, String ym, String price, String company});
}

/// @nodoc
class __$SalaryStateCopyWithImpl<$Res> extends _$SalaryStateCopyWithImpl<$Res>
    implements _$SalaryStateCopyWith<$Res> {
  __$SalaryStateCopyWithImpl(
      _SalaryState _value, $Res Function(_SalaryState) _then)
      : super(_value, (v) => _then(v as _SalaryState));

  @override
  _SalaryState get _value => super._value as _SalaryState;

  @override
  $Res call({
    Object? date = freezed,
    Object? ym = freezed,
    Object? price = freezed,
    Object? company = freezed,
  }) {
    return _then(_SalaryState(
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      ym: ym == freezed
          ? _value.ym
          : ym // ignore: cast_nullable_to_non_nullable
              as String,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
      company: company == freezed
          ? _value.company
          : company // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_SalaryState implements _SalaryState {
  const _$_SalaryState(
      {required this.date,
      required this.ym,
      required this.price,
      required this.company});

  @override
  final String date;
  @override
  final String ym;
  @override
  final String price;
  @override
  final String company;

  @override
  String toString() {
    return 'SalaryState(date: $date, ym: $ym, price: $price, company: $company)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SalaryState &&
            const DeepCollectionEquality().equals(other.date, date) &&
            const DeepCollectionEquality().equals(other.ym, ym) &&
            const DeepCollectionEquality().equals(other.price, price) &&
            const DeepCollectionEquality().equals(other.company, company));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(date),
      const DeepCollectionEquality().hash(ym),
      const DeepCollectionEquality().hash(price),
      const DeepCollectionEquality().hash(company));

  @JsonKey(ignore: true)
  @override
  _$SalaryStateCopyWith<_SalaryState> get copyWith =>
      __$SalaryStateCopyWithImpl<_SalaryState>(this, _$identity);
}

abstract class _SalaryState implements SalaryState {
  const factory _SalaryState(
      {required String date,
      required String ym,
      required String price,
      required String company}) = _$_SalaryState;

  @override
  String get date;
  @override
  String get ym;
  @override
  String get price;
  @override
  String get company;
  @override
  @JsonKey(ignore: true)
  _$SalaryStateCopyWith<_SalaryState> get copyWith =>
      throw _privateConstructorUsedError;
}
