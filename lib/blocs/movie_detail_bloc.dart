import 'package:flutter/cupertino.dart';
import 'package:movie_app/data/models/movie_model.dart';
import 'package:movie_app/data/models/movie_model_impl.dart';
import 'package:movie_app/data/vos/credit_vo.dart';
import 'package:movie_app/data/vos/movie_vo.dart';

class MovieDetailBloc extends ChangeNotifier {
  /// states
  MovieVO? mMovie;
  List<CreditVO>? mActorList;
  List<CreditVO>? mCreatorList;
  List<MovieVO>? mRelatedMovies;

  /// model
  MovieModel mMovieModel = MovieModelImpl();

  MovieDetailBloc(int movieId, {MovieModel? movieModel}) {
    /// set movieModel with movieModelMock
    if (movieModel != null) {
      mMovieModel = movieModel;
    }

    /// database
    mMovieModel.getMovieDetailByIdFromDatabase(movieId).listen((value) {
      mMovie = value;
      this.getRelatedMovies(mMovie?.genres?.first.id ?? 0);
      notifyListeners();
    });

    mMovieModel
        .getCreditByMovieIdFromDatabase(movieId.toString())
        ?.listen((creditList) {
      mActorList = creditList?.where((element) => element.isActor()).toList();
      mCreatorList =
          creditList?.where((element) => element.isCreator()).toList();
      notifyListeners();
    });
  }

  void getRelatedMovies(int genreId) {
    mMovieModel.getMovieListByGenreId(genreId.toString())?.then((value) {
      mRelatedMovies = value;
      notifyListeners();
    });
  }
}
