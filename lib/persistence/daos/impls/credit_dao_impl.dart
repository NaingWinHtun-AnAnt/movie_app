import 'package:hive/hive.dart';
import 'package:movie_app/data/vos/credit_vo.dart';
import 'package:movie_app/persistence/daos/credit_dao.dart';
import 'package:movie_app/persistence/hive_constants.dart';

class CreditDaoImpl extends CreditDao {
  static final CreditDaoImpl _singleton = CreditDaoImpl._internal();

  factory CreditDaoImpl() => _singleton;

  CreditDaoImpl._internal();

  /// save
  @override
  void saveAllCredit(List<CreditVO> creditList) async {
    Map<int, CreditVO> creditMap = Map.fromIterable(
      creditList,
      key: (credit) => credit.id,
      value: (credit) => credit,
    );

    await getCreditBox().putAll(creditMap);
  }

  /// get
  @override
  List<CreditVO> getAllCredit(String movieId) {
    return getCreditBox()
        .values
        .where((element) => element.movieId == movieId)
        .toList();
  }

  /// reactive programming
  @override
  Stream<void> getAllCreditEventStream() {
    return getCreditBox().watch();
  }

  @override
  Stream<List<CreditVO>> getAllCreditStream(String movieId) {
    return Stream.value(getAllCredit(movieId));
  }

  @override
  List<CreditVO> getAllCreditList(String movieId) {
    return getAllCredit(movieId).isNotEmpty ? getAllCredit(movieId) : [];
  }

  Box<CreditVO> getCreditBox() {
    return Hive.box(BOX_NAME_CREDIT_VO);
  }
}
