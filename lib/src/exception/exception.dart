
class ExceptionConexao implements Exception {
  ExceptionConexao();
}

class ExceptionSeverInternal implements Exception {
  ExceptionSeverInternal();
}

class ExceptionOther implements Exception {
  ExceptionOther();
}

class ExceptionUnknown implements Exception {
  final String error;
  ExceptionUnknown(this.error);
}

