// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'year_month_summary_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$YearMonthSummaryStateTearOff {
  const _$YearMonthSummaryStateTearOff();

  _YearMonthSummaryState call(
      {List<Map<String, dynamic>> yearMonthSummaryData = const [
        {"aaa": "aaa"}
      ]}) {
    return _YearMonthSummaryState(
      yearMonthSummaryData: yearMonthSummaryData,
    );
  }
}

/// @nodoc
const $YearMonthSummaryState = _$YearMonthSummaryStateTearOff();

/// @nodoc
mixin _$YearMonthSummaryState {
  List<Map<String, dynamic>> get yearMonthSummaryData =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $YearMonthSummaryStateCopyWith<YearMonthSummaryState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $YearMonthSummaryStateCopyWith<$Res> {
  factory $YearMonthSummaryStateCopyWith(YearMonthSummaryState value,
          $Res Function(YearMonthSummaryState) then) =
      _$YearMonthSummaryStateCopyWithImpl<$Res>;
  $Res call({List<Map<String, dynamic>> yearMonthSummaryData});
}

/// @nodoc
class _$YearMonthSummaryStateCopyWithImpl<$Res>
    implements $YearMonthSummaryStateCopyWith<$Res> {
  _$YearMonthSummaryStateCopyWithImpl(this._value, this._then);

  final YearMonthSummaryState _value;
  // ignore: unused_field
  final $Res Function(YearMonthSummaryState) _then;

  @override
  $Res call({
    Object? yearMonthSummaryData = freezed,
  }) {
    return _then(_value.copyWith(
      yearMonthSummaryData: yearMonthSummaryData == freezed
          ? _value.yearMonthSummaryData
          : yearMonthSummaryData // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
    ));
  }
}

/// @nodoc
abstract class _$YearMonthSummaryStateCopyWith<$Res>
    implements $YearMonthSummaryStateCopyWith<$Res> {
  factory _$YearMonthSummaryStateCopyWith(_YearMonthSummaryState value,
          $Res Function(_YearMonthSummaryState) then) =
      __$YearMonthSummaryStateCopyWithImpl<$Res>;
  @override
  $Res call({List<Map<String, dynamic>> yearMonthSummaryData});
}

/// @nodoc
class __$YearMonthSummaryStateCopyWithImpl<$Res>
    extends _$YearMonthSummaryStateCopyWithImpl<$Res>
    implements _$YearMonthSummaryStateCopyWith<$Res> {
  __$YearMonthSummaryStateCopyWithImpl(_YearMonthSummaryState _value,
      $Res Function(_YearMonthSummaryState) _then)
      : super(_value, (v) => _then(v as _YearMonthSummaryState));

  @override
  _YearMonthSummaryState get _value => super._value as _YearMonthSummaryState;

  @override
  $Res call({
    Object? yearMonthSummaryData = freezed,
  }) {
    return _then(_YearMonthSummaryState(
      yearMonthSummaryData: yearMonthSummaryData == freezed
          ? _value.yearMonthSummaryData
          : yearMonthSummaryData // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
    ));
  }
}

/// @nodoc

class _$_YearMonthSummaryState implements _YearMonthSummaryState {
  const _$_YearMonthSummaryState(
      {this.yearMonthSummaryData = const [
        {"aaa": "aaa"}
      ]});

  @JsonKey()
  @override
  final List<Map<String, dynamic>> yearMonthSummaryData;

  @override
  String toString() {
    return 'YearMonthSummaryState(yearMonthSummaryData: $yearMonthSummaryData)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _YearMonthSummaryState &&
            const DeepCollectionEquality()
                .equals(other.yearMonthSummaryData, yearMonthSummaryData));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(yearMonthSummaryData));

  @JsonKey(ignore: true)
  @override
  _$YearMonthSummaryStateCopyWith<_YearMonthSummaryState> get copyWith =>
      __$YearMonthSummaryStateCopyWithImpl<_YearMonthSummaryState>(
          this, _$identity);
}

abstract class _YearMonthSummaryState implements YearMonthSummaryState {
  const factory _YearMonthSummaryState(
          {List<Map<String, dynamic>> yearMonthSummaryData}) =
      _$_YearMonthSummaryState;

  @override
  List<Map<String, dynamic>> get yearMonthSummaryData;
  @override
  @JsonKey(ignore: true)
  _$YearMonthSummaryStateCopyWith<_YearMonthSummaryState> get copyWith =>
      throw _privateConstructorUsedError;
}
