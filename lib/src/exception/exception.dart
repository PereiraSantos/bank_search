import 'dart:developer' as develop;

class ExceptionConexao implements Exception {

  erro(String erro) => develop.log("erro", error: erro);

  String errMsg() => 'Erro ao busca no servidor';

}