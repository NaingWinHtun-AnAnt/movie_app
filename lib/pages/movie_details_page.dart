import 'package:flutter/material.dart';
import 'package:movie_app/data/models/movie_model_impl.dart';
import 'package:movie_app/data/vos/movie_vo.dart';
import 'package:movie_app/network/api_constants.dart';
import 'package:movie_app/resources/colors.dart';
import 'package:movie_app/resources/dimens.dart';
import 'package:movie_app/resources/strings.dart';
import 'package:movie_app/widgets/actors_and_creators_section_view.dart';
import 'package:movie_app/widgets/gradient_view.dart';
import 'package:movie_app/widgets/rating_view.dart';
import 'package:movie_app/widgets/title_text.dart';
import 'package:scoped_model/scoped_model.dart';

class MovieDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<MovieModelImpl>(
      builder: (BuildContext context, Widget child, MovieModelImpl model) {
        return Scaffold(
          body: model.mMovie == null
              ? Center(
            child: CircularProgressIndicator(),
          )
              : Container(
            color: HOME_SCREEN_BACKGROUND_COLOR,
            child: CustomScrollView(
              slivers: [
                MovieDetailsSliverAppBarView(
                      () => Navigator.pop(context),
                  model.mMovie,
                ),
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: MARGIN_MEDIUM_2,
                        ),
                        child: TrailerSectionView(
                          model.mMovie,
                        ),
                      ),
                      SizedBox(
                        height: MARGIN_LARGE,
                      ),
                      ActorsAndCreatorsSectionView(
                        MOVIE_DETAILS_SCREEN_ACTORS,
                        "",
                        seeMoreButtonVisibility: false,
                        actorList: model.mActorList,
                      ),
                      SizedBox(
                        height: MARGIN_LARGE,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: MARGIN_MEDIUM_2,
                        ),
                        child: AboutFilmSectionView(
                          movie: model.mMovie,
                        ),
                      ),
                      SizedBox(
                        height: MARGIN_LARGE,
                      ),
                      model.mCreatorList == null || model.mCreatorList.isEmpty
                          ? Container()
                          : ActorsAndCreatorsSectionView(
                        MOVIE_DETAILS_SCREEN_CREATORS,
                        MOVIE_DETAILS_SCREEN_CREATORS_SEE_MORE,
                        actorList: model.mCreatorList,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

}

class AboutFilmSectionView extends StatelessWidget {
  final MovieVO movie;

  const AboutFilmSectionView({
    Key key,
    this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleText("About Film"),
        SizedBox(
          height: MARGIN_MEDIUM_2,
        ),
        AboutFilmInfoView(
          "Original Title:",
          movie.originalTitle,
        ),
        SizedBox(
          height: MARGIN_MEDIUM_2,
        ),
        AboutFilmInfoView(
          "Type:",
          movie.genres != null
              ? movie.genres.map((e) => e.name).join(", ")
              : "",
        ),
        SizedBox(
          height: MARGIN_MEDIUM_2,
        ),
        AboutFilmInfoView(
          "Production:",
          movie.productionCountries != null
              ? movie.productionCountries.map((e) => e.name).join(", ")
              : "",
        ),
        SizedBox(
          height: MARGIN_MEDIUM_2,
        ),
        AboutFilmInfoView(
          "Premiere:",
          movie.releaseDate,
        ),
        SizedBox(
          height: MARGIN_MEDIUM_2,
        ),
        AboutFilmInfoView(
          "Description:",
          movie.overView,
        ),
      ],
    );
  }
}

class AboutFilmInfoView extends StatelessWidget {
  final String label;
  final String description;

  const AboutFilmInfoView(this.label, this.description);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: MediaQuery.of(context).size.width / 4,
          child: Text(
            label,
            style: TextStyle(
              color: MOVIE_DETAIL_SCREEN_INFO_TEXT_COLOR,
              fontSize: TEXT_REGULAR_2X,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        SizedBox(
          width: MARGIN_CARD_MEDIUM_2,
        ),
        Expanded(
          child: Text(
            description,
            style: TextStyle(
              color: Colors.white,
              fontSize: TEXT_REGULAR_2X,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}

class TrailerSectionView extends StatelessWidget {
  final MovieVO movie;

  TrailerSectionView(this.movie);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MovieTimeAndGenreSectionView(
          genreList: movie.genres != null
              ? movie.genres.map((e) => e.name).toList()
              : [],
        ),
        SizedBox(
          height: MARGIN_MEDIUM_3,
        ),
        StoryLineSectionView(
          overView: movie.overView,
        ),
        SizedBox(
          height: MARGIN_MEDIUM_2,
        ),
        Row(
          children: [
            MovieDetailScreenButtonView(
              "PLAY TRAILER",
              PLAY_BUTTON_COLOR,
              Icon(
                Icons.play_circle_fill,
                color: Colors.black54,
              ),
            ),
            SizedBox(
              width: MARGIN_CARD_MEDIUM_2,
            ),
            MovieDetailScreenButtonView(
              "RATE MOVIE",
              HOME_SCREEN_BACKGROUND_COLOR,
              Icon(
                Icons.star,
                color: PLAY_BUTTON_COLOR,
              ),
              isGhostButton: true,
            ),
          ],
        ),
      ],
    );
  }
}

class MovieDetailScreenButtonView extends StatelessWidget {
  final String title;
  final Color backgroundColor;
  final Icon buttonIcon;
  final bool isGhostButton;

  MovieDetailScreenButtonView(
    this.title,
    this.backgroundColor,
    this.buttonIcon, {
    this.isGhostButton = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: MARGIN_CARD_MEDIUM_2,
      ),
      height: MARGIN_XXLARGE,
      decoration: BoxDecoration(
        color: backgroundColor,
        border: (isGhostButton)
            ? Border.all(
                color: Colors.white,
                width: 2,
              )
            : null,
        borderRadius: BorderRadius.circular(
          MARGIN_LARGE,
        ),
      ),
      child: Center(
        child: Row(
          children: [
            buttonIcon,
            SizedBox(
              width: MARGIN_MEDIUM,
            ),
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: TEXT_REGULAR_2X,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class StoryLineSectionView extends StatelessWidget {
  final String overView;

  const StoryLineSectionView({
    this.overView,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleText(
          MOVIE_DETAILS_STORY_LINE,
        ),
        SizedBox(
          height: MARGIN_MEDIUM,
        ),
        Text(
          overView,
          style: TextStyle(
            fontSize: TEXT_REGULAR_2X,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}

class MovieTimeAndGenreSectionView extends StatelessWidget {
  const MovieTimeAndGenreSectionView({
    @required this.genreList,
  });

  final List<String> genreList;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.start,
      direction: Axis.horizontal,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: _createMovieTimeAndGenreWidget(),
    );
  }

  List<Widget> _createMovieTimeAndGenreWidget() {
    List<Widget> widgets = [
      Icon(
        Icons.access_time,
        color: PLAY_BUTTON_COLOR,
      ),
      SizedBox(
        width: MARGIN_SMALL,
      ),
      Text(
        "2h 30min",
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      SizedBox(
        width: MARGIN_MEDIUM,
      ),
    ];

    widgets.addAll(genreList
        .map(
          (genre) => GenreChipView(genre),
        )
        .toList());

    widgets.add(
      Icon(
        Icons.favorite_border,
        color: Colors.white,
      ),
    );
    return widgets;
  }
}

class GenreChipView extends StatelessWidget {
  final String genreText;

  GenreChipView(this.genreText);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Chip(
          backgroundColor: DETAIL_SCREEN_CHIP_BACKGROUND_COLOR,
          label: Text(
            genreText,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        SizedBox(
          width: MARGIN_SMALL,
        ),
      ],
    );
  }
}

class MovieDetailsSliverAppBarView extends StatelessWidget {
  final Function onTapBack;
  final MovieVO movie;

  MovieDetailsSliverAppBarView(
    this.onTapBack,
    this.movie,
  );

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      expandedHeight: MOVIE_DETAILS_PAGE_SLIVER_APP_BAR_HEIGHT,
      backgroundColor: PRIMARY_COLOR,
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          children: [
            Positioned.fill(
              child: MovieDetailsAppBarImageView(
                posterPath: movie.posterPath,
              ),
            ),
            Positioned.fill(
              child: GradientView(),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.only(
                  top: MARGIN_XLARGE,
                  left: MARGIN_MEDIUM_2,
                ),
                child: BackButtonView(
                  () => this.onTapBack(),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: EdgeInsets.only(
                  top: MARGIN_XLARGE + MARGIN_MEDIUM,
                  right: MARGIN_MEDIUM_2,
                ),
                child: SearchButtonView(),
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: MARGIN_MEDIUM_2,
                  right: MARGIN_MEDIUM_2,
                  bottom: MARGIN_LARGE,
                ),
                child: MovieDetailAppBarInfoView(
                  movie: movie,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MovieDetailAppBarInfoView extends StatelessWidget {
  final MovieVO movie;

  MovieDetailAppBarInfoView({
    this.movie,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            MovieDetailsYearView(
              year: movie.releaseDate.substring(0, 4),
            ),
            Spacer(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    RatingView(),
                    SizedBox(
                      height: MARGIN_SMALL,
                    ),
                    TitleText("${movie.voteCount} VOTES"),
                    SizedBox(
                      height: MARGIN_CARD_MEDIUM_2,
                    ),
                  ],
                ),
                SizedBox(
                  width: MARGIN_MEDIUM,
                ),
                Text(
                  movie.voteAverage.toString(),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: MOVIE_DETAIL_RATING_TEXT_SIZE,
                  ),
                ),
              ],
            ),
          ],
        ),
        SizedBox(
          height: MARGIN_MEDIUM,
        ),
        Text(
          movie.title,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: TEXT_HEADING_2X,
          ),
        ),
      ],
    );
  }
}

class MovieDetailsYearView extends StatelessWidget {
  final String year;

  MovieDetailsYearView({
    this.year,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: DETAIL_SCREEN_INFO_YEAR_HEIGHT,
      padding: EdgeInsets.symmetric(
        horizontal: MARGIN_MEDIUM_2,
      ),
      decoration: BoxDecoration(
        color: PLAY_BUTTON_COLOR,
        borderRadius: BorderRadius.circular(DETAIL_SCREEN_INFO_YEAR_RADIUS),
      ),
      child: Center(
        child: Text(
          year,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class SearchButtonView extends StatelessWidget {
  const SearchButtonView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.search,
      size: SLIVER_APP_BAR_SEARCH_BUTTON_SIZE,
      color: Colors.white,
    );
  }
}

class BackButtonView extends StatelessWidget {
  final Function onTapBack;

  BackButtonView(
    this.onTapBack,
  );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        this.onTapBack();
      },
      child: Container(
        height: SLIVER_APP_BAR_BACK_BUTTON_SIZE,
        width: SLIVER_APP_BAR_BACK_BUTTON_SIZE,
        decoration: BoxDecoration(
          color: Colors.black54,
          shape: BoxShape.circle,
        ),
        child: Icon(
          Icons.chevron_left,
          color: Colors.white,
        ),
      ),
    );
  }
}

class MovieDetailsAppBarImageView extends StatelessWidget {
  final String posterPath;

  const MovieDetailsAppBarImageView({
    this.posterPath,
  });

  @override
  Widget build(BuildContext context) {
    return Image.network(
      "$IMAGE_BASE_URL$posterPath",
      fit: BoxFit.cover,
    );
  }
}
