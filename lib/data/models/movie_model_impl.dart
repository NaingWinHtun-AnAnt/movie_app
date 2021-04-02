import 'package:movie_app/data/models/movie_model.dart';
import 'package:movie_app/data/vos/movie_vo.dart';
import 'package:movie_app/network/agents/movie_data_agent.dart';
import 'package:movie_app/network/agents/retrofit_data_agent_impl.dart';

class MovieModelImpl extends MovieModel {
  MovieDataAgent _mDataAgent = RetrofitDataAgentImpl();

  static final MovieModelImpl _singleton = MovieModelImpl._internal();

  MovieModelImpl._internal();

  factory MovieModelImpl() {
    return _singleton;
  }

  @override
  Future<List<MovieVO>> getNowPlayingMovies(int page) {
    return _mDataAgent.getNowPlayingMovies(page);
  }
}
