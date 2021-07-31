import 'package:dio/dio.dart';
import 'package:movie_app/data/vos/movie_vo.dart';
import 'package:movie_app/network/api_constants.dart';
import 'package:movie_app/network/responses/best_actor_response.dart';
import 'package:movie_app/network/responses/genre_response.dart';
import 'package:movie_app/network/responses/get_credit_by_movie_response.dart';
import 'package:movie_app/network/responses/movie_list_response.dart';
import 'package:retrofit/http.dart';

part 'the_movie_api.g.dart';

@RestApi(baseUrl: BASE_URL_DIO)
abstract class TheMovieApi {
  factory TheMovieApi(
    Dio dio,
  ) = _TheMovieApi;

  @GET(ENDPOINT_GET_NOW_PLAYING)
  Future<MovieListResponse> getNowPlayingMovies(
    @Query(PARAM_API_KEY) String apiKey,
    @Query(PARAM_LANGUAGE) String language,
    @Query(PARAM_PAGE) String page,
  );

  @GET(ENDPOINT_GET_POPULAR)
  Future<MovieListResponse> getPopularMovies(
    @Query(PARAM_API_KEY) String apiKey,
    @Query(PARAM_LANGUAGE) String language,
    @Query(PARAM_PAGE) String page,
  );

  @GET(ENDPOINT_GET_TOP_RATED)
  Future<MovieListResponse> getTopRatedMovies(
    @Query(PARAM_API_KEY) String apiKey,
    @Query(PARAM_LANGUAGE) String language,
    @Query(PARAM_PAGE) String page,
  );

  @GET(ENDPOINT_GET_POPULAR_ACTOR)
  Future<BestActorResponse> getActor(
    @Query(PARAM_API_KEY) String apiKey,
    @Query(PARAM_LANGUAGE) String language,
    @Query(PARAM_PAGE) String page,
  );

  @GET(ENDPOINT_GET_GENRE)
  Future<GenreResponse> getGenre(
    @Query(PARAM_API_KEY) String apiKey,
    @Query(PARAM_LANGUAGE) String language,
  );

  @GET(ENDPOINT_GET_MOVIE_BY_GENRE_ID)
  Future<MovieListResponse> getMovieByGenreId(
    @Query(PARAM_GENRE) String genreId,
    @Query(PARAM_API_KEY) String apiKey,
    @Query(PARAM_LANGUAGE) String language,
  );

  @GET('$ENDPOINT_GET_MOVIE_DETAIL/{movie_id}')
  Future<MovieVO> getMovieDetails(
    @Path("movie_id") String movieId,
    @Query(PARAM_API_KEY) String apiKey,
    @Query(PARAM_LANGUAGE) String language,
    @Query(PARAM_PAGE) String page,
  );

  @GET('$ENDPOINT_GET_CREDIT_BY_MOVIE/{movie_id}/credits')
  Future<GetCreditByMovieResponse> getCreditByMovie(
    @Path("movie_id") String movieId,
    @Query(PARAM_API_KEY) String apiKey,
    @Query(PARAM_LANGUAGE) String language,
    @Query(PARAM_PAGE) String page,
  );
}
