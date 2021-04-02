import 'package:flutter/material.dart';
import 'package:movie_app/resources/dimens.dart';
import 'package:movie_app/widgets/gradient_view.dart';
import 'package:movie_app/widgets/play_button_view.dart';

class BannerView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Positioned.fill(
            child: BannerImageView(),
          ),
          Positioned.fill(
            child: GradientView(),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: BannerTitleView(),
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
  const BannerTitleView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(MARGIN_MEDIUM_2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "The Wolverine 2013.",
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
  const BannerImageView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(
      "https://static.wikia.nocookie.net/xmenmovies/images/e/ed/TheWolverine_poster.jpg/revision/latest/top-crop/width/360/height/360?cb=20151224111601",
      fit: BoxFit.cover,
    );
  }
}
