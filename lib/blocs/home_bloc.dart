import 'package:flutter/foundation.dart';
import 'package:movie_app/data/models/movie_model.dart';
import 'package:movie_app/data/models/movie_model_impl.dart';
import 'package:movie_app/data/vos/actor_vo.dart';
import 'package:movie_app/data/vos/genre_vo.dart';
import 'package:movie_app/data/vos/movie_vo.dart';

class HomeBloc extends ChangeNotifier {
  /// States
  List<MovieVO>? mNowPlayingMovieList;
  List<MovieVO>? mPopularMovieList;
  List<MovieVO>? mTopRatedMovieList;
  List<MovieVO>? mMovieListByGenre;
  List<ActorVO>? mActorList;
  List<GenreVO>? mGenreList;

  /// page
  int pageForNowPlayingMovie = 1;

  /// model
  MovieModel mMovieModel = MovieModelImpl();

  HomeBloc({MovieModel? movieModel}) {
    /// set mock model for test
    if (movieModel != null) {
      mMovieModel = movieModel;
    }

    /// nowPlaying
    mMovieModel.getNowPlayingMoviesFromDatabase().listen((movieList) {
      mNowPlayingMovieList = movieList;
      notifyListeners();
    });

    /// popular
    mMovieModel.getPopularMoviesFromDatabase().listen((popularMovieList) {
      mPopularMovieList = popularMovieList;
      notifyListeners();
    });

    /// top rated
    mMovieModel.getTopRatedMoviesFromDatabase().listen((topRatedMovieList) {
      mTopRatedMovieList = topRatedMovieList;
      notifyListeners();
    });

    /// actors
    mMovieModel.getActorFromDatabase().listen((actorList) {
      mActorList = actorList;
      notifyListeners();
    });

    /// genre
    mMovieModel.getGenreFromDatabase().listen((genreList) {
      mGenreList = genreList;

      if (mGenreList?.isNotEmpty ?? false)
        onTapGenre(mGenreList?.first.id ?? 0);

      notifyListeners();
    });
  }

  void onTapGenre(int genreId) {
    mMovieModel.getMovieListByGenreId(genreId.toString())?.then((value) {
      mMovieListByGenre = value;
      notifyListeners();
    });
  }

  void onNowPlayingMovieListEndReached() {
    this.pageForNowPlayingMovie += 1;
    mMovieModel.getNowPlayingMovies(pageForNowPlayingMovie);
  }
}
