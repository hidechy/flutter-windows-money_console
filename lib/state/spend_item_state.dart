import 'package:freezed_annotation/freezed_annotation.dart';

part 'spend_item_state.freezed.dart';

@freezed
class SpendItemState with _$SpendItemState {
  const factory SpendItemState({
    required String koumoku,
    required String price,
    required int bank,
  }) = _SpendItemState;
}
