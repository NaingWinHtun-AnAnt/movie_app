import 'package:dio/dio.dart';
import 'package:movie_app/data/vos/actor_vo.dart';
import 'package:movie_app/data/vos/credit_vo.dart';
import 'package:movie_app/data/vos/genre_vo.dart';
import 'package:movie_app/data/vos/movie_vo.dart';
import 'package:movie_app/network/agents/movie_data_agent.dart';
import 'package:movie_app/network/api_constants.dart';

class DioMovieDataAgentImpl extends MovieDataAgent {
  @override

  ///TODO:Return MOVIE LIST IF you wanna use dio data agent and remove ignore : Missing return
  // ignore: missing_return
  Future<List<MovieVO>?>? getNowPlayingMovies(int page) {
    Map<String, String> queryParameters = {
      PARAM_API_KEY: API_KEY,
      PARAM_LANGUAGE: LANGUAGE_EN_US,
      PARAM_PAGE: page.toString(),
    };

    Dio()
        .get(
      "$BASE_URL_DIO$ENDPOINT_GET_NOW_PLAYING",
      queryParameters: queryParameters,
    )
        .then(
      (value) {
        print(
          "NOW PLAYING MOVIES=>>>>>>>>>${value.toString()}",
        );
      },
    ).catchError(
      (error) {
        print(
          "ERROR=>>>>>>>>>>$error",
        );
      },
    );
  }

  @override
  Future<List<MovieVO>> getPopularMovies(int page) {
    // TODO: implement getPopularMovies
    throw UnimplementedError();
  }

  @override
  Future<List<MovieVO>> getTopRatedMovies(int page) {
    // TODO: implement getTopRatedMovies
    throw UnimplementedError();
  }

  @override
  Future<List<ActorVO>> getBestActor(int page) {
    // TODO: implement getBestActor
    throw UnimplementedError();
  }

  @override
  Future<List<GenreVO>> getGenre() {
    // TODO: implement getGenre
    throw UnimplementedError();
  }

  @override
  Future<List<MovieVO>> getMovieListByGenreId(String genreId) {
    // TODO: implement getMovieListByGenreId
    throw UnimplementedError();
  }

  @override
  Future<List<CreditVO>> getCreditByMovie(String movieId) {
    // TODO: implement getMovieListByGenreId
    throw UnimplementedError();
  }

  @override
  Future<MovieVO> getMovieDetailById(String movieId) {
    // TODO: implement getMovieListByGenreId
    throw UnimplementedError();
  }
}
