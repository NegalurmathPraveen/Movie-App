import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/movies_model.dart';
import '../../domain/usecases/usecases.dart';

part 'movie_event.dart';

part 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final MovieUseCases _useCases;

  MovieBloc(this._useCases) : super(MovieInitial()) {
    on<GetMovieListEvent>(_movieEventHandler);
  }

  FutureOr<void> _movieEventHandler(event,emit) async {
    print("came here");
    emit(MovieListLoadingState());
    final result = await _useCases.getMovieList();
    result.fold((l) => emit(MovieListFailedState(l.message)), (r) => emit(MovieListLoadedState(r)));
  }
}
