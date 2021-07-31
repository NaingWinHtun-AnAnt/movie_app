import 'dart:async';
import 'package:movie_app/data/models/movie_model.dart';
import 'package:movie_app/data/models/movie_model_impl.dart';
import 'package:movie_app/data/vos/actor_vo.dart';
import 'package:movie_app/data/vos/genre_vo.dart';
import 'package:movie_app/data/vos/movie_vo.dart';

class HomeBloc {
  /// Reactive Stream
  StreamController<List<MovieVO>> mNowPlayingStreamController =
      StreamController();
  StreamController<List<MovieVO>> mPopularStreamController = StreamController();
  StreamController<List<MovieVO>> mTopRatedStreamController =
      StreamController();
  StreamController<List<MovieVO>> mMovieListByGenreStreamController =
      StreamController();
  StreamController<List<ActorVO>> mActorStreamController = StreamController();
  StreamController<List<GenreVO>> mGenreStreamController = StreamController();

  MovieModel mMovieModel = MovieModelImpl();

  HomeBloc() {
    /// nowPlaying
    mMovieModel.getNowPlayingMoviesFromDatabase().then((movieList) {
      mNowPlayingStreamController.sink.add(movieList);
    }).catchError((error) {
      print(error);
    });

    /// popular
    mMovieModel.getPopularMoviesFromDatabase().then((popularMovieList) {
      mPopularStreamController.sink.add(popularMovieList);
    }).catchError((error) {
      print(error);
    });

    /// top rated
    mMovieModel.getTopRatedMoviesFromDatabase().then((topRatedMovieList) {
      mTopRatedStreamController.sink.add(topRatedMovieList);
    }).catchError((error) {
      print(error);
    });

    /// actors
    mMovieModel.getActorFromDatabase().then((actorList) {
      mActorStreamController.sink.add(actorList);
    }).catchError((error) {
      print(error);
    });

    /// genre
    mMovieModel.getGenreFromDatabase().then((genreList) {
      mGenreStreamController.sink.add(genreList);
      getMovieListByGenre(genreList.first.id);
    }).catchError((error) {
      print(
        error,
      );
    });
  }

  void getMovieListByGenre(int genreId) {
    mMovieModel.getMovieListByGenreId(genreId.toString()).then((value) {
      mMovieListByGenreStreamController.sink.add(value);
    }).catchError((error) {
      print(error);
    });
  }

  void dispose() {
    mNowPlayingStreamController.close();
    mPopularStreamController.close();
    mTopRatedStreamController.close();
    mMovieListByGenreStreamController.close();
    mActorStreamController.close();
    mGenreStreamController.close();
  }
}
