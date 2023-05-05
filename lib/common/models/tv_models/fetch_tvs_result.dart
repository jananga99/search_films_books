import 'tv.dart';

class FetchTvsResult {
  FetchTvsResult({required this.success, this.tvs, this.error});
  final bool success;
  final String? error;
  final List<Tv>? tvs;
}
