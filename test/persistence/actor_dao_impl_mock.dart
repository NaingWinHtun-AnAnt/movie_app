import 'package:movie_app/data/vos/actor_vo.dart';
import 'package:movie_app/persistence/daos/actor_dao.dart';

import '../mock_data/mock_data.dart';

class ActorDaoImplMock extends ActorDao {
  Map<int, ActorVO> actorListFromDatabaseMock = {};

  @override
  void saveAllActor(List<ActorVO> actorList) {
    // actorList.map((e) => actorListFromDatabaseMock[e.id] = e);
    actorList.forEach((e) => actorListFromDatabaseMock[e.id] = e);
  }

  @override
  List<ActorVO> getAllActors() {
    return actorListFromDatabaseMock.values.toList();
  }

  @override
  Stream<void> getAllActorEventStream() {
    return Stream.value(null);
  }

  @override
  Stream<List<ActorVO>> getAllActorsStream() {
    return Stream.value(getMockActors());
  }

  @override
  List<ActorVO> getAllActorsList() {
    return getMockActors();
  }
}
