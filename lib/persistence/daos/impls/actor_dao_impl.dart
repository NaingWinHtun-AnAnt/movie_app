import 'package:hive/hive.dart';
import 'package:movie_app/data/vos/actor_vo.dart';
import 'package:movie_app/persistence/daos/actor_dao.dart';
import 'package:movie_app/persistence/hive_constants.dart';

class ActorDaoImpl extends ActorDao {
  static final ActorDaoImpl _singleton = ActorDaoImpl._internal();

  factory ActorDaoImpl() {
    return _singleton;
  }

  ActorDaoImpl._internal();

  @override
  void saveAllActor(List<ActorVO> actorList) async {
    Map<int, ActorVO> actorMap = Map.fromIterable(
      actorList,
      key: (actor) => actor.id,
      value: (actor) => actor,
    );

    await getActorBox().putAll(actorMap);
  }

  @override
  List<ActorVO> getAllActors() {
    return getActorBox().values.toList();
  }

  /// reactive programming
  /// watch box
  @override
  Stream<void> getAllActorEventStream() {
    return getActorBox().watch();
  }

  @override
  Stream<List<ActorVO>> getAllActorsStream() {
    return Stream.value(getAllActors());
  }

  /// handle empty box
  @override
  List<ActorVO> getAllActorsList() {
    return getAllActors().isNotEmpty ? getAllActors() : [];
  }

  Box<ActorVO> getActorBox() {
    return Hive.box(BOX_NAME_ACTOR_VO);
  }
}
