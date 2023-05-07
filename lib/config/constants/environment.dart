import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static String movieApiKey = dotenv.env['MOVIE_API_KEY'] ?? '';
}
