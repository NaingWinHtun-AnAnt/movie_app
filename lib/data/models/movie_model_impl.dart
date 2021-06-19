import 'package:movie_app/data/models/movie_model.dart';
import 'package:movie_app/data/vos/actor_vo.dart';
import 'package:movie_app/data/vos/credit_vo.dart';
import 'package:movie_app/data/vos/genre_vo.dart';
import 'package:movie_app/data/vos/movie_vo.dart';
import 'package:movie_app/network/agents/movie_data_agent.dart';
import 'package:movie_app/network/agents/retrofit_data_agent_impl.dart';
import 'package:movie_app/persistence/daos/actor_dao.dart';
import 'package:movie_app/persistence/daos/genre_dao.dart';
import 'package:movie_app/persistence/daos/movie_dao.dart';

class MovieModelImpl extends MovieModel {
  MovieDataAgent _mDataAgent = RetrofitDataAgentImpl();

  static final MovieModelImpl _singleton = MovieModelImpl._internal();

  MovieModelImpl._internal();

  factory MovieModelImpl() {
    return _singleton;
  }

  /// DAOs
  ActorDao mActorDao = ActorDao();
  MovieDao mMovieDao = MovieDao();
  GenreDao mGenreDao = GenreDao();

  /// network
  @override
  Future<List<MovieVO>> getNowPlayingMovies(int page) {
    return _mDataAgent.getNowPlayingMovies(page).then((movies) async {
      List<MovieVO> nowPlayingMovies = movies.map((movie) {
        movie.isNowPlaying = true;
        movie.isPopular = false;
        movie.isTopRated = false;
        return movie;
      }).toList();
      mMovieDao.saveAllMovieList(nowPlayingMovies);
      return Future.value(movies);
    });
  }

  @override
  Future<List<MovieVO>> getPopularMovies(int page) {
    return _mDataAgent.getPopularMovies(page).then((movies) async {
      List<MovieVO> popularMovies = movies.map((movie) {
        movie.isNowPlaying = false;
        movie.isTopRated = false;
        movie.isPopular = true;
        return movie;
      }).toList();
      mMovieDao.saveAllMovieList(popularMovies);
      return Future.value(movies);
    });
  }

  @override
  Future<List<MovieVO>> getTopRatedMovies(int page) {
    return _mDataAgent.getTopRatedMovies(page).then((movies) async {
      List<MovieVO> topRatedMovies = movies.map((movie) {
        movie.isNowPlaying = false;
        movie.isPopular = false;
        movie.isTopRated = true;
        return movie;
      }).toList();
      mMovieDao.saveAllMovieList(topRatedMovies);
      return Future.value(movies);
    });
  }

  @override
  Future<List<ActorVO>> getActor(int page) {
    return _mDataAgent.getBestActor(page).then((actors) async {
      mActorDao.saveAllActor(actors);
      return Future.value(actors);
    });
  }

  @override
  Future<List<GenreVO>> getGenre() {
    return _mDataAgent.getGenre().then((genres) async {
      mGenreDao.saveAllGenreList(genres);
      return genres;
    });
  }

  @override
  Future<List<MovieVO>> getMovieListByGenreId(String genreId) {
    return _mDataAgent.getMovieListByGenreId(genreId);
  }

  @override
  Future<List<CreditVO>> getCreditByMovieId(String movieId) {
    return _mDataAgent.getCreditByMovie(movieId);
  }

  @override
  Future<MovieVO> getMovieDetailById(String movieId) {
    return _mDataAgent.getMovieDetailById(movieId).then((movie) async {
      mMovieDao.saveSingleMovie(movie);
      return Future.value(movie);
    });
  }

  /// database

  @override
  Future<List<MovieVO>> getNowPlayingMoviesFromDatabase() {
    return Future.value(
      mMovieDao
          .getAllMovieList()
          .where((movie) => movie.isNowPlaying ?? true)
          .toList(),
    );
  }

  @override
  Future<List<MovieVO>> getPopularMoviesFromDatabase() {
    return Future.value(
      mMovieDao
          .getAllMovieList()
          .where((movie) => movie.isPopular ?? true)
          .toList(),
    );
  }

  @override
  Future<List<MovieVO>> getTopRatedMoviesFromDatabase() {
    return Future.value(
      mMovieDao
          .getAllMovieList()
          .where((movie) => movie.isTopRated ?? true)
          .toList(),
    );
  }

  @override
  Future<List<ActorVO>> getActorFromDatabase() {
    return Future.value(mActorDao.getAllActors());
  }

  @override
  Future<List<GenreVO>> getGenreFromDatabase() {
    return Future.value(mGenreDao.getAllGenreList());
  }

  @override
  Future<MovieVO> getMovieDetailByIdFromDatabase(int movieId) {
    return Future.value(mMovieDao.getMovieById(movieId));
  }
}
