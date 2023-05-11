import 'package:fl_cinemapedia_app/domain/entities/movie.dart';
import 'package:fl_cinemapedia_app/presentation/providers/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final searchQueryProvider = StateProvider<String>((ref) => '');

final searchMoviesNotifierProvider =
    StateNotifierProvider<SearchMoviesProvider, List<Movie>>((ref) {
  final movieRepository = ref.watch(movieRepositoryProvider).searchMovie;
  return SearchMoviesProvider(ref: ref, searchMovies: movieRepository);
});

typedef SearchMoviesCallback = Future<List<Movie>> Function(String query);

class SearchMoviesProvider extends StateNotifier<List<Movie>> {
  final SearchMoviesCallback searchMovies;
  final Ref ref;

  SearchMoviesProvider({
    required this.ref,
    required this.searchMovies,
  }) : super([]);

  Future<List<Movie>> searchMovieByQuery(String query) async {
    final List<Movie> movies = await searchMovies(query);
    ref.read(searchQueryProvider.notifier).state = query;
    state = movies;
    return movies;
  }
}
