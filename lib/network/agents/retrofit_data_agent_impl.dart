import 'package:dio/dio.dart';
import 'package:movie_app/data/vos/actor_vo.dart';
import 'package:movie_app/data/vos/credit_vo.dart';
import 'package:movie_app/data/vos/genre_vo.dart';
import 'package:movie_app/data/vos/movie_vo.dart';
import 'package:movie_app/network/agents/movie_data_agent.dart';
import 'package:movie_app/network/api_constants.dart';
import 'package:movie_app/network/the_movie_api.dart';

class RetrofitDataAgentImpl extends MovieDataAgent {
  TheMovieApi? mApi;

  RetrofitDataAgentImpl._internal() {
    final dio = Dio();
    mApi = TheMovieApi(dio);
  }

  static final RetrofitDataAgentImpl _singleton =
      RetrofitDataAgentImpl._internal();

  factory RetrofitDataAgentImpl() {
    return _singleton;
  }

  @override
  Future<List<MovieVO>?>? getNowPlayingMovies(int page) {
    return mApi
        ?.getNowPlayingMovies(
          API_KEY,
          LANGUAGE_EN_US,
          page.toString(),
        )
        .asStream()
        .map((response) => response.result)
        .first;
  }

  @override
  Future<List<MovieVO>?>? getPopularMovies(int page) {
    return mApi
        ?.getPopularMovies(
          API_KEY,
          LANGUAGE_EN_US,
          page.toString(),
        )
        .asStream()
        .map((response) => response.result)
        .first;
  }

  @override
  Future<List<MovieVO>?>? getTopRatedMovies(int page) {
    return mApi
        ?.getTopRatedMovies(API_KEY, LANGUAGE_EN_US, page.toString())
        .asStream()
        .map(
          (event) => event.result,
        )
        .first;
  }

  @override
  Future<List<ActorVO>?>? getBestActor(int page) {
    return mApi
        ?.getActor(
          API_KEY,
          LANGUAGE_EN_US,
          page.toString(),
        )
        .asStream()
        .map((actorResponse) => actorResponse.actorList)
        .first;
  }

  @override
  Future<List<GenreVO>?>? getGenre() {
    return mApi
        ?.getGenre(
          API_KEY,
          LANGUAGE_EN_US,
        )
        .asStream()
        .map((event) => event.genres)
        .first;
  }

  @override
  Future<List<MovieVO>?>? getMovieListByGenreId(String genreId) {
    return mApi
        ?.getMovieByGenreId(
          genreId,
          API_KEY,
          LANGUAGE_EN_US,
        )
        .asStream()
        .map((response) => response.result)
        .first;
  }

  @override
  Future<MovieVO?>? getMovieDetailById(String movieId) {
    return mApi
        ?.getMovieDetails(
          movieId,
          API_KEY,
          LANGUAGE_EN_US,
          "1",
        )
        .asStream()
        .map((event) => event)
        .first;
  }

  @override
  Future<List<CreditVO>?>? getCreditByMovie(String movieId) {
    return mApi
        ?.getCreditByMovie(
          movieId,
          API_KEY,
          LANGUAGE_EN_US,
          "1",
        )
        .asStream()
        .map((event) => event.cast)
        .first;
  }
}
