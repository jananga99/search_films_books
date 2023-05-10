import 'package:ftb/common/models/tv_models/tv.dart';

class FetchTvsResponse {
  FetchTvsResponse(
      {required this.page, required this.results, required this.totalPages});
  final int page;
  final List<Tv> results;
  final int totalPages;
  factory FetchTvsResponse.fromJson(Map<String, dynamic> json) {
    return FetchTvsResponse(
      page: json['page'],
      totalPages: json['total_pages'],
      results: List<Tv>.from(json['results'].map((e) => Tv.fromJson(e))),
    );
  }
}
