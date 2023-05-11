import 'package:dio/dio.dart';
import 'package:fl_cinemapedia_app/config/constants/environment.dart';
import 'package:fl_cinemapedia_app/domain/datasources/movies_datasource.dart';
import 'package:fl_cinemapedia_app/domain/entities/movie.dart';
import 'package:fl_cinemapedia_app/infrastructure/mappers/movie_mapper.dart';
import 'package:fl_cinemapedia_app/infrastructure/models/moviedb/movie_details.dart';
import 'package:fl_cinemapedia_app/infrastructure/models/moviedb/moviedb_response.dart';

class MovieDBDataSource extends MoviesDataSource {
  final dio = Dio(BaseOptions(
    baseUrl: 'https://api.themoviedb.org/3',
    queryParameters: {
      'api_key': Environment.movieApiKey,
      'language': 'es-MX',
    },
  ));

  _jsonToMovies(data) {
    final movieDbResponse = MovieDbResponse.fromJson(data);
    final List<Movie> movies = movieDbResponse.results
        .where((e) => e.posterPath != 'no-poster')
        .map((e) => MovieMapper.movieDBToEntity(e))
        .toList();
    return movies;
  }

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    final response = await dio.get('/movie/now_playing', queryParameters: {
      'page': page,
    });
    return _jsonToMovies(response.data);
  }

  @override
  Future<List<Movie>> getPopular({int page = 1}) async {
    final response = await dio.get('/movie/popular', queryParameters: {
      'page': page,
    });
    return _jsonToMovies(response.data);
  }

  @override
  Future<List<Movie>> getTopRated({int page = 1}) async {
    final response = await dio.get('/movie/top_rated', queryParameters: {
      'page': page,
    });
    return _jsonToMovies(response.data);
  }

  @override
  Future<List<Movie>> getUpcoming({int page = 1}) async {
    final response = await dio.get('/movie/upcoming', queryParameters: {
      'page': page,
    });
    return _jsonToMovies(response.data);
  }

  @override
  Future<Movie> getMovieById(String id) async {
    final response = await dio.get('/movie/$id');
    if (response.statusCode != 200) {
      throw Exception('Movie with id: $id not found');
    }
    final movieDetails = MovieDetails.fromJson(response.data);
    return MovieMapper.movieDetailsToEntity(movieDetails);
  }
}
