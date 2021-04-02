import 'package:dio/dio.dart';
import 'package:movie_app/data/vos/movie_vo.dart';
import 'package:movie_app/network/agents/movie_data_agent.dart';
import 'package:movie_app/network/api_constants.dart';

class DioMovieDataAgentImpl extends MovieDataAgent {
  @override
  Future<List<MovieVO>> getNowPlayingMovies(int page) {
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
}
