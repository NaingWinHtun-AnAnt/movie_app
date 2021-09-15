import 'package:movie_app/data/vos/actor_vo.dart';
import 'package:movie_app/data/vos/credit_vo.dart';
import 'package:movie_app/data/vos/genre_vo.dart';
import 'package:movie_app/data/vos/movie_vo.dart';

abstract class MovieDataAgent {
  Future<List<MovieVO>?>? getNowPlayingMovies(int page);

  Future<List<MovieVO>?>? getPopularMovies(int page);

  Future<List<MovieVO>?>? getTopRatedMovies(int page);

  Future<List<ActorVO>?>? getBestActor(int page);

  Future<List<GenreVO>?>? getGenre();

  Future<List<MovieVO>?>? getMovieListByGenreId(String genreId);

  Future<MovieVO?>? getMovieDetailById(String movieId);

  Future<List<CreditVO>?>? getCreditByMovie(String movieId);
}
