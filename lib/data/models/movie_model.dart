import 'package:movie_app/data/vos/actor_vo.dart';
import 'package:movie_app/data/vos/credit_vo.dart';
import 'package:movie_app/data/vos/genre_vo.dart';
import 'package:movie_app/data/vos/movie_vo.dart';

abstract class MovieModel {
  /// network
  void getNowPlayingMovies(int page);

  void getPopularMovies(int page);

  void getTopRatedMovies(int page);

  Future<List<ActorVO>?>? getActor(int page);

  Future<List<GenreVO>?>? getGenre();

  Future<List<MovieVO>?>? getMovieListByGenreId(String genreId);

  Future<MovieVO?>? getMovieDetailById(String movieId);

  Future<List<CreditVO>?>? getCreditByMovieId(String movieId);

  /// database
  Future<List<MovieVO>> getNowPlayingMoviesFromDatabase();

  Future<List<MovieVO>> getPopularMoviesFromDatabase();

  Future<List<MovieVO>> getTopRatedMoviesFromDatabase();

  Future<List<ActorVO>> getActorFromDatabase();

  Future<List<GenreVO>> getGenreFromDatabase();

  Future<MovieVO?> getMovieDetailByIdFromDatabase(int movieId);
}
