import 'package:movie_app/data/vos/actor_vo.dart';
import 'package:movie_app/data/vos/credit_vo.dart';
import 'package:movie_app/data/vos/genre_vo.dart';
import 'package:movie_app/data/vos/movie_vo.dart';

abstract class MovieModel {
  /// network
  void getNowPlayingMovies(int page);

  void getPopularMovies(int page);

  void getTopRatedMovies(int page);

  void getActor(int page);

  /// TODO(change return type to void after test. Future return type test automation.)
  Future<List<GenreVO>?>? getGenre();

  Future<List<MovieVO>?>? getMovieListByGenreId(String genreId);

  Future<List<CreditVO>?>? getCreditByMovieId(String movieId);

  void getMovieDetailById(String movieId);

  /// database
  Stream<List<MovieVO>> getNowPlayingMoviesFromDatabase();

  Stream<List<MovieVO>> getPopularMoviesFromDatabase();

  Stream<List<MovieVO>> getTopRatedMoviesFromDatabase();

  Stream<List<ActorVO>> getActorFromDatabase();

  Stream<List<GenreVO>> getGenreFromDatabase();

  Stream<List<CreditVO>?>? getCreditByMovieIdFromDatabase(String movieId);

  Stream<MovieVO?> getMovieDetailByIdFromDatabase(int movieId);
}
