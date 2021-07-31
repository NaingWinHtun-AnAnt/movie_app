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
import 'package:stream_transform/stream_transform.dart';

class MovieModelImpl extends MovieModel {
  MovieDataAgent _mDataAgent = RetrofitDataAgentImpl();

  static final MovieModelImpl _singleton = MovieModelImpl._internal();

  MovieModelImpl._internal() {
    getNowPlayingMoviesFromDatabase();
    getTopRatedMoviesFromDatabase();
    getPopularMoviesFromDatabase();
    getActor(1);
    getActorFromDatabase();
    getGenre();
    getGenreFromDatabase();
  }

  factory MovieModelImpl() {
    return _singleton;
  }

  /// DAOs
  ActorDao mActorDao = ActorDao();
  MovieDao mMovieDao = MovieDao();
  GenreDao mGenreDao = GenreDao();

  /// Home Page States Variables
  List<MovieVO> mNowPlayingMovieList;
  List<MovieVO> mPopularMovieList;
  List<MovieVO> mTopRatedMovieList;
  List<MovieVO> mMovieListByGenre;
  List<ActorVO> mActors;
  List<GenreVO> mGenreList;

  /// Movie Detail Page State Variables
  MovieVO mMovie;
  List<CreditVO> mActorList;
  List<CreditVO> mCreatorList = [];

  /// network
  @override
  void getNowPlayingMovies(int page) {
    _mDataAgent.getNowPlayingMovies(page).then((movies) async {
      List<MovieVO> nowPlayingMovies = movies.map((movie) {
        movie.isNowPlaying = true;
        movie.isPopular = false;
        movie.isTopRated = false;
        return movie;
      }).toList();
      mMovieDao.saveAllMovieList(nowPlayingMovies);
      mNowPlayingMovieList = nowPlayingMovies;
      notifyListeners();
    });
  }

  @override
  void getPopularMovies(int page) {
    _mDataAgent.getPopularMovies(page).then((movies) async {
      List<MovieVO> popularMovies = movies.map((movie) {
        movie.isNowPlaying = false;
        movie.isTopRated = false;
        movie.isPopular = true;
        return movie;
      }).toList();
      mMovieDao.saveAllMovieList(popularMovies);
      mPopularMovieList = popularMovies;
      notifyListeners();
    });
  }

  @override
  void getTopRatedMovies(int page) {
    _mDataAgent.getTopRatedMovies(page).then((movies) async {
      List<MovieVO> topRatedMovies = movies.map((movie) {
        movie.isNowPlaying = false;
        movie.isPopular = false;
        movie.isTopRated = true;
        return movie;
      }).toList();
      mMovieDao.saveAllMovieList(topRatedMovies);
      mTopRatedMovieList = topRatedMovies;
      notifyListeners();
    });
  }

  @override
  void getActor(int page) {
    _mDataAgent.getBestActor(page).then((actors) async {
      mActorDao.saveAllActor(actors);
      mActors = actors;
      notifyListeners();
    });
  }

  @override
  void getGenre() {
    _mDataAgent.getGenre().then((genres) async {
      mGenreDao.saveAllGenreList(genres);
      mGenreList = genres;
      getMovieListByGenreId(genres.first.id.toString());
      notifyListeners();
    });
  }

  @override
  void getMovieListByGenreId(String genreId) {
    _mDataAgent.getMovieListByGenreId(genreId).then((movieListByGenre) {
      mMovieListByGenre = movieListByGenre;
      notifyListeners();
    });
  }

  @override
  void getCreditByMovieId(String movieId) {
    _mDataAgent.getCreditByMovie(movieId).then((creditList) {
      mActorList = creditList.where((element) => element.isActor()).toList();
      mCreatorList =
          creditList.where((element) => element.isCreator()).toList();
      notifyListeners();
    });
  }

  @override
  void getMovieDetailById(String movieId) {
    _mDataAgent.getMovieDetailById(movieId).then((movie) async {
      mMovieDao.saveSingleMovie(movie);
      mMovie = movie;
      notifyListeners();
      return Future.value(movie);
    });
  }

  /// database
  @override
  void getNowPlayingMoviesFromDatabase() {
    this.getNowPlayingMovies(1);
    mMovieDao
        .getAllMoviesEventStream()
        .startWith(mMovieDao.getNowPlayingMoviesStream())
        .map((event) => mMovieDao.getNowPlayingMovies())
        .listen((event) {
      mNowPlayingMovieList = event;
      notifyListeners();
    });
  }

  @override
  void getPopularMoviesFromDatabase() {
    this.getPopularMovies(1);
    mMovieDao
        .getAllMoviesEventStream()
        .startWith(mMovieDao.getPopularMoviesStream())
        .map((event) => mMovieDao.getPopularMovies())
        .listen((event) {
      mPopularMovieList = event;
      notifyListeners();
    });
  }

  @override
  void getTopRatedMoviesFromDatabase() {
    getTopRatedMovies(1);
    mMovieDao
        .getAllMoviesEventStream()
        .startWith(mMovieDao.getTopRatedMoviesStream())
        .map((event) => mMovieDao.getTopRatedMovies())
        .listen((event) {
      mTopRatedMovieList = event;
      notifyListeners();
    });
  }

  @override
  void getActorFromDatabase() {
    mActors = mActorDao.getAllActors();
    notifyListeners();
  }

  @override
  void getGenreFromDatabase() {
    mGenreList = mGenreDao.getAllGenreList();
    notifyListeners();
  }

  @override
  void getMovieDetailByIdFromDatabase(int movieId) {
    mMovie = mMovieDao.getMovieById(movieId);
    notifyListeners();
  }
}
