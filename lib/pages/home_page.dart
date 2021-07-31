import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/data/models/movie_model_impl.dart';
import 'package:movie_app/data/vos/genre_vo.dart';
import 'package:movie_app/data/vos/movie_vo.dart';
import 'package:movie_app/pages/movie_details_page.dart';
import 'package:movie_app/resources/colors.dart';
import 'package:movie_app/resources/dimens.dart';
import 'package:movie_app/resources/strings.dart';
import 'package:movie_app/viewitems/banner_view.dart';
import 'package:movie_app/viewitems/movie_view.dart';
import 'package:movie_app/viewitems/show_case_view.dart';
import 'package:movie_app/widgets/actors_and_creators_section_view.dart';
import 'package:movie_app/widgets/see_more_text.dart';
import 'package:movie_app/widgets/title_text.dart';
import 'package:movie_app/widgets/title_text_with_see_more_text.dart';
import 'package:scoped_model/scoped_model.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: PRIMARY_COLOR,
        leading: Icon(Icons.menu),
        centerTitle: true,
        title: Text(
          MAIN_SCREEN_APP_BAR_TITLE,
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(
              top: 0,
              left: 0,
              bottom: 0,
              right: MARGIN_MEDIUM_2,
            ),
            child: Icon(Icons.search),
          ),
        ],
      ),
      body: Container(
        color: HOME_SCREEN_BACKGROUND_COLOR,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ScopedModelDescendant<MovieModelImpl>(
                builder:
                    (BuildContext context, Widget child, MovieModelImpl model) {
                  return BannerSectionView(
                    model.mPopularMovieList,
                  );
                },
              ),
              SizedBox(height: MARGIN_LARGE),
              ScopedModelDescendant<MovieModelImpl>(
                builder:
                    (BuildContext context, Widget child, MovieModelImpl model) {
                  return BestPopularMoviesAndSerialsSectionView(
                    (movieId) => _navigateToMovieDetailScreen(
                      context,
                      movieId,
                      model,
                    ),
                    model.mNowPlayingMovieList,
                  );
                },
              ),
              SizedBox(height: MARGIN_LARGE),
              CheckMovieShowTimeSectionView(),
              SizedBox(height: MARGIN_LARGE),
              ScopedModelDescendant<MovieModelImpl>(
                builder:
                    (BuildContext context, Widget child, MovieModelImpl model) {
                  return GenreSectionView(
                    (movieId) => _navigateToMovieDetailScreen(
                      context,
                      movieId,
                      model,
                    ),
                    genreList: model.mGenreList,
                    onTapGenre: (genreId) {
                      model.getMovieListByGenreId(genreId.toString());
                    },
                    movieListByGenre: model.mMovieListByGenre,
                  );
                },
              ),
              SizedBox(
                height: MARGIN_MEDIUM_2,
              ),
              ScopedModelDescendant<MovieModelImpl>(
                builder:
                    (BuildContext context, Widget child, MovieModelImpl model) {
                  return ShowCasesSection(
                    topRatedMovies: model.mTopRatedMovieList,
                  );
                },
              ),
              SizedBox(
                height: MARGIN_LARGE,
              ),
              ScopedModelDescendant<MovieModelImpl>(
                builder:
                    (BuildContext context, Widget child, MovieModelImpl model) {
                  return ActorsAndCreatorsSectionView(
                    BEST_ACTORS_TITLE,
                    BEST_ACTORS_SEE_MORE,
                    actorList: model.mActors,
                  );
                },
              ),
              SizedBox(
                height: MARGIN_LARGE,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _navigateToMovieDetailScreen(
      BuildContext context, int movieId, MovieModelImpl model) {
    model.getMovieDetailById(movieId.toString());
    model.getMovieDetailByIdFromDatabase(movieId);
    model.getCreditByMovieId(movieId.toString());

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MovieDetailsPage(
        ),
      ),
    );
  }
}

class GenreSectionView extends StatelessWidget {
  final List<GenreVO> genreList;
  final List<MovieVO> movieListByGenre;
  final Function(int) onTapMovie;
  final Function(int) onTapGenre;

  const GenreSectionView(
    this.onTapMovie, {
    @required this.genreList,
    @required this.movieListByGenre,
    @required this.onTapGenre,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: MARGIN_MEDIUM_2,
          ),
          child: DefaultTabController(
            length: genreList.length,
            child: TabBar(
              isScrollable: true,
              onTap: (index) => onTapGenre(genreList[index].id),
              indicatorColor: PLAY_BUTTON_COLOR,
              unselectedLabelColor: HOME_SCREEN_LIST_TITLE_COLOR,
              tabs: genreList
                  .map(
                    (e) => Tab(
                      child: Text(e.name),
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
        Container(
          color: PRIMARY_COLOR,
          padding: EdgeInsets.only(
            top: MARGIN_MEDIUM_2,
            bottom: MARGIN_MEDIUM,
          ),
          child: HorizontalMovieListView(
            (movieId) {
              this.onTapMovie(movieId);
            },
            movieList: movieListByGenre,
          ),
        ),
      ],
    );
  }
}

class CheckMovieShowTimeSectionView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(MARGIN_LARGE),
      margin: EdgeInsets.symmetric(
        horizontal: MARGIN_MEDIUM_2,
      ),
      height: SHOW_TIME_SECTION_HEIGHT,
      color: PRIMARY_COLOR,
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                MAIN_SCREEN_CHECK_MOVIE_SHOW_TIME,
                style: TextStyle(
                  fontSize: TEXT_HEADING_1X,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              Spacer(),
              SeeMoreText(
                MAIN_SCREEN_SEE_MORE,
                textColor: PLAY_BUTTON_COLOR,
              ),
            ],
          ),
          Spacer(),
          Icon(
            Icons.location_pin,
            color: Colors.white,
            size: BANNER_PLAY_BUTTON_SIZE,
          ),
        ],
      ),
    );
  }
}

class ShowCasesSection extends StatelessWidget {
  final List<MovieVO> topRatedMovies;

  ShowCasesSection({
    this.topRatedMovies,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: MARGIN_MEDIUM_2,
          ),
          child: TitleTextWithSeeMoreView(
            SHOW_CASES_TITLE,
            SHOW_CASES_SEE_MORE,
          ),
        ),
        SizedBox(
          height: MARGIN_MEDIUM_2,
        ),
        Container(
          height: SHOW_CASES_HEIGHT,
          child: ListView(
            padding: EdgeInsets.only(left: MARGIN_MEDIUM_2),
            scrollDirection: Axis.horizontal,
            children: topRatedMovies
                .map(
                  (topRatedMovieList) => ShowCaseView(
                    topRatedMovie: topRatedMovieList,
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }
}

class BestPopularMoviesAndSerialsSectionView extends StatelessWidget {
  final Function(int) onTapMovie;
  final List<MovieVO> mNowPlayingMovieList;

  BestPopularMoviesAndSerialsSectionView(
    this.onTapMovie,
    this.mNowPlayingMovieList,
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(
            left: MARGIN_MEDIUM_2,
          ),
          child: TitleText(
            BEST_POPULAR_MOVIES_AND_SERIALS,
          ),
        ),
        SizedBox(
          height: MARGIN_MEDIUM_2,
        ),
        HorizontalMovieListView(
          (movieId) => onTapMovie(movieId),
          movieList: mNowPlayingMovieList,
        ),
      ],
    );
  }
}

class HorizontalMovieListView extends StatelessWidget {
  final Function(int) onTapMovie;
  final List<MovieVO> movieList;

  HorizontalMovieListView(
    this.onTapMovie, {
    this.movieList,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MOVIE_LIST_HEIGHT,
      child: movieList != null
          ? ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.only(left: MARGIN_MEDIUM_2),
              itemCount: movieList.length,
              itemBuilder: (BuildContext context, int index) {
                return MovieView(
                  () => this.onTapMovie(movieList[index].id),
                  movie: movieList[index],
                );
              },
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}

class BannerSectionView extends StatefulWidget {
  final List<MovieVO> popularMovieList;

  const BannerSectionView(
    this.popularMovieList,
  );

  @override
  _BannerSectionViewState createState() => _BannerSectionViewState();
}

class _BannerSectionViewState extends State<BannerSectionView> {
  double _position = 0.0;

  @override
  Widget build(BuildContext context) {
    return widget.popularMovieList != null
        ? Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 4,
                child: PageView(
                  onPageChanged: (page) {
                    setState(() {
                      _position = page.toDouble();
                    });
                  },
                  children: widget.popularMovieList
                      .map(
                        (popularMovie) => BannerView(
                          popularMovie,
                        ),
                      )
                      .toList(),
                ),
              ),
              SizedBox(
                height: MARGIN_MEDIUM_2,
              ),
              DotsIndicator(
                dotsCount: widget.popularMovieList.length,
                position: _position,
                decorator: DotsDecorator(
                  spacing: EdgeInsets.all(4),
                  color: HOME_SCREEN_BANNER_DOT_INACTIVE_COLOR,
                  activeColor: PLAY_BUTTON_COLOR,
                ),
              ),
            ],
          )
        : Container(
            height: MediaQuery.of(context).size.height / 4,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
  }
}
