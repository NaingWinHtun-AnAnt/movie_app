import 'package:movie_app/data/vos/credit_vo.dart';
import 'package:movie_app/persistence/daos/credit_dao.dart';

import '../mock_data/mock_data.dart';

class CreditDaoImplMock extends CreditDao {
  Map<int, CreditVO> creditListFromDatabaseMock = {};

  @override
  void saveAllCredit(List<CreditVO> creditList) {
    creditList.forEach((element) {
      creditListFromDatabaseMock[element.id] = element;
    });
  }

  @override
  List<CreditVO> getAllCredit(String movieId) {
    return creditListFromDatabaseMock.values.toList();
  }

  @override
  Stream<void> getAllCreditEventStream() {
    return Stream.value(null);
  }

  @override
  Stream<List<CreditVO>> getAllCreditStream(String movieId) {
    return Stream.value(getMockCredits());
  }

  @override
  List<CreditVO> getAllCreditList(String movieId) {
    return getMockCredits();
  }
}
