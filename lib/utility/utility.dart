import 'package:intl/intl.dart';

class Utility {
  /// 金額を3桁区切りで表示する
  final formatter = NumberFormat("#,###");

  String makeCurrencyDisplay(String text) {
    return formatter.format(int.parse(text));
  }

  /// 合計金額取得
  int total = 0;
  int temochi = 0;

  void makeTotal(String data) {
    var exData = (data).split('|');

    List<List<int>> _totalValue = [];
    _totalValue.add([10000, int.parse(exData[0])]);
    _totalValue.add([5000, int.parse(exData[1])]);
    _totalValue.add([2000, int.parse(exData[2])]);
    _totalValue.add([1000, int.parse(exData[3])]);
    _totalValue.add([500, int.parse(exData[4])]);
    _totalValue.add([100, int.parse(exData[5])]);
    _totalValue.add([50, int.parse(exData[6])]);
    _totalValue.add([10, int.parse(exData[7])]);
    _totalValue.add([5, int.parse(exData[8])]);
    _totalValue.add([1, int.parse(exData[9])]);

    temochi = 0;
    for (int i = 0; i < _totalValue.length; i++) {
      temochi += (_totalValue[i][0] * _totalValue[i][1]);
    }

    _totalValue.add([1, int.parse(exData[10])]);
    _totalValue.add([1, int.parse(exData[11])]);
    _totalValue.add([1, int.parse(exData[12])]);
    _totalValue.add([1, int.parse(exData[13])]);
    _totalValue.add([1, int.parse(exData[14])]);

    _totalValue.add([1, int.parse(exData[15])]);
    _totalValue.add([1, int.parse(exData[16])]);
    _totalValue.add([1, int.parse(exData[17])]);
    _totalValue.add([1, int.parse(exData[18])]);
    _totalValue.add([1, int.parse(exData[19])]);

    total = 0;
    for (int i = 0; i < _totalValue.length; i++) {
      total += (_totalValue[i][0] * _totalValue[i][1]);
    }
  }

  /// 銀行名取得
  Map<String, String> bankNames = {};
  void getBankName() {
    bankNames['bankA'] = 'みずほ';
    bankNames['bankB'] = '住友547';
    bankNames['bankC'] = '住友259';
    bankNames['bankD'] = 'UFJ';
    bankNames['bankE'] = '楽天';

    bankNames['payA'] = 'Suica1';
    bankNames['payB'] = 'PayPay';
    bankNames['payC'] = 'PASUMO';
    bankNames['payD'] = 'Suica2';
    bankNames['payE'] = 'メルカリ';
  }
}
