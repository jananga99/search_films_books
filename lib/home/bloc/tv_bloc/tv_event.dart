part of 'tv_bloc.dart';

abstract class TvEvent extends Equatable {
  const TvEvent();
  @override
  List<dynamic> get props => [];
}

class TvStarted extends TvEvent {
  const TvStarted({required this.searchText, this.page = 1});
  final String searchText;
  final int page;
  @override
  List<dynamic> get props => [searchText, page];
}

class TvFetched extends TvEvent {
  const TvFetched(
      {required this.tvs, required this.page, required this.totalPages});
  final List<Tv> tvs;
  final int page;
  final int totalPages;
  @override
  List<Object> get props => [tvs, page, totalPages];
}

class TvFailed extends TvEvent {
  const TvFailed(this.error);
  final String error;
  @override
  List<Object> get props => [error];
}
