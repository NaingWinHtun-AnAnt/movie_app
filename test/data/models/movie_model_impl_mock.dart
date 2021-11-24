import 'package:movie_app/data/models/movie_model.dart';
import 'package:movie_app/data/vos/actor_vo.dart';
import 'package:movie_app/data/vos/credit_vo.dart';
import 'package:movie_app/data/vos/genre_vo.dart';
import 'package:movie_app/data/vos/movie_vo.dart';

import '../../mock_data/mock_data.dart';

class MovieModelImplMock extends MovieModel {
  @override
  void getActor(int page) {
    /// don't need to mock
  }

  @override
  Stream<List<ActorVO>> getActorFromDatabase() {
    return Stream.value(getMockActors());
  }

  @override
  Future<List<CreditVO>?>? getCreditByMovieId(String movieId) {
    return Future.value(getMockCredits());
  }

  @override
  Stream<List<CreditVO>?>? getCreditByMovieIdFromDatabase(String movieId) {
    return Stream.value(getMockCredits());
  }

  @override
  Future<List<GenreVO>?>? getGenre() {
    return Future.value(getMockGenres());
  }

  @override
  Stream<List<GenreVO>> getGenreFromDatabase() {
    return Stream.value(getMockGenres());
  }

  @override
  void getMovieDetailById(String movieId) {
    /// don't need to mock
  }

  @override
  Stream<MovieVO?> getMovieDetailByIdFromDatabase(int movieId) {
    return Stream.value(
      getMockMovies().first,
    );
  }

  @override
  Future<List<MovieVO>?>? getMovieListByGenreId(String genreId) {
    if (genreId == "3") {
      return Future.value([getMockMovies().last]);
    } else
      return Future.value([getMockMovies().first]);
  }

  @override
  void getNowPlayingMovies(int page) {
    /// don't need to mock
  }

  @override
  Stream<List<MovieVO>> getNowPlayingMoviesFromDatabase() {
    return Stream.value(
      getMockMovies().where((element) => element.isNowPlaying == true).toList(),
    );
  }

  @override
  void getPopularMovies(int page) {
    /// don't need to mock
  }

  @override
  Stream<List<MovieVO>> getPopularMoviesFromDatabase() {
    return Stream.value(
      getMockMovies().where((element) => element.isPopular == true).toList(),
    );
  }

  @override
  void getTopRatedMovies(int page) {
    /// don't need to mock
  }

  @override
  Stream<List<MovieVO>> getTopRatedMoviesFromDatabase() {
    return Stream.value(
      getMockMovies().where((element) => element.isTopRated == true).toList(),
    );
  }
}
