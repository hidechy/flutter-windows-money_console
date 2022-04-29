// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'food_expenses_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$FoodExpensesStateTearOff {
  const _$FoodExpensesStateTearOff();

  _FoodExpensesState call(
      {required List<MonthSummaryData> monthSummaryDataList,
      required List<SeiyuPurchaseData> seiyuPurchaseDataList}) {
    return _FoodExpensesState(
      monthSummaryDataList: monthSummaryDataList,
      seiyuPurchaseDataList: seiyuPurchaseDataList,
    );
  }
}

/// @nodoc
const $FoodExpensesState = _$FoodExpensesStateTearOff();

/// @nodoc
mixin _$FoodExpensesState {
  List<MonthSummaryData> get monthSummaryDataList =>
      throw _privateConstructorUsedError;
  List<SeiyuPurchaseData> get seiyuPurchaseDataList =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FoodExpensesStateCopyWith<FoodExpensesState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FoodExpensesStateCopyWith<$Res> {
  factory $FoodExpensesStateCopyWith(
          FoodExpensesState value, $Res Function(FoodExpensesState) then) =
      _$FoodExpensesStateCopyWithImpl<$Res>;
  $Res call(
      {List<MonthSummaryData> monthSummaryDataList,
      List<SeiyuPurchaseData> seiyuPurchaseDataList});
}

/// @nodoc
class _$FoodExpensesStateCopyWithImpl<$Res>
    implements $FoodExpensesStateCopyWith<$Res> {
  _$FoodExpensesStateCopyWithImpl(this._value, this._then);

  final FoodExpensesState _value;
  // ignore: unused_field
  final $Res Function(FoodExpensesState) _then;

  @override
  $Res call({
    Object? monthSummaryDataList = freezed,
    Object? seiyuPurchaseDataList = freezed,
  }) {
    return _then(_value.copyWith(
      monthSummaryDataList: monthSummaryDataList == freezed
          ? _value.monthSummaryDataList
          : monthSummaryDataList // ignore: cast_nullable_to_non_nullable
              as List<MonthSummaryData>,
      seiyuPurchaseDataList: seiyuPurchaseDataList == freezed
          ? _value.seiyuPurchaseDataList
          : seiyuPurchaseDataList // ignore: cast_nullable_to_non_nullable
              as List<SeiyuPurchaseData>,
    ));
  }
}

/// @nodoc
abstract class _$FoodExpensesStateCopyWith<$Res>
    implements $FoodExpensesStateCopyWith<$Res> {
  factory _$FoodExpensesStateCopyWith(
          _FoodExpensesState value, $Res Function(_FoodExpensesState) then) =
      __$FoodExpensesStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<MonthSummaryData> monthSummaryDataList,
      List<SeiyuPurchaseData> seiyuPurchaseDataList});
}

/// @nodoc
class __$FoodExpensesStateCopyWithImpl<$Res>
    extends _$FoodExpensesStateCopyWithImpl<$Res>
    implements _$FoodExpensesStateCopyWith<$Res> {
  __$FoodExpensesStateCopyWithImpl(
      _FoodExpensesState _value, $Res Function(_FoodExpensesState) _then)
      : super(_value, (v) => _then(v as _FoodExpensesState));

  @override
  _FoodExpensesState get _value => super._value as _FoodExpensesState;

  @override
  $Res call({
    Object? monthSummaryDataList = freezed,
    Object? seiyuPurchaseDataList = freezed,
  }) {
    return _then(_FoodExpensesState(
      monthSummaryDataList: monthSummaryDataList == freezed
          ? _value.monthSummaryDataList
          : monthSummaryDataList // ignore: cast_nullable_to_non_nullable
              as List<MonthSummaryData>,
      seiyuPurchaseDataList: seiyuPurchaseDataList == freezed
          ? _value.seiyuPurchaseDataList
          : seiyuPurchaseDataList // ignore: cast_nullable_to_non_nullable
              as List<SeiyuPurchaseData>,
    ));
  }
}

/// @nodoc

class _$_FoodExpensesState implements _FoodExpensesState {
  const _$_FoodExpensesState(
      {required this.monthSummaryDataList,
      required this.seiyuPurchaseDataList});

  @override
  final List<MonthSummaryData> monthSummaryDataList;
  @override
  final List<SeiyuPurchaseData> seiyuPurchaseDataList;

  @override
  String toString() {
    return 'FoodExpensesState(monthSummaryDataList: $monthSummaryDataList, seiyuPurchaseDataList: $seiyuPurchaseDataList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FoodExpensesState &&
            const DeepCollectionEquality()
                .equals(other.monthSummaryDataList, monthSummaryDataList) &&
            const DeepCollectionEquality()
                .equals(other.seiyuPurchaseDataList, seiyuPurchaseDataList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(monthSummaryDataList),
      const DeepCollectionEquality().hash(seiyuPurchaseDataList));

  @JsonKey(ignore: true)
  @override
  _$FoodExpensesStateCopyWith<_FoodExpensesState> get copyWith =>
      __$FoodExpensesStateCopyWithImpl<_FoodExpensesState>(this, _$identity);
}

abstract class _FoodExpensesState implements FoodExpensesState {
  const factory _FoodExpensesState(
          {required List<MonthSummaryData> monthSummaryDataList,
          required List<SeiyuPurchaseData> seiyuPurchaseDataList}) =
      _$_FoodExpensesState;

  @override
  List<MonthSummaryData> get monthSummaryDataList;
  @override
  List<SeiyuPurchaseData> get seiyuPurchaseDataList;
  @override
  @JsonKey(ignore: true)
  _$FoodExpensesStateCopyWith<_FoodExpensesState> get copyWith =>
      throw _privateConstructorUsedError;
}
