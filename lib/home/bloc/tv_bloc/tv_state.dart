part of 'tv_bloc.dart';

enum TvStatus { idle, loading, succeeded, failed }

class TvState extends Equatable {
  const TvState(
      {this.status = TvStatus.idle,
      this.tvs = const <Tv>[],
      this.page = 0,
      this.totalPages = 0,
      this.error});

  final TvStatus status;
  final List<Tv> tvs;
  final int totalPages;
  final int page;
  final String? error;

  @override
  List<dynamic> get props => [status, tvs, page, totalPages, error];

  TvState copyWith(
      {TvStatus? status,
      List<Tv>? tvs,
      int? page,
      int? totalPages,
      String? error}) {
    return TvState(
        status: status ?? this.status,
        tvs: tvs ?? this.tvs,
        page: page ?? this.page,
        totalPages: totalPages ?? this.totalPages,
        error: error ?? this.error);
  }
}
