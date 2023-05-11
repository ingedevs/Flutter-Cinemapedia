import 'package:fl_cinemapedia_app/domain/datasources/actors_datasource.dart';
import 'package:fl_cinemapedia_app/domain/entities/actor.dart';
import 'package:fl_cinemapedia_app/domain/repository/actors_repository.dart';

class ActorRepositoryImpl extends ActorsRepository {
  final ActorsDataSource actorDataSource;
  ActorRepositoryImpl(this.actorDataSource);

  @override
  Future<List<Actor>> getActorsByMovie(String movieId) {
    return actorDataSource.getActorsByMovie(movieId);
  }
}
