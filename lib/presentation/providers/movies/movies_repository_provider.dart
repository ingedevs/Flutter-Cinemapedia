import 'package:fl_cinemapedia_app/domain/repository/movies_repository.dart';
import 'package:fl_cinemapedia_app/infrastructure/datasources/moviedb_datasource.dart';
import 'package:fl_cinemapedia_app/infrastructure/repositories/movie_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Este repositorio es inmutable
final movieRepositoryProvider = Provider<MoviesRepository>((ref) {
  return MovieRepositoryImpl(MovieDBDataSource());
});
