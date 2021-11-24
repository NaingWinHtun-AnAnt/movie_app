import 'package:movie_app/data/vos/actor_vo.dart';
import 'package:movie_app/data/vos/credit_vo.dart';
import 'package:movie_app/data/vos/genre_vo.dart';
import 'package:movie_app/data/vos/movie_vo.dart';
import 'package:movie_app/network/agents/movie_data_agent.dart';

import '../mock_data/mock_data.dart';

class MovieDataAgentImplMock extends MovieDataAgent {
  @override
  Future<List<ActorVO>?>? getBestActor(int page) {
    return Future.value(getMockActors());
  }

  @override
  Future<List<CreditVO>?>? getCreditByMovie(String movieId) {
    return Future.value(getMockCredits());
  }

  @override
  Future<List<GenreVO>?>? getGenre() {
    return Future.value(getMockGenres());
  }

  @override
  Future<MovieVO?>? getMovieDetailById(String movieId) {
    return Future.value(getMockMovies().first);
  }

  @override
  Future<List<MovieVO>?>? getMovieListByGenreId(String genreId) {
    return Future.value(getMockMovies());
  }

  @override
  Future<List<MovieVO>?>? getNowPlayingMovies(int page) {
    return Future.value(
      getMockMovies().where((element) => element.isNowPlaying).toList(),
    );
  }

  @override
  Future<List<MovieVO>?>? getPopularMovies(int page) {
    return Future.value(
      getMockMovies().where((element) => element.isPopular).toList(),
    );
  }

  @override
  Future<List<MovieVO>?>? getTopRatedMovies(int page) {
    return Future.value(
      getMockMovies().where((element) => element.isTopRated).toList(),
    );
  }
}
