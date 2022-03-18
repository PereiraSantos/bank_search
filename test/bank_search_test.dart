import 'package:flutter_test/flutter_test.dart';
import 'package:bank_search/bank_search.dart';

void main() {
  test('Espero que banco não seja nula ', () async {
    
    var result = await Bank.bankByCode(1);
    expect(result, isNotNull);
  
  });

  test("Espero que a lista de banco não seja nula ",() async {
    var result = await Bank.listbank();
    expect(result, isNotNull);
  });
}
