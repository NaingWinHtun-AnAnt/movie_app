import 'package:flutter/material.dart';
import 'package:movie_app/data/vos/movie_vo.dart';
import 'package:movie_app/network/api_constants.dart';
import 'package:movie_app/resources/dimens.dart';
import 'package:movie_app/widgets/gradient_view.dart';
import 'package:movie_app/widgets/play_button_view.dart';

class BannerView extends StatelessWidget {
  final MovieVO popularMovie;

  const BannerView(
    this.popularMovie,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Positioned.fill(
            child: BannerImageView(
              imageUrl: popularMovie.posterPath,
            ),
          ),
          Positioned.fill(
            child: GradientView(),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: BannerTitleView(
              movieName: popularMovie.title,
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: PlayButtonView(),
          )
        ],
      ),
    );
  }
}

class BannerTitleView extends StatelessWidget {
  final String movieName;

  BannerTitleView({
    this.movieName,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(MARGIN_MEDIUM_2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            movieName,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: TEXT_HEADING_1X,
              color: Colors.white,
            ),
          ),
          Text(
            "Official Review.",
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: TEXT_HEADING_1X,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

class BannerImageView extends StatelessWidget {
  final String imageUrl;

  BannerImageView({
    this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Image.network(
      "$IMAGE_BASE_URL$imageUrl",
      fit: BoxFit.cover,
    );
  }
}
