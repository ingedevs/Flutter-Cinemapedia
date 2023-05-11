import 'package:fl_cinemapedia_app/domain/entities/movie.dart';
import 'package:fl_cinemapedia_app/infrastructure/models/moviedb/movie_details.dart';
import 'package:fl_cinemapedia_app/infrastructure/models/moviedb/movie_moviedb.dart';

class MovieMapper {
  static Movie movieDBToEntity(MovieFromMovieDB movieDB) {
    return Movie(
      adult: movieDB.adult,
      backdropPath: movieDB.backdropPath.isNotEmpty
          ? 'https://image.tmdb.org/t/p/w500${movieDB.backdropPath}'
          : 'https://static.displate.com/857x1200/displate/2022-04-15/7422bfe15b3ea7b5933dffd896e9c7f9_46003a1b7353dc7b5a02949bd074432a.jpg',
      genreIds: movieDB.genreIds.map((e) => e.toString()).toList(),
      id: movieDB.id,
      originalLanguage: movieDB.originalLanguage,
      originalTitle: movieDB.originalTitle,
      overview: movieDB.overview,
      popularity: movieDB.popularity,
      posterPath: movieDB.posterPath.isNotEmpty
          ? 'https://image.tmdb.org/t/p/w500${movieDB.posterPath}'
          : 'no-poster',
      releaseDate: movieDB.releaseDate,
      title: movieDB.title,
      video: movieDB.video,
      voteAverage: movieDB.voteAverage,
      voteCount: movieDB.voteCount,
    );
  }

  static Movie movieDetailsToEntity(MovieDetails details) {
    return Movie(
      adult: details.adult,
      backdropPath: details.backdropPath.isNotEmpty
          ? 'https://image.tmdb.org/t/p/w500${details.backdropPath}'
          : 'https://static.displate.com/857x1200/displate/2022-04-15/7422bfe15b3ea7b5933dffd896e9c7f9_46003a1b7353dc7b5a02949bd074432a.jpg',
      genreIds: details.genres.map((e) => e.name.toString()).toList(),
      id: details.id,
      originalLanguage: details.originalLanguage,
      originalTitle: details.originalTitle,
      overview: details.overview.isEmpty ? 'Sin descripción' : details.overview,
      popularity: details.popularity,
      posterPath: details.posterPath.isNotEmpty
          ? 'https://image.tmdb.org/t/p/w500${details.posterPath}'
          : 'no-poster',
      releaseDate: details.releaseDate,
      title: details.title,
      video: details.video,
      voteAverage: details.voteAverage,
      voteCount: details.voteCount,
    );
  }
}
