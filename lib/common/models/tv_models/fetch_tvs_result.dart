import 'tv.dart';

class FetchTvsResult {
  FetchTvsResult(
      {required this.success,
      this.tvs,
      this.error,
      this.totalPages,
      this.page});
  final bool success;
  final String? error;
  final List<Tv>? tvs;
  final int? totalPages;
  final int? page;
}
