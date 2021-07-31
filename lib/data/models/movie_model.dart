import 'package:scoped_model/scoped_model.dart';

abstract class MovieModel extends Model{
  /// network
  void getNowPlayingMovies(int page);

  void getPopularMovies(int page);

  void getTopRatedMovies(int page);

  void getActor(int page);

  void getGenre();

  void getMovieListByGenreId(String genreId);

  void getMovieDetailById(String movieId);

  void getCreditByMovieId(String movieId);

  /// database
  void getNowPlayingMoviesFromDatabase();

  void getPopularMoviesFromDatabase();

  void getTopRatedMoviesFromDatabase();

 void getActorFromDatabase();

  void getGenreFromDatabase();

  void getMovieDetailByIdFromDatabase(int movieId);
}
