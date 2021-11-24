import 'package:movie_app/data/vos/movie_vo.dart';

abstract class MovieDao {
  void saveAllMovieList(List<MovieVO> movieList);

  void saveSingleMovie(MovieVO? movie);

  List<MovieVO> getAllMovieList();

  MovieVO? getMovieById(int movieId);

  Stream<void> getAllMoviesEventStream();

  Stream<List<MovieVO>> getNowPlayingMoviesStream();

  Stream<List<MovieVO>> getPopularMoviesStream();

  Stream<List<MovieVO>> getTopRatedMoviesStream();

  Stream<MovieVO?> getMovieByIdStream(int movieId);

  MovieVO? getMovieByIdFirstTime(int movieId);

  List<MovieVO> getNowPlayingMovies();

  List<MovieVO> getPopularMovies();

  List<MovieVO> getTopRatedMovies();
}
