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

  /// model
  MovieModel mMovieModel = MovieModelImpl();

  MovieDetailBloc(int movieId) {
    /// network
    mMovieModel.getMovieDetailById(movieId.toString())?.then((value) {
      mMovie = value;
      notifyListeners();
    });

    /// database
    mMovieModel.getMovieDetailByIdFromDatabase(movieId).then((value) {
      mMovie = value;
      notifyListeners();
    });

    mMovieModel.getCreditByMovieId(movieId.toString())?.then((creditList) {
      mActorList = creditList?.where((element) => element.isActor()).toList();
      mCreatorList =
          creditList?.where((element) => element.isCreator()).toList();
      notifyListeners();
    });
  }
}
