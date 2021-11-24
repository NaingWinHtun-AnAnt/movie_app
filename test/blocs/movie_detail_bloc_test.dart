import 'package:flutter_test/flutter_test.dart';
import 'package:movie_app/blocs/movie_detail_bloc.dart';

import '../data/models/movie_model_impl_mock.dart';
import '../mock_data/mock_data.dart';

void main() {
  group("Movie Detail Bloc", () {
    MovieDetailBloc? movieDetailBloc;

    setUp(() {
      movieDetailBloc = MovieDetailBloc(1, movieModel: MovieModelImplMock());
    });

    test("Movie Detail Test", () {
      expect(
        movieDetailBloc?.mMovie,
        getMockMovies().first,
      );
    });

    test("Movie Detail Actor List", () {
      expect(
        movieDetailBloc?.mActorList?.contains(getMockCredits().first),
        true,
      );
    });

    test("Movie Detail Credit List", () {
      expect(
        movieDetailBloc?.mCreatorList?.contains(getMockCredits().last),
        true,
      );
    });

    test("Related Movie List", () async {
      await Future.delayed(Duration(microseconds: 500));
      expect(
        movieDetailBloc?.mRelatedMovies?.contains(getMockMovies().first),
        true,
      );
    });
  });
}
