import 'package:movie_app/data/models/movie_model.dart';
import 'package:movie_app/data/vos/actor_vo.dart';
import 'package:movie_app/data/vos/credit_vo.dart';
import 'package:movie_app/data/vos/genre_vo.dart';
import 'package:movie_app/data/vos/movie_vo.dart';
import 'package:movie_app/network/agents/movie_data_agent.dart';
import 'package:movie_app/network/agents/retrofit_data_agent_impl.dart';
import 'package:movie_app/persistence/daos/actor_dao.dart';
import 'package:movie_app/persistence/daos/credit_dao.dart';
import 'package:movie_app/persistence/daos/genre_dao.dart';
import 'package:movie_app/persistence/daos/impls/actor_dao_impl.dart';
import 'package:movie_app/persistence/daos/impls/credit_dao_impl.dart';
import 'package:movie_app/persistence/daos/impls/genre_dao_impl.dart';
import 'package:movie_app/persistence/daos/impls/movie_dao_impl.dart';
import 'package:movie_app/persistence/daos/movie_dao.dart';
import 'package:stream_transform/stream_transform.dart';

class MovieModelImpl extends MovieModel {
  MovieDataAgent _mDataAgent = RetrofitDataAgentImpl();

  static final MovieModelImpl _singleton = MovieModelImpl._internal();

  MovieModelImpl._internal();

  factory MovieModelImpl() {
    return _singleton;
  }

  /// DAOs
  ActorDao mActorDao = ActorDaoImpl();
  MovieDao mMovieDao = MovieDaoImpl();
  GenreDao mGenreDao = GenreDaoImpl();
  CreditDao mCreditDao = CreditDaoImpl();

  void setDaosAndDataAgent(
    MovieDataAgent movieDataAgent,
    ActorDao actorDao,
    MovieDao movieDao,
    GenreDao genreDao,
    CreditDao creditDao,
  ) {
    _mDataAgent = movieDataAgent;
    mActorDao = actorDao;
    mMovieDao = movieDao;
    mGenreDao = genreDao;
    mCreditDao = creditDao;
  }

  /// network
  @override
  void getNowPlayingMovies(int page) {
    _mDataAgent.getNowPlayingMovies(page)?.then((movies) {
      List<MovieVO>? nowPlayingMovies = movies?.map((movie) {
        movie.isNowPlaying = true;
        movie.isPopular = false;
        movie.isTopRated = false;
        return movie;
      }).toList();
      mMovieDao.saveAllMovieList(nowPlayingMovies ?? []);
    });
  }

  @override
  void getPopularMovies(int page) {
    _mDataAgent.getPopularMovies(page)?.then((movies) {
      List<MovieVO>? popularMovies = movies?.map((movie) {
        movie.isNowPlaying = false;
        movie.isTopRated = false;
        movie.isPopular = true;
        return movie;
      }).toList();
      mMovieDao.saveAllMovieList(popularMovies ?? []);
    });
  }

  @override
  void getTopRatedMovies(int page) {
    _mDataAgent.getTopRatedMovies(page)?.then((movies) {
      List<MovieVO>? topRatedMovies = movies?.map((movie) {
        movie.isNowPlaying = false;
        movie.isPopular = false;
        movie.isTopRated = true;
        return movie;
      }).toList();
      mMovieDao.saveAllMovieList(topRatedMovies ?? []);
    });
  }

  @override
  void getActor(int page) {
    _mDataAgent.getBestActor(page)?.then((actors) {
      mActorDao.saveAllActor(actors ?? []);
    });
  }

  @override
  Future<List<GenreVO>?>? getGenre() {
    return _mDataAgent.getGenre()?.then((genres) {
      mGenreDao.saveAllGenreList(genres ?? []);
      return Future.value(genres);
    });
  }

  @override
  Future<List<MovieVO>?>? getMovieListByGenreId(String genreId) {
    return _mDataAgent.getMovieListByGenreId(genreId);
  }

  @override
  Future<List<CreditVO>?>? getCreditByMovieId(String movieId) {
    return _mDataAgent.getCreditByMovie(movieId)?.then((value) {
      value?.map((e) {
        e.movieId = movieId;
        return e;
      });
      mCreditDao.saveAllCredit(value ?? []);
      return value;
    });
  }

  @override
  void getMovieDetailById(String movieId) {
    _mDataAgent.getMovieDetailById(movieId)?.then((movie) async {
      mMovieDao.saveSingleMovie(movie);
    });
  }

  /// database
  @override
  Stream<List<MovieVO>> getNowPlayingMoviesFromDatabase() {
    this.getNowPlayingMovies(1);
    return mMovieDao
        .getAllMoviesEventStream()
        .startWith(mMovieDao.getNowPlayingMoviesStream())
        .map((event) => mMovieDao.getNowPlayingMovies());
  }

  @override
  Stream<List<MovieVO>> getPopularMoviesFromDatabase() {
    this.getPopularMovies(1);
    return mMovieDao
        .getAllMoviesEventStream()
        .startWith(mMovieDao.getPopularMoviesStream())
        .map((event) => mMovieDao.getPopularMovies());
  }

  @override
  Stream<List<MovieVO>> getTopRatedMoviesFromDatabase() {
    this.getTopRatedMovies(1);
    return mMovieDao
        .getAllMoviesEventStream()
        .startWith(mMovieDao.getTopRatedMoviesStream())
        .map((event) => mMovieDao.getTopRatedMovies());
  }

  @override
  Stream<List<ActorVO>> getActorFromDatabase() {
    this.getActor(1);
    return mActorDao
        .getAllActorEventStream()
        .startWith(mActorDao.getAllActorsStream())
        .map((event) => mActorDao.getAllActorsList());
  }

  @override
  Stream<List<GenreVO>> getGenreFromDatabase() {
    this.getGenre();
    return mGenreDao
        .getAllGenreListEventStream()
        .startWith(mGenreDao.getAllGenreListStream())
        .map((event) => mGenreDao.getAllGenreList());
  }

  @override
  Stream<List<CreditVO>> getCreditByMovieIdFromDatabase(String movieId) {
    this.getCreditByMovieId(movieId);
    return mCreditDao
        .getAllCreditEventStream()
        .startWith(mCreditDao.getAllCreditStream(movieId))
        .map((event) => mCreditDao.getAllCreditList(movieId));
  }

  @override
  Stream<MovieVO?> getMovieDetailByIdFromDatabase(int movieId) {
    this.getMovieDetailById(movieId.toString());
    return mMovieDao
        .getAllMoviesEventStream()
        .startWith(mMovieDao.getMovieByIdStream(movieId))
        .map((event) => mMovieDao.getMovieByIdFirstTime(movieId));
  }
}
