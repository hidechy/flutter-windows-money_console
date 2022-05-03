// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'fund_detail_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$FundDetailStateTearOff {
  const _$FundDetailStateTearOff();

  _FundDetailState call(
      {required String date,
      required String basePrice,
      required String compareFront,
      required String yearlyReturn,
      required String upDown}) {
    return _FundDetailState(
      date: date,
      basePrice: basePrice,
      compareFront: compareFront,
      yearlyReturn: yearlyReturn,
      upDown: upDown,
    );
  }
}

/// @nodoc
const $FundDetailState = _$FundDetailStateTearOff();

/// @nodoc
mixin _$FundDetailState {
  String get date => throw _privateConstructorUsedError;
  String get basePrice => throw _privateConstructorUsedError;
  String get compareFront => throw _privateConstructorUsedError;
  String get yearlyReturn => throw _privateConstructorUsedError;
  String get upDown => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FundDetailStateCopyWith<FundDetailState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FundDetailStateCopyWith<$Res> {
  factory $FundDetailStateCopyWith(
          FundDetailState value, $Res Function(FundDetailState) then) =
      _$FundDetailStateCopyWithImpl<$Res>;
  $Res call(
      {String date,
      String basePrice,
      String compareFront,
      String yearlyReturn,
      String upDown});
}

/// @nodoc
class _$FundDetailStateCopyWithImpl<$Res>
    implements $FundDetailStateCopyWith<$Res> {
  _$FundDetailStateCopyWithImpl(this._value, this._then);

  final FundDetailState _value;
  // ignore: unused_field
  final $Res Function(FundDetailState) _then;

  @override
  $Res call({
    Object? date = freezed,
    Object? basePrice = freezed,
    Object? compareFront = freezed,
    Object? yearlyReturn = freezed,
    Object? upDown = freezed,
  }) {
    return _then(_value.copyWith(
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      basePrice: basePrice == freezed
          ? _value.basePrice
          : basePrice // ignore: cast_nullable_to_non_nullable
              as String,
      compareFront: compareFront == freezed
          ? _value.compareFront
          : compareFront // ignore: cast_nullable_to_non_nullable
              as String,
      yearlyReturn: yearlyReturn == freezed
          ? _value.yearlyReturn
          : yearlyReturn // ignore: cast_nullable_to_non_nullable
              as String,
      upDown: upDown == freezed
          ? _value.upDown
          : upDown // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$FundDetailStateCopyWith<$Res>
    implements $FundDetailStateCopyWith<$Res> {
  factory _$FundDetailStateCopyWith(
          _FundDetailState value, $Res Function(_FundDetailState) then) =
      __$FundDetailStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {String date,
      String basePrice,
      String compareFront,
      String yearlyReturn,
      String upDown});
}

/// @nodoc
class __$FundDetailStateCopyWithImpl<$Res>
    extends _$FundDetailStateCopyWithImpl<$Res>
    implements _$FundDetailStateCopyWith<$Res> {
  __$FundDetailStateCopyWithImpl(
      _FundDetailState _value, $Res Function(_FundDetailState) _then)
      : super(_value, (v) => _then(v as _FundDetailState));

  @override
  _FundDetailState get _value => super._value as _FundDetailState;

  @override
  $Res call({
    Object? date = freezed,
    Object? basePrice = freezed,
    Object? compareFront = freezed,
    Object? yearlyReturn = freezed,
    Object? upDown = freezed,
  }) {
    return _then(_FundDetailState(
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      basePrice: basePrice == freezed
          ? _value.basePrice
          : basePrice // ignore: cast_nullable_to_non_nullable
              as String,
      compareFront: compareFront == freezed
          ? _value.compareFront
          : compareFront // ignore: cast_nullable_to_non_nullable
              as String,
      yearlyReturn: yearlyReturn == freezed
          ? _value.yearlyReturn
          : yearlyReturn // ignore: cast_nullable_to_non_nullable
              as String,
      upDown: upDown == freezed
          ? _value.upDown
          : upDown // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_FundDetailState implements _FundDetailState {
  const _$_FundDetailState(
      {required this.date,
      required this.basePrice,
      required this.compareFront,
      required this.yearlyReturn,
      required this.upDown});

  @override
  final String date;
  @override
  final String basePrice;
  @override
  final String compareFront;
  @override
  final String yearlyReturn;
  @override
  final String upDown;

  @override
  String toString() {
    return 'FundDetailState(date: $date, basePrice: $basePrice, compareFront: $compareFront, yearlyReturn: $yearlyReturn, upDown: $upDown)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FundDetailState &&
            const DeepCollectionEquality().equals(other.date, date) &&
            const DeepCollectionEquality().equals(other.basePrice, basePrice) &&
            const DeepCollectionEquality()
                .equals(other.compareFront, compareFront) &&
            const DeepCollectionEquality()
                .equals(other.yearlyReturn, yearlyReturn) &&
            const DeepCollectionEquality().equals(other.upDown, upDown));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(date),
      const DeepCollectionEquality().hash(basePrice),
      const DeepCollectionEquality().hash(compareFront),
      const DeepCollectionEquality().hash(yearlyReturn),
      const DeepCollectionEquality().hash(upDown));

  @JsonKey(ignore: true)
  @override
  _$FundDetailStateCopyWith<_FundDetailState> get copyWith =>
      __$FundDetailStateCopyWithImpl<_FundDetailState>(this, _$identity);
}

abstract class _FundDetailState implements FundDetailState {
  const factory _FundDetailState(
      {required String date,
      required String basePrice,
      required String compareFront,
      required String yearlyReturn,
      required String upDown}) = _$_FundDetailState;

  @override
  String get date;
  @override
  String get basePrice;
  @override
  String get compareFront;
  @override
  String get yearlyReturn;
  @override
  String get upDown;
  @override
  @JsonKey(ignore: true)
  _$FundDetailStateCopyWith<_FundDetailState> get copyWith =>
      throw _privateConstructorUsedError;
}
