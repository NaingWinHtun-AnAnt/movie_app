import 'package:movie_app/data/vos/credit_vo.dart';

abstract class CreditDao {
  void saveAllCredit(List<CreditVO> creditList);

  List<CreditVO> getAllCredit(String movieId);

  Stream<void> getAllCreditEventStream();

  Stream<List<CreditVO>> getAllCreditStream(String movieId);

  List<CreditVO> getAllCreditList(String movieId);
}
