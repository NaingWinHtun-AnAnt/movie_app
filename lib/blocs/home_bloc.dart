import 'package:flutter/foundation.dart';
import 'package:movie_app/data/models/movie_model.dart';
import 'package:movie_app/data/models/movie_model_impl.dart';
import 'package:movie_app/data/vos/actor_vo.dart';
import 'package:movie_app/data/vos/genre_vo.dart';
import 'package:movie_app/data/vos/movie_vo.dart';

class HomeBloc extends ChangeNotifier {
  /// States
  List<MovieVO> mNowPlayingMovieList;
  List<MovieVO> mPopularMovieList;
  List<MovieVO> mTopRatedMovieList;
  List<MovieVO> mMovieListByGenre;
  List<ActorVO> mActorList;
  List<GenreVO> mGenreList;

  /// model
  MovieModel mMovieModel = MovieModelImpl();

  HomeBloc() {
    /// nowPlaying
    mMovieModel.getNowPlayingMoviesFromDatabase().then((movieList) {
      mNowPlayingMovieList = movieList;
      notifyListeners();
    }).catchError((error) {
      debugPrint(error);
    });

    /// popular
    mMovieModel.getPopularMoviesFromDatabase().then((popularMovieList) {
      mPopularMovieList = popularMovieList;
      notifyListeners();
    }).catchError((error) {
      debugPrint(error);
    });

    /// top rated
    mMovieModel.getTopRatedMoviesFromDatabase().then((topRatedMovieList) {
      mTopRatedMovieList = topRatedMovieList;
      notifyListeners();
    }).catchError((error) {
      debugPrint(error);
    });

    /// actors
    mMovieModel.getActorFromDatabase().then((actorList) {
      mActorList = actorList;
      notifyListeners();
    }).catchError(
      (error) => debugPrint(error),
    );

    /// genre
    mMovieModel.getGenreFromDatabase().then((genreList) {
      mGenreList = genreList;

      getMovieListByGenre(mGenreList.first.id);

      notifyListeners();
    }).catchError(
      (error) => debugPrint(
        error,
      ),
    );
  }

  void getMovieListByGenre(int genreId) {
    mMovieModel.getMovieListByGenreId(genreId.toString()).then((value) {
      mMovieListByGenre = value;
      notifyListeners();
    });
  }
}
