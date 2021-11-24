import 'package:movie_app/data/vos/movie_vo.dart';
import 'package:movie_app/persistence/daos/movie_dao.dart';

import '../mock_data/mock_data.dart';

class MovieDaoImplMock extends MovieDao {
  Map<int, MovieVO> movieListFromDatabaseMock = {};

  @override
  void saveAllMovieList(List<MovieVO> movieList) {
    movieList.forEach((element) {
      movieListFromDatabaseMock[element.id] = element;
    });
  }

  @override
  void saveSingleMovie(MovieVO? movie) {
    if (movie != null) movieListFromDatabaseMock[movie.id] = movie;
  }

  @override
  List<MovieVO> getAllMovieList() {
    return getMockMovies();
  }

  @override
  MovieVO? getMovieById(int movieId) {
    return movieListFromDatabaseMock.values
        .toList()
        .firstWhere((element) => element.id == movieId);
  }

  @override
  Stream<void> getAllMoviesEventStream() {
    return Stream.value(null);
  }

  @override
  Stream<List<MovieVO>> getNowPlayingMoviesStream() {
    return Stream.value(getMockMovies()
        .where((element) => element.isNowPlaying == true)
        .toList());
  }

  @override
  Stream<List<MovieVO>> getPopularMoviesStream() {
    return Stream.value(
        getMockMovies().where((element) => element.isPopular == true).toList());
  }

  @override
  Stream<List<MovieVO>> getTopRatedMoviesStream() {
    return Stream.value(getMockMovies()
        .where((element) => element.isTopRated == true)
        .toList());
  }

  @override
  Stream<MovieVO?> getMovieByIdStream(int movieId) {
    return Stream.value(getMockMovies().first);
  }

  @override
  List<MovieVO> getNowPlayingMovies() {
    return getMockMovies().isNotEmpty
        ? getMockMovies()
            .where((element) => element.isNowPlaying == true)
            .toList()
        : [];
  }

  @override
  List<MovieVO> getPopularMovies() {
    return getMockMovies().isNotEmpty
        ? getMockMovies().where((element) => element.isPopular == true).toList()
        : [];
  }

  @override
  List<MovieVO> getTopRatedMovies() {
    return getMockMovies().isNotEmpty
        ? getMockMovies()
            .where((element) => element.isTopRated == true)
            .toList()
        : [];
  }

  @override
  MovieVO? getMovieByIdFirstTime(int movieId) {
    return getMockMovies().isNotEmpty ? getMockMovies().first : null;
  }
}
