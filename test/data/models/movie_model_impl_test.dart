import 'package:flutter_test/flutter_test.dart';
import 'package:movie_app/data/models/movie_model_impl.dart';
import 'package:movie_app/data/vos/movie_vo.dart';

import '../../mock_data/mock_data.dart';
import '../../network/movie_data_agent_impl_mock.dart';
import '../../persistence/actor_dao_impl_mock.dart';
import '../../persistence/credit_dao_impl_mock.dart';
import '../../persistence/genre_dao_impl_mock.dart';
import '../../persistence/movie_dao_impl_mock.dart';

void main() {
  group("movie_model_impl", () {
    var movieModel = MovieModelImpl();
    var movieModel1 = MovieModelImpl();

    /// set up
    /// this function will invoke before a single test run
    setUp(() {
      movieModel.setDaosAndDataAgent(
        MovieDataAgentImplMock(),
        ActorDaoImplMock(),
        MovieDaoImplMock(),
        GenreDaoImplMock(),
        CreditDaoImplMock(),
      );
    });

    /// test get now playing movie from database
    /// expect value must be the same with actual value return type
    test("Save now playing movie and retrieve it from database", () {
      expect(
        movieModel.getNowPlayingMoviesFromDatabase(),
        emits(
          [
            MovieVO(
              adult: false,
              backDropPath: "/2Xe9lISpwXKhvKiHttbFfVRERQX.jpg",
              genreIds: [18, 35, 10402],
              id: 490132,
              originalLanguage: "en",
              originalTitle: "Green Book",
              overView:
                  "Tony Lip, a bouncer in 1962, is hired to drive pianist Don Shirley on a tour through the Deep South in the days when African Americans, forced to find alternate accommodations and services due to segregation laws below the Mason-Dixon Line, relied on a guide called The Negro Motorist Green Book.",
              popularity: 29.525,
              posterPath: "/7BsvSuDQuoqhWmU2fL7W2GOcZHU.jpg",
              releaseDate: "2018-11-16",
              title: "Green Book",
              video: false,
              voteAverage: 8.3,
              voteCount: 8293,
              isNowPlaying: true,
            ),
          ],
        ),
      );
    });

    /// test get now playing movie from database
    /// expect value must be the same with actual value return type
    test("Save top rated movie and retrieve it from database", () {
      expect(
        movieModel.getTopRatedMoviesFromDatabase(),
        emits(
          [
            MovieVO(
              adult: false,
              backDropPath: "/bF8GCJ3ZLlS5nLwDlL3CTljdXzN.jpg",
              genreIds: [18, 53, 36],
              id: 314365,
              originalLanguage: "en",
              originalTitle: "Spotlight",
              overView:
                  "The true story of how the Boston Globe uncovered the massive scandal of child molestation and cover-up within the local Catholic Archdiocese, shaking the entire Catholic Church to its core.",
              popularity: 17.412,
              posterPath: "/rBkptJyAMqCfoMwUGQfCpubroec.jpg",
              releaseDate: "2015-11-06",
              title: "Spotlight",
              video: false,
              voteAverage: 7.8,
              voteCount: 6786,
              isTopRated: true,
            ),
          ],
        ),
      );
    });

    /// test get popular movie from database
    /// expect value must be the same with actual value return type
    test("Save popular movie and retrieve it from database", () {
      expect(
        movieModel.getPopularMoviesFromDatabase(),
        emits(
          [
            MovieVO(
              adult: false,
              backDropPath: "/hVYhrKuQNFro6jXHZMn60uYjrIP.jpg",
              genreIds: [18, 14, 10749],
              id: 399055,
              originalLanguage: "en",
              originalTitle: "The Shape of Water",
              overView:
                  "An other-worldly story, set against the backdrop of Cold War era America circa 1962, where a mute janitor working at a lab falls in love with an amphibious man being held captive there and devises a plan to help him escape.",
              popularity: 31.672,
              posterPath: "/9zfwPffUXpBrEP26yp0q1ckXDcj.jpg",
              releaseDate: "2017-12-01",
              title: "The Shape of Water",
              video: false,
              voteAverage: 7.3,
              voteCount: 10110,
              isPopular: true,
            ),
          ],
        ),
      );
    });

    /// genres
    test("Get Genres", () {
      expect(
        /// todo(remove future return type in getGenre() function after test automation)
        movieModel.getGenre(),
        completion(
          equals(
            getMockGenres(),
          ),
        ),
      );
    });

    /// singleton test for model object
    test("Singleton Test", () {
      expect(movieModel, movieModel1);
    });

    /// actor
    test("Get Actors", () {
      expect(
        movieModel.getActorFromDatabase(),
        emits(getMockActors()),
      );
    });

    /// credit by movie
    test("Credit by Movie", () {
      expect(
        movieModel.getCreditByMovieIdFromDatabase("1"),
        emits(getMockCredits()),
      );
    });

    /// movie detail
    test("Movie Detail", () {
      expect(
          movieModel.getMovieDetailByIdFromDatabase(1),
          emits(
            getMockMovies().first,
          ));
    });

    /// save to database(map) and retrieve from database(map)
    /// async await need??????????
    /// await need a return
    test("Actor from database", () {
      movieModel.getActor(1);
      expect(
        movieModel.getActorFromDatabase(),
        emits(getMockActors()),
      );
    });

    /// save movie detail to database(map) and retrieve from database(map)
    test("MovieDetail from database", () {
      movieModel.getMovieDetailById("1");
      expect(
        movieModel.getMovieDetailByIdFromDatabase(1),
        emits(getMockMovies().first),
      );
    });

    /// save and retrieve genres from database(map)
    test("Genre Database", () {
      movieModel.getGenre();
      expect(
        movieModel.getGenreFromDatabase(),
        emits(getMockGenres()),
      );
    });
  });
}
