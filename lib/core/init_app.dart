import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../src/demo_page/data/datasources/movies_remote_data_source.dart';
import '../src/demo_page/data/datasources/movies_remote_data_source_impl.dart';
import '../src/demo_page/data/repositories/movie_repository_impl.dart';
import '../src/demo_page/domain/repositories/movie_repository.dart';
import '../src/demo_page/domain/usecases/usecases.dart';
import '../src/demo_page/presentation/bloc/movie_bloc.dart';

final getIt = GetIt.instance;

void initApp() {
  initiateGetIt();
}

initiateGetIt() {
  final dio = Dio();
  getIt
    ..registerLazySingleton<Dio>(() => dio)
    ..registerLazySingleton<MoviesRemoteDataSource>(() => MoviesRemoteDataSourceImpl())
    ..registerLazySingleton<MovieRepository>(() => MovieRepositoryImpl(getIt()))
    ..registerLazySingleton<MovieUseCases>(() => MovieUseCases(getIt()))
    ..registerFactory<MovieBloc>(() => MovieBloc(getIt()));

  dio.interceptors.add(
      PrettyDioLogger(requestHeader: true, requestBody: true, responseBody: true, responseHeader: false, compact: true, maxWidth: 100));
}
