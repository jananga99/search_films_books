part of 'tv_bloc.dart';

enum TvStatus { idle, loading, succeeded, failed }

class TvState extends Equatable {
  const TvState(
      {this.status = TvStatus.idle, this.tvs = const <Tv>[], this.error});

  final TvStatus status;
  final List<Tv> tvs;
  final String? error;

  @override
  List<dynamic> get props => [status, tvs, error];

  TvState copyWith({TvStatus? status, List<Tv>? tvs, String? error}) {
    return TvState(
        status: status ?? this.status,
        tvs: tvs ?? this.tvs,
        error: error ?? this.error);
  }
}
