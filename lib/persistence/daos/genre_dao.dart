import 'package:movie_app/data/vos/genre_vo.dart';

abstract class GenreDao {
  void saveAllGenreList(List<GenreVO> genreList);

  List<GenreVO> getAllGenres();

  Stream<void> getAllGenreListEventStream();

  Stream<List<GenreVO>> getAllGenreListStream();

  List<GenreVO> getAllGenreList();
}
