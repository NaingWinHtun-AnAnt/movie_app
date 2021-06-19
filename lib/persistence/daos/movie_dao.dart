import 'package:hive/hive.dart';
import 'package:movie_app/data/vos/movie_vo.dart';
import 'package:movie_app/persistence/hive_constants.dart';

class MovieDao {
  static final MovieDao _singleton = MovieDao._internal();

  factory MovieDao() {
    return _singleton;
  }

  MovieDao._internal();

  void saveAllMovieList(List<MovieVO> movieList) async {
    Map<int, MovieVO> movieMap = Map.fromIterable(
      movieList,
      key: (movie) => movie.id,
      value: (movie) => movie,
    );
    await getMovieBox().putAll(movieMap);
  }

  void saveSingleMovie(MovieVO movie) async {
    await getMovieBox().put(
      movie.id,
      movie,
    );
  }

  List<MovieVO> getAllMovieList() {
    return getMovieBox().values.toList();
  }

  MovieVO getMovieById(int movieId) {
    return getMovieBox().get(movieId);
  }

  Box<MovieVO> getMovieBox() {
    return Hive.box<MovieVO>(
      BOX_NAME_MOVIE_VO,
    );
  }
}
