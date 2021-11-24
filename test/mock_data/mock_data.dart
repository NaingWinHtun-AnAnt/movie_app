import 'package:movie_app/data/vos/actor_vo.dart';
import 'package:movie_app/data/vos/credit_vo.dart';
import 'package:movie_app/data/vos/genre_vo.dart';
import 'package:movie_app/data/vos/movie_vo.dart';

List<MovieVO> getMockMovies() {
  return [
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
  ];
}

List<ActorVO> getMockActors() {
  return [
    ActorVO(
      adult: false,
      gender: 1,
      id: 2564437,
      knownFor: [],
      name: "Janaina Liesenfeld",
      popularity: 49.356,
      profilePath: "/1AGg7Rh5a2wAIsHQYl0IGtrddW9.jpg",
    ),
    ActorVO(
      adult: false,
      gender: 2,
      id: 1048070,
      knownFor: [],
      name: "Oh Yeong-su",
      popularity: 49.085,
      profilePath: "/kUzd955UTVnac2sVG0tYmt9w5jb.jpg",
    ),
    ActorVO(
      adult: false,
      gender: 2,
      id: 73249,
      knownFor: [],
      name: "Lee Jung-jae",
      popularity: 45.172,
      profilePath: "/s3Sv4bZORQ5DuZJahgU2X0RgMUQ.jpg",
    ),
  ];
}

List<GenreVO> getMockGenres() {
  return [
    GenreVO(
      id: 28,
      name: "Action",
    ),
    GenreVO(
      id: 12,
      name: "Adventure",
    ),
    GenreVO(
      id: 16,
      name: "Animation",
    ),
  ];
}

List<CreditVO> getMockCredits() {
  return [
    CreditVO(
      adult: false,
      gender: 1,
      id: 90633,
      knownForDepartment: "Acting",
      name: "Gal Gadot",
      originalName: "Gal Gadot",
      popularity: 21.586,
      profilePath: "/wAINRpTWQTtBpZyEPEQCWi5OjUP.jpg",
      castId: 0,
      character: "Diana Prince / Wonder Woman",
      creditId: "595686e4c3a368382e050da4",
      order: 0,
    ),
    CreditVO(
      adult: false,
      gender: 2,
      id: 62064,
      knownForDepartment: "Acting",
      name: "Chris Pine",
      originalName: "Chris Pine",
      popularity: 10.526,
      profilePath: "/vSe6sIsdtcoqBhuWRXynahFg8Vf.jpg",
      castId: 15,
      character: "Steve Trevor",
      creditId: "5b0b4526c3a3684adc0097a5",
      order: 1,
    ),
    CreditVO(
      adult: false,
      gender: 1,
      id: 41091,
      knownForDepartment: "Creating",
      name: "Kristen Wiig",
      originalName: "Kristen Wiig",
      popularity: 9.077,
      profilePath: "/N517EQh7j4mNl3BStMmjMN6hId.jpg",
      castId: 12,
      character: "Barbara Minerva / Cheetah",
      creditId: "5a975236c3a36861510077f1",
      order: 2,
    ),
  ];
}
