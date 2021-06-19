import 'package:flutter/material.dart';
import 'package:movie_app/data/vos/base_actor_vo.dart';
import 'package:movie_app/network/api_constants.dart';
import 'package:movie_app/resources/colors.dart';
import 'package:movie_app/resources/dimens.dart';

class ActorView extends StatelessWidget {
  final BaseActorVO actor;

  ActorView({
    this.actor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        right: MARGIN_MEDIUM,
      ),
      width: MOVIE_LIST_ITEM_WIDTH,
      child: Stack(
        children: [
          Positioned.fill(
            child: ActorImageView(
              imageURL: actor.profilePath,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(
              MARGIN_MEDIUM,
            ),
            child: Align(
              alignment: Alignment.topRight,
              child: FavoriteButtonView(),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: ActorNameAndLikeView(
              name: actor.name,
              like: 56706,
            ),
          ),
        ],
      ),
    );
  }
}

class ActorImageView extends StatelessWidget {
  final String imageURL;

  ActorImageView({
    this.imageURL,
  });

  @override
  Widget build(BuildContext context) {
    return Image.network(
      "$IMAGE_BASE_URL$imageURL",
      fit: BoxFit.cover,
    );
  }
}

class FavoriteButtonView extends StatelessWidget {
  const FavoriteButtonView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.favorite_border,
      color: Colors.white,
    );
  }
}

class ActorNameAndLikeView extends StatelessWidget {
  final String name;
  final double like;

  const ActorNameAndLikeView({
    this.name,
    this.like,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: MARGIN_MEDIUM_2,
        vertical: MARGIN_MEDIUM_2,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            name,
            style: TextStyle(
              fontSize: TEXT_REGULAR,
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(
            height: MARGIN_MEDIUM,
          ),
          Row(
            children: [
              Icon(
                Icons.thumb_up,
                size: THUMB_UP_ICON_SIZE,
                color: Colors.amber,
              ),
              SizedBox(
                width: MARGIN_MEDIUM,
              ),
              Text(
                "YOU LIKE 13 MOVIES.",
                style: TextStyle(
                  color: HOME_SCREEN_LIST_TITLE_COLOR,
                  fontWeight: FontWeight.bold,
                  fontSize: TEXT_BEST_ACTOR_LIKE,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
