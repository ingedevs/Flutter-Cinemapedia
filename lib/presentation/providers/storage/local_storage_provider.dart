import 'package:fl_cinemapedia_app/infrastructure/datasources/isar_datasource.dart';
import 'package:fl_cinemapedia_app/infrastructure/repositories/local_storage_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final localStorageProvider = Provider((ref) {
  return LocalStorageRepositoryImpl(IsarDataSource());
});
