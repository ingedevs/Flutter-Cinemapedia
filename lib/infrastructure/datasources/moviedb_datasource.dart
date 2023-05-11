import 'package:dio/dio.dart';
import 'package:fl_cinemapedia_app/config/constants/environment.dart';
import 'package:fl_cinemapedia_app/domain/datasources/movies_datasource.dart';
import 'package:fl_cinemapedia_app/domain/entities/movie.dart';
import 'package:fl_cinemapedia_app/infrastructure/mappers/movie_mapper.dart';
import 'package:fl_cinemapedia_app/infrastructure/models/moviedb/moviedb_response.dart';

class MovieDBDataSource extends MoviesDataSource {
  final dio = Dio(BaseOptions(
    baseUrl: 'https://api.themoviedb.org/3',
    queryParameters: {
      'api_key': Environment.movieApiKey,
      'language': 'es-MX',
    },
  ));

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    final response = await dio.get('/movie/now_playing', queryParameters: {
      'page': page,
    });
    final movieDbResponse = MovieDbResponse.fromJson(response.data);
    final List<Movie> movies = movieDbResponse.results
        .where((e) => e.posterPath != 'no-poster')
        .map((e) => MovieMapper.movieDBToEntity(e))
        .toList();
    return movies;
  }
}
