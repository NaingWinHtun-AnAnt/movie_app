import 'package:movie_app/data/vos/movie_vo.dart';
import 'package:movie_app/network/agents/movie_data_agent.dart';
import 'package:movie_app/network/api_constants.dart';
import 'package:http/http.dart' as http;

class HttpMovieDataAgentImpl extends MovieDataAgent {
  @override
  Future<List<MovieVO>> getNowPlayingMovies(int page) {
    Map<String, String> queryParameters = {
      PARAM_API_KEY: API_KEY,
      PARAM_LANGUAGE: LANGUAGE_EN_US,
      PARAM_PAGE: page.toString(),
    };

    var url = Uri.https(
      BASE_URL_HTTP,
      ENDPOINT_GET_NOW_PLAYING,
      queryParameters,
    );

    http.get(url).then(
      (value) {
        print("NOW PLAYING MOVIES=>>>>>>>>${value.body.toString()}");
      },
    ).catchError(
      (error) {
        print("ERROR=>>>>>>>>$error");
      },
    );
  }
}
