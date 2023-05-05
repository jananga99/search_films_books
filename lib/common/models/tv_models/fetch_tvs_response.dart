import 'package:ftb/common/models/tv_models/tv.dart';

class FetchTvsResponse {
  FetchTvsResponse({required this.page, required this.results});
  final int page;
  final List<Tv> results;
  factory FetchTvsResponse.fromJson(Map<String, dynamic> json) {
    return FetchTvsResponse(
      page: json['page'],
      results: List<Tv>.from(json['results'].map((e) => Tv.fromJson(e))),
    );
  }
}
