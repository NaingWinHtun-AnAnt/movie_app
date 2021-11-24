import 'package:movie_app/data/vos/actor_vo.dart';

abstract class ActorDao {
  void saveAllActor(List<ActorVO> actorList);

  List<ActorVO> getAllActors();

  Stream<void> getAllActorEventStream();

  Stream<List<ActorVO>> getAllActorsStream();

  List<ActorVO> getAllActorsList();
}
