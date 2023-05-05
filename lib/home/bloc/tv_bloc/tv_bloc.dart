import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../common/constants/message_constants.dart';
import '../../../common/models/tv_models/fetch_tvs_result.dart';
import '../../../common/models/tv_models/tv.dart';
import '../../../common/services/tv_service/tv_service.dart';

part 'tv_event.dart';
part 'tv_state.dart';

class TvBloc extends Bloc<TvEvent, TvState> {
  TvBloc(this._tvService) : super(const TvState()) {
    on<TvStarted>(_onTvStarted);
    on<TvFetched>(_onTvFetched);
    on<TvFailed>(_onTvFailed);
  }

  final TvService _tvService;

  Future<void> _onTvStarted(TvStarted event, Emitter<TvState> emit) async {
    emit(state.copyWith(status: TvStatus.loading, error: null, tvs: <Tv>[]));
    final FetchTvsResult result = await _tvService.fetchTvs(
        searchText: event.searchText, page: event.page);
    if (result.success == true && result.tvs != null) {
      add(TvFetched(result.tvs!));
    } else {
      add(TvFailed(result.error == null ? Messages.tvs.failed : result.error!));
    }
  }

  void _onTvFetched(TvFetched event, Emitter<TvState> emit) {
    emit(state.copyWith(tvs: event.tv, status: TvStatus.succeeded));
  }

  void _onTvFailed(TvFailed event, Emitter<TvState> emit) {
    emit(state.copyWith(error: event.error, status: TvStatus.failed));
  }
}
