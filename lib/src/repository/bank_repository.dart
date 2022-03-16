import 'package:bank_search/src/exception/exception.dart';
import 'package:bank_search/src/model/bank.dart';
import 'package:dio/dio.dart';



class BankRepository {

  final String url = "https://brasilapi.com.br/api/banks/v1";

  Future<Bank> getBankByCode(int code) async {
    try{
      Response response = await Dio().get("$url/$code");
      return Bank.fromJson(response.data);
    } 
    catch (e) {
      throw ExceptionConexao().erro(e.toString());
    }
    
  }

  Future<List<Bank>> getListBank() async {
    try{
      Response response = await Dio().get(url);
      List<Bank> listBanck = (response.data as List).map((item) {
        return Bank.fromJson(item);
      }).toList();

    return listBanck;
    }
    catch (e) {
      throw ExceptionConexao().erro(e.toString());
    }
  }

}