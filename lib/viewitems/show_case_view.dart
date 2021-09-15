import 'package:flutter/material.dart';
import 'package:movie_app/data/vos/movie_vo.dart';
import 'package:movie_app/network/api_constants.dart';
import 'package:movie_app/resources/dimens.dart';
import 'package:movie_app/widgets/play_button_view.dart';
import 'package:movie_app/widgets/title_text.dart';

class ShowCaseView extends StatelessWidget {
  final MovieVO? topRatedMovie;

  ShowCaseView({
    this.topRatedMovie,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: MARGIN_MEDIUM_2),
      child: Container(
        width: SHOW_CASE_ITEM_HEIGHT,
        child: Stack(
          children: [
            ShowCaseImageView(
              imageUrl: topRatedMovie?.posterPath,
            ),
            Align(
              alignment: Alignment.center,
              child: PlayButtonView(),
            ),
            ShowCaseMovieTitleAndDateSectionView(
              topRatedMovieTitle: topRatedMovie?.title,
              date: topRatedMovie?.releaseDate,
            ),
          ],
        ),
      ),
    );
  }
}

class ShowCaseMovieTitleAndDateSectionView extends StatelessWidget {
  final String? topRatedMovieTitle;
  final String? date;

  ShowCaseMovieTitleAndDateSectionView({
    this.topRatedMovieTitle,
    this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Padding(
        padding: const EdgeInsets.all(MARGIN_MEDIUM_2),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              topRatedMovieTitle ?? "-",
              style: TextStyle(
                color: Colors.white,
                fontSize: TEXT_REGULAR_3X,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: MARGIN_MEDIUM,
            ),
            TitleText(
              date ?? "-",
            ),
          ],
        ),
      ),
    );
  }
}

class ShowCaseImageView extends StatelessWidget {
  final String? imageUrl;

  ShowCaseImageView({
    this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Image.network(
        "$IMAGE_BASE_URL$imageUrl",
        fit: BoxFit.cover,
      ),
    );
  }
}
