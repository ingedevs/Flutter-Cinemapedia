import 'package:fl_cinemapedia_app/domain/repository/actors_repository.dart';
import 'package:fl_cinemapedia_app/infrastructure/datasources/actor_moviedb_datasource.dart';
import 'package:fl_cinemapedia_app/infrastructure/repositories/actor_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final actorsRepositoryProvider = Provider<ActorsRepository>((ref) {
  return ActorRepositoryImpl(ActorMovieDbDatasource());
});
