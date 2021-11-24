import 'package:hive/hive.dart';
import 'package:movie_app/data/vos/movie_vo.dart';
import 'package:movie_app/persistence/daos/movie_dao.dart';
import 'package:movie_app/persistence/hive_constants.dart';

class MovieDaoImpl extends MovieDao {
  static final MovieDaoImpl _singleton = MovieDaoImpl._internal();

  factory MovieDaoImpl() {
    return _singleton;
  }

  MovieDaoImpl._internal();

  @override
  void saveAllMovieList(List<MovieVO> movieList) async {
    Map<int, MovieVO> movieMap = Map.fromIterable(
      movieList,
      key: (movie) => movie.id,
      value: (movie) => movie,
    );
    await getMovieBox().putAll(movieMap);
  }

  @override
  void saveSingleMovie(MovieVO? movie) async {
    if (movie != null) {
      await getMovieBox().put(
        movie.id,
        movie,
      );
    }
  }

  @override
  List<MovieVO> getAllMovieList() {
    return getMovieBox().values.toList();
  }

  @override
  MovieVO? getMovieById(int movieId) {
    return getMovieBox().get(movieId);
  }

  /// react programming
  @override
  Stream<void> getAllMoviesEventStream() {
    return getMovieBox().watch();
  }

  @override
  Stream<List<MovieVO>> getNowPlayingMoviesStream() {
    return Stream.value(
      getAllMovieList().where((movie) => movie.isNowPlaying).toList(),
    );
  }

  @override
  Stream<List<MovieVO>> getPopularMoviesStream() {
    return Stream.value(
      getAllMovieList().where((movie) => movie.isPopular).toList(),
    );
  }

  @override
  Stream<List<MovieVO>> getTopRatedMoviesStream() {
    return Stream.value(
      getAllMovieList().where((movie) => movie.isTopRated).toList(),
    );
  }

  @override
  Stream<MovieVO?> getMovieByIdStream(int movieId) {
    return Stream.value(getMovieById(movieId));
  }

  @override
  MovieVO? getMovieByIdFirstTime(int movieId) {
    var movieVO =
        getMovieById(movieId) != null ? getMovieBox().get(movieId) : null;
    return movieVO;
  }

  /// movie list is null for the first time
  @override
  List<MovieVO> getNowPlayingMovies() {
    if ((getAllMovieList().isNotEmpty)) {
      return getAllMovieList()
          .where((element) => element.isNowPlaying)
          .toList();
    } else {
      return [];
    }
  }

  @override
  List<MovieVO> getPopularMovies() {
    if ((getAllMovieList().isNotEmpty)) {
      return getAllMovieList().where((element) => element.isPopular).toList();
    } else {
      return [];
    }
  }

  @override
  List<MovieVO> getTopRatedMovies() {
    if ((getAllMovieList().isNotEmpty)) {
      return getAllMovieList().where((element) => element.isTopRated).toList();
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
