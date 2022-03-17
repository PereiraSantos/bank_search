import 'package:bank_search/src/repository/bank_repository.dart';

class Bank {
  String? ispb;
  String? name;
  int? code;
  String? fullName;

  Bank({this.ispb, this.name, this.code, this.fullName});

  factory Bank.fromJson(Map<String, dynamic> json) {
    return Bank(
      ispb: json['ispb'],
      name: json['name'],
      code: json['code'],
      fullName: json['fullName'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ispb'] = ispb;
    data['name'] = name;
    data['code'] = code;
    data['fullName'] = fullName;
    return data;
  }

  static Future<Bank> bankByCode(int code) async => await BankRepository().getBankByCode(code);
  
  static Future<List<Bank>> listbank() async => await BankRepository().getListBank();
 
}