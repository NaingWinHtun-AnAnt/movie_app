import 'dart:async';

import 'package:movie_app/data/models/movie_model.dart';
import 'package:movie_app/data/models/movie_model_impl.dart';
import 'package:movie_app/data/vos/credit_vo.dart';
import 'package:movie_app/data/vos/movie_vo.dart';

class MovieDetailBloc {
  /// Stream Controllers
  StreamController<MovieVO> mMovieStreamController = StreamController();
  StreamController<List<CreditVO>> mActorListStreamController =
      StreamController();
  StreamController<List<CreditVO>> mCreatorListStreamController =
      StreamController();

  /// Model
  MovieModel mMovieModel = MovieModelImpl();

  MovieDetailBloc(int movieId) {
    /// database
    mMovieModel.getMovieDetailByIdFromDatabase(movieId).then((value) {
      mMovieStreamController.sink.add(value);
    }).catchError((error) {
      print(error);
    });

    /// actors and creators
    mMovieModel.getCreditByMovieId(movieId.toString()).then((creditList) {
      mActorListStreamController.sink.add(
        creditList.where((element) => element.isActor()).toList(),
      );
      mCreatorListStreamController.sink.add(
        creditList.where((element) => element.isCreator()).toList(),
      );
    });
  }

  void dispose() {
    mMovieStreamController.close();
    mActorListStreamController.close();
    mCreatorListStreamController.close();
  }
}
