import 'package:bank_search/src/exception/exception.dart';
import 'package:bank_search/src/model/bank.dart';
import 'package:dio/dio.dart';

class BankRepository {

  final String url = "https://brasilapi.com.br/api/banks/v1";

  Future<Bank> getBankByCode(int code) async {  
    try{
      Response response = await Dio().get("$url/$code");
      return Bank.fromJson(response.data);
    } on DioError catch (e) {
      if (e.response?.statusCode == 404) {
        throw ExceptionConexao(messageErro: 'O código do banco não foi encontrado');
      }
      else if (e.response?.statusCode == 500) {
        throw ExceptionSeverInternal();
      }
      else{
        throw ExceptionOther();
      }
    } catch (e){
      throw ExceptionUnknown(messageErro: "Erro $e");
    }
  }

  Future<List<Bank>> getListBank() async {
    try{
      Response response = await Dio().get(url);
      List<Bank> listBanck = (response.data as List).map((item) {
        return Bank.fromJson(item);
      }).toList();

    return listBanck;
    } on DioError catch (e) {
      if (e.response?.statusCode == 404) {
        throw ExceptionConexao();
      }
      else if (e.response?.statusCode == 500) {
        throw ExceptionSeverInternal(messageErro: "Erro interno");
      }
      else{
        throw ExceptionOther();
      }
    } catch (e){
      throw ExceptionUnknown(messageErro: "Erro $e");
    }
  }

}