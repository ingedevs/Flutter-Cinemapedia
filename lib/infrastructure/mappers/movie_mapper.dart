import 'package:fl_cinemapedia_app/domain/entities/movie.dart';
import 'package:fl_cinemapedia_app/infrastructure/models/moviedb/movie_details.dart';
import 'package:fl_cinemapedia_app/infrastructure/models/moviedb/movie_moviedb.dart';

class MovieMapper {
  static Movie movieDBToEntity(MovieFromMovieDB movieDB) {
    return Movie(
      adult: movieDB.adult,
      backdropPath: movieDB.backdropPath.isNotEmpty
          ? 'https://image.tmdb.org/t/p/w500${movieDB.backdropPath}'
          : 'https://www.movienewz.com/img/films/poster-holder.jpg',
      genreIds: movieDB.genreIds.map((e) => e.toString()).toList(),
      id: movieDB.id,
      originalLanguage: movieDB.originalLanguage,
      originalTitle: movieDB.originalTitle,
      overview: movieDB.overview,
      popularity: movieDB.popularity,
      posterPath: movieDB.posterPath.isNotEmpty
          ? 'https://image.tmdb.org/t/p/w500${movieDB.posterPath}'
          : 'https://www.movienewz.com/img/films/poster-holder.jpg',
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
          : 'https://www.movienewz.com/img/films/poster-holder.jpg',
      genreIds: details.genres.map((e) => e.name.toString()).toList(),
      id: details.id,
      originalLanguage: details.originalLanguage,
      originalTitle: details.originalTitle,
      overview: details.overview.isEmpty ? 'Sin descripción' : details.overview,
      popularity: details.popularity,
      posterPath: details.posterPath.isNotEmpty
          ? 'https://image.tmdb.org/t/p/w500${details.posterPath}'
          : 'https://www.movienewz.com/img/films/poster-holder.jpg',
      releaseDate: details.releaseDate,
      title: details.title,
      video: details.video,
      voteAverage: details.voteAverage,
      voteCount: details.voteCount,
    );
  }
}
