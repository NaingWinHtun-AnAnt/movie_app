import 'package:hive/hive.dart';
import 'package:movie_app/data/vos/genre_vo.dart';
import 'package:movie_app/persistence/daos/genre_dao.dart';
import 'package:movie_app/persistence/hive_constants.dart';

class GenreDaoImpl extends GenreDao {
  static final GenreDaoImpl _singleton = GenreDaoImpl._internal();

  factory GenreDaoImpl() {
    return _singleton;
  }

  GenreDaoImpl._internal();

  @override
  void saveAllGenreList(List<GenreVO> genreList) async {
    Map<int, GenreVO> genreMap = Map.fromIterable(
      genreList,
      key: (genre) => genre.id,
      value: (genre) => genre,
    );

    await getGenreBox().putAll(genreMap);
  }

  @override
  List<GenreVO> getAllGenres() {
    return getGenreBox().values.toList();
  }

  /// reactive programming
  @override
  Stream<void> getAllGenreListEventStream() {
    return getGenreBox().watch();
  }

  @override
  Stream<List<GenreVO>> getAllGenreListStream() {
    return Stream.value(getAllGenres());
  }

  @override
  List<GenreVO> getAllGenreList() {
    return getAllGenres().isNotEmpty ? getAllGenres() : [];
  }

  Box<GenreVO> getGenreBox() {
    return Hive.box(BOX_NAME_GENRE_VO);
  }
}
