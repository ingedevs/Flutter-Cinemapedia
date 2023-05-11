import 'package:fl_cinemapedia_app/presentation/providers/providers.dart';
import 'package:fl_cinemapedia_app/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = 'HomeScreen';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _HomeView(),
      bottomNavigationBar: const CustomBottomNavigator(),
    );
  }
}

class _HomeView extends ConsumerStatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<_HomeView> {
  @override
  void initState() {
    super.initState();
    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
    ref.read(upcomingMoviesProvider.notifier).loadNextPage();
    ref.read(popularMoviesProvider.notifier).loadNextPage();
    ref.read(topRatedMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    final initialLoading = ref.watch(initialLoadingProvider);
    if (initialLoading) return const FullScreenLoader();

    final slideshowMovies = ref.watch(moviesSlideshowProvider);
    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
    final upcomingMovies = ref.watch(upcomingMoviesProvider);
    final popularMovies = ref.watch(popularMoviesProvider);
    final topRatedMovies = ref.watch(topRatedMoviesProvider);

    return CustomScrollView(
      slivers: [
        const SliverAppBar(
          floating: true,
          flexibleSpace: FlexibleSpaceBar(
            title: CustomAppBar(),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            childCount: 1,
            (context, index) {
              return Column(
                children: [
                  MoviesSlideshow(movies: slideshowMovies),
                  MovieHorizontalListView(
                    movies: nowPlayingMovies,
                    title: 'En Cines',
                    subtitle: 'Lunes 20',
                    loadNextPage: () => ref
                        .read(nowPlayingMoviesProvider.notifier)
                        .loadNextPage(),
                  ),
                  MovieHorizontalListView(
                    movies: upcomingMovies,
                    title: 'Próximamente',
                    subtitle: 'En este mes',
                    loadNextPage: () => ref
                        .read(upcomingMoviesProvider.notifier)
                        .loadNextPage(),
                  ),
                  MovieHorizontalListView(
                    movies: popularMovies,
                    title: 'Populares',
                    loadNextPage: () =>
                        ref.read(popularMoviesProvider.notifier).loadNextPage(),
                  ),
                  MovieHorizontalListView(
                    movies: topRatedMovies,
                    title: 'Mejor calificadas',
                    loadNextPage: () => ref
                        .read(topRatedMoviesProvider.notifier)
                        .loadNextPage(),
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
