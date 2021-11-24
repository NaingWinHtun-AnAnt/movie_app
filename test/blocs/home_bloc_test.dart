import 'package:flutter_test/flutter_test.dart';
import 'package:movie_app/blocs/home_bloc.dart';

import '../data/models/movie_model_impl_mock.dart';
import '../mock_data/mock_data.dart';

void main() {
  group("Home Bloc Test", () {
    HomeBloc? homeBloc;

    setUp(() {
      /// set home bloc dependency(MovieModelImplMock)
      homeBloc = HomeBloc(movieModel: MovieModelImplMock());
    });

    /// now playing movie
    test("Fetch Now Playing Movie", () {
      expect(
        homeBloc?.mNowPlayingMovieList?.contains(getMockMovies().first),
        true,
      );
    });

    /// popular movie
    test("Fetch Popular Movie", () {
      expect(
        homeBloc?.mPopularMovieList?.contains(getMockMovies()[1]),
        true,
      );
    });

    /// top rated movie
    test("Fetch Top Rated Movie", () {
      expect(
        homeBloc?.mTopRatedMovieList?.contains(getMockMovies()[2]),
        true,
      );
    });

    /// genre list
    test("Fetch Genre List", () {
      expect(
        homeBloc?.mGenreList?.contains(getMockGenres().first),
        true,
      );
    });

    /// movie list by genre
    test("Fetch Movie By Genre", () async {
      /// delay must be apply, otherwise test fail
      /// it's method invoked inside other method
      await Future.delayed(Duration(milliseconds: 500));
      expect(
        homeBloc?.mMovieListByGenre?.contains(getMockMovies().first),
        true,
      );
    });

    /// actor list
    test("Fetch Actor", () {
      expect(
        homeBloc?.mActorList,
        getMockActors(),
      );
    });

    /// movie list by genre
    test("Fetch Movie By Genre Selected by User", () async {
      homeBloc?.onTapGenre(3);

      /// delay must be apply, otherwise test fail
      /// it's method invoked inside other method
      await Future.delayed(Duration(milliseconds: 500));
      expect(
        homeBloc?.mMovieListByGenre?.contains(getMockMovies().last),
        true,
      );
    });

  });
}
