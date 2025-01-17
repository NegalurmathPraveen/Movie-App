import 'package:dartz/dartz.dart';

import '../../../../core/models/error_model.dart';
import '../../data/models/movies_model.dart';
import '../repositories/movie_repository.dart';

class MovieUseCases {
  final MovieRepository _demoRepo;

  const MovieUseCases(this._demoRepo);

  Future<Either<Failure, List<MovieModel>>> getMovieList() async {
    final result = await _demoRepo.getMovieList();
    return result.fold((l) => Left(l), (r) {
      final movieList = r;
      final model = movieList.firstWhere((element) => element.title == "Trolls Band Together");
      movieList.removeWhere((element) => element == model);
      movieList.insert(0, model);
      return Right(movieList);
    });
  }
}
