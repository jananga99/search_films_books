import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../logger/logger.dart';
import '../../models/tv_models/fetch_tvs_response.dart';
import '../../models/tv_models/fetch_tvs_result.dart';
import '../../repositories/tv_repository/tv_repository.dart';

class TvService {
  final TvRepository _tvRepository;

  TvService(TvRepository tvRepository) : _tvRepository = tvRepository;

  Future<FetchTvsResult> fetchTvs(
      {required String searchText, int page = 1}) async {
    try {
      final http.Response response =
          await _tvRepository.fetchTvs(searchText: searchText, page: page);
      final FetchTvsResponse res =
          FetchTvsResponse.fromJson(jsonDecode(response.body));
      return FetchTvsResult(
          success: true,
          tvs: res.results,
          page: res.page,
          totalPages: res.totalPages);
    } catch (e) {
      logger.e('TvService fetchTvs Error: $e');
      return FetchTvsResult(success: false);
    }
  }
}
