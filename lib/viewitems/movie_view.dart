import 'package:flutter/material.dart';
import 'package:movie_app/data/vos/movie_vo.dart';
import 'package:movie_app/network/api_constants.dart';
import 'package:movie_app/resources/dimens.dart';
import 'package:movie_app/widgets/rating_view.dart';

class MovieView extends StatelessWidget {
  final Function onTapMovie;
  final MovieVO? movie;

  MovieView(
    this.onTapMovie, {
    this.movie,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: MARGIN_MEDIUM),
      width: MOVIE_LIST_ITEM_WIDTH,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              onTapMovie();
            },
            child: Image.network(
              "$IMAGE_BASE_URL${movie?.posterPath}",
              height: MOVIE_LIST_ITEM_IMAGE_HEIGHT,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: MARGIN_MEDIUM),
          Text(
            movie?.title ?? "",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: TEXT_REGULAR_2X,
              color: Colors.white,
            ),
          ),
          SizedBox(height: MARGIN_MEDIUM),
          Row(
            children: [
              Text(
                "8.9",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: TEXT_REGULAR,
                  color: Colors.white,
                ),
              ),
              SizedBox(width: MARGIN_MEDIUM),
              RatingView(),
            ],
          ),
        ],
      ),
    );
  }
}
