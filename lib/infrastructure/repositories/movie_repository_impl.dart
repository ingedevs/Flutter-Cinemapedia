import 'package:fl_cinemapedia_app/domain/datasources/movies_datasource.dart';
import 'package:fl_cinemapedia_app/domain/entities/movie.dart';
import 'package:fl_cinemapedia_app/domain/repository/movies_repository.dart';

class MovieRepositoryImpl extends MoviesRepository {
  final MoviesDataSource moviesDataSource;
  MovieRepositoryImpl(this.moviesDataSource);

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) {
    return moviesDataSource.getNowPlaying(page: page);
  }
}
