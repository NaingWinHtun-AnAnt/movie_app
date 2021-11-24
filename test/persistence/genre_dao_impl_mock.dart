import 'package:movie_app/data/vos/genre_vo.dart';
import 'package:movie_app/persistence/daos/genre_dao.dart';

import '../mock_data/mock_data.dart';

class GenreDaoImplMock extends GenreDao {
  Map<int, GenreVO> genreListFromDatabaseMock = {};

  @override
  void saveAllGenreList(List<GenreVO> genreList) {
    genreList.forEach((element) {
      genreListFromDatabaseMock[element.id] = element;
    });
  }

  @override
  List<GenreVO> getAllGenres() {
    return genreListFromDatabaseMock.values.toList();
  }

  @override
  Stream<void> getAllGenreListEventStream() {
    return Stream.value(null);
  }

  @override
  Stream<List<GenreVO>> getAllGenreListStream() {
    return Stream.value(getMockGenres());
  }

  @override
  List<GenreVO> getAllGenreList() {
    return getMockGenres();
  }
}
