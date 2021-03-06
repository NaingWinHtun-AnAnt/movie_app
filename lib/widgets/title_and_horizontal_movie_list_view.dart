import 'package:flutter/material.dart';
import 'package:movie_app/components/smart_horizontal_list_view.dart';
import 'package:movie_app/data/vos/movie_vo.dart';
import 'package:movie_app/resources/dimens.dart';
import 'package:movie_app/viewitems/movie_view.dart';
import 'package:movie_app/widgets/title_text.dart';

class TitleAndHorizontalMovieListView extends StatelessWidget {
  final String title;
  final Function(int) onTapMovie;
  final List<MovieVO> mNowPlayingMovieList;
  final Function onListEndReached;

  TitleAndHorizontalMovieListView(
    this.title,
    this.onTapMovie,
    this.mNowPlayingMovieList, {
    required this.onListEndReached,
  });

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
            title,
          ),
        ),
        SizedBox(
          height: MARGIN_MEDIUM_2,
        ),
        HorizontalMovieListView(
          (movieId) => onTapMovie(movieId),
          movieList: mNowPlayingMovieList,
          onListEndReached: () => onListEndReached(),
        ),
      ],
    );
  }
}

class HorizontalMovieListView extends StatelessWidget {
  final Function(int) onTapMovie;
  final List<MovieVO>? movieList;
  final Function onListEndReached;

  HorizontalMovieListView(
    this.onTapMovie, {
    this.movieList,
    required this.onListEndReached,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MOVIE_LIST_HEIGHT,
      child: movieList != null
          // ? ListView.builder(
          //     scrollDirection: Axis.horizontal,
          //     padding: EdgeInsets.only(left: MARGIN_MEDIUM_2),
          //     itemCount: movieList?.length ?? 0,
          //     itemBuilder: (BuildContext context, int index) {
          //       return MovieView(
          //         () => this.onTapMovie(movieList?[index].id ?? 0),
          //         movie: movieList?[index],
          //       );
          //     },
          //   )
          ? SmartHorizontalListView(
              padding: EdgeInsets.only(left: MARGIN_MEDIUM_2),
              itemCount: movieList?.length ?? 0,
              itemBuilder: (BuildContext context, int index) {
                return MovieView(
                  () => this.onTapMovie(movieList?[index].id ?? 0),
                  movie: movieList?[index],
                );
              },
              onListEndReached: () => onListEndReached(),
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
