import 'package:fl_cinemapedia_app/domain/entities/actor.dart';
import 'package:fl_cinemapedia_app/infrastructure/models/moviedb/credits_response.dart';

class ActorMapper {
  static Actor castToEntity(Cast cast) {
    return Actor(
      id: cast.id,
      name: cast.name,
      profilePath: cast.profilePath != null
          ? 'https://image.tmdb.org/t/p/w500${cast.profilePath}'
          : 'https://pwco.com.sg/wp-content/uploads/2020/05/Generic-Profile-Placeholder-v3-1536x1536.png',
      character: cast.character,
    );
  }
}
