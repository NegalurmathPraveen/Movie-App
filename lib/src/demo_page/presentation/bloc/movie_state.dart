part of 'movie_bloc.dart';

sealed class MovieState {}

final class MovieInitial extends MovieState {}

final class MovieListLoadedState extends MovieState {
  final List<MovieModel> movieList;
  MovieListLoadedState(this.movieList);
}

final class MovieListLoadingState extends MovieState {}

final class MovieListFailedState extends MovieState {
  final String message;
  MovieListFailedState(this.message);
}