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

  /// react programming
  Stream<void> getAllMoviesEventStream() {
    return getMovieBox().watch();
  }

  Stream<List<MovieVO>> getNowPlayingMoviesStream() {
    return Stream.value(
      getAllMovieList().where((movie) => movie.isNowPlaying ?? false).toList(),
    );
  }

  Stream<List<MovieVO>> getPopularMoviesStream() {
    return Stream.value(
      getAllMovieList().where((movie) => movie.isPopular ?? false).toList(),
    );
  }

  Stream<List<MovieVO>> getTopRatedMoviesStream() {
    return Stream.value(
      getAllMovieList().where((movie) => movie.isTopRated ?? false).toList(),
    );
  }

  /// movie list is null for the first time
  List<MovieVO> getNowPlayingMovies() {
    if (getAllMovieList() != null && (getAllMovieList().isNotEmpty ?? false)) {
      return getAllMovieList()
          .where((element) => element?.isNowPlaying ?? false)
          .toList();
    } else {
      return [];
    }
  }

  List<MovieVO> getPopularMovies() {
    if (getAllMovieList() != null && (getAllMovieList().isNotEmpty ?? false)) {
      return getAllMovieList()
          .where((element) => element?.isPopular ?? false)
          .toList();
    } else {
      return [];
    }
  }

  List<MovieVO> getTopRatedMovies() {
    if (getAllMovieList() != null && (getAllMovieList().isNotEmpty ?? false)) {
      return getAllMovieList()
          .where((element) => element?.isTopRated ?? false)
          .toList();
    } else {
      return [];
    }
  }

  /// hive MovieVO box
  Box<MovieVO> getMovieBox() {
    return Hive.box<MovieVO>(
      BOX_NAME_MOVIE_VO,
    );
  }
}
