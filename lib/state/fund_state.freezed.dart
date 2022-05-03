// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'fund_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$FundStateTearOff {
  const _$FundStateTearOff();

  _FundState call(
      {required String fundName,
      List<FundDetailState> list = const [
        FundDetailState(
            date: '',
            basePrice: '',
            compareFront: '',
            yearlyReturn: '',
            upDown: '')
      ]}) {
    return _FundState(
      fundName: fundName,
      list: list,
    );
  }
}

/// @nodoc
const $FundState = _$FundStateTearOff();

/// @nodoc
mixin _$FundState {
  String get fundName => throw _privateConstructorUsedError;
  List<FundDetailState> get list => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FundStateCopyWith<FundState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FundStateCopyWith<$Res> {
  factory $FundStateCopyWith(FundState value, $Res Function(FundState) then) =
      _$FundStateCopyWithImpl<$Res>;
  $Res call({String fundName, List<FundDetailState> list});
}

/// @nodoc
class _$FundStateCopyWithImpl<$Res> implements $FundStateCopyWith<$Res> {
  _$FundStateCopyWithImpl(this._value, this._then);

  final FundState _value;
  // ignore: unused_field
  final $Res Function(FundState) _then;

  @override
  $Res call({
    Object? fundName = freezed,
    Object? list = freezed,
  }) {
    return _then(_value.copyWith(
      fundName: fundName == freezed
          ? _value.fundName
          : fundName // ignore: cast_nullable_to_non_nullable
              as String,
      list: list == freezed
          ? _value.list
          : list // ignore: cast_nullable_to_non_nullable
              as List<FundDetailState>,
    ));
  }
}

/// @nodoc
abstract class _$FundStateCopyWith<$Res> implements $FundStateCopyWith<$Res> {
  factory _$FundStateCopyWith(
          _FundState value, $Res Function(_FundState) then) =
      __$FundStateCopyWithImpl<$Res>;
  @override
  $Res call({String fundName, List<FundDetailState> list});
}

/// @nodoc
class __$FundStateCopyWithImpl<$Res> extends _$FundStateCopyWithImpl<$Res>
    implements _$FundStateCopyWith<$Res> {
  __$FundStateCopyWithImpl(_FundState _value, $Res Function(_FundState) _then)
      : super(_value, (v) => _then(v as _FundState));

  @override
  _FundState get _value => super._value as _FundState;

  @override
  $Res call({
    Object? fundName = freezed,
    Object? list = freezed,
  }) {
    return _then(_FundState(
      fundName: fundName == freezed
          ? _value.fundName
          : fundName // ignore: cast_nullable_to_non_nullable
              as String,
      list: list == freezed
          ? _value.list
          : list // ignore: cast_nullable_to_non_nullable
              as List<FundDetailState>,
    ));
  }
}

/// @nodoc

class _$_FundState implements _FundState {
  const _$_FundState(
      {required this.fundName,
      this.list = const [
        FundDetailState(
            date: '',
            basePrice: '',
            compareFront: '',
            yearlyReturn: '',
            upDown: '')
      ]});

  @override
  final String fundName;
  @JsonKey()
  @override
  final List<FundDetailState> list;

  @override
  String toString() {
    return 'FundState(fundName: $fundName, list: $list)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FundState &&
            const DeepCollectionEquality().equals(other.fundName, fundName) &&
            const DeepCollectionEquality().equals(other.list, list));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(fundName),
      const DeepCollectionEquality().hash(list));

  @JsonKey(ignore: true)
  @override
  _$FundStateCopyWith<_FundState> get copyWith =>
      __$FundStateCopyWithImpl<_FundState>(this, _$identity);
}

abstract class _FundState implements FundState {
  const factory _FundState(
      {required String fundName, List<FundDetailState> list}) = _$_FundState;

  @override
  String get fundName;
  @override
  List<FundDetailState> get list;
  @override
  @JsonKey(ignore: true)
  _$FundStateCopyWith<_FundState> get copyWith =>
      throw _privateConstructorUsedError;
}
