import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class TvRepository {
  final String _apiAuthorityUrl;
  final String _apiPathPrefixUrl;
  final String _bearerToken;

  TvRepository()
      : _apiAuthorityUrl = dotenv.env['API_AUTHORITY_URL']!,
        _apiPathPrefixUrl = dotenv.env['API_TV_SEARCH']!,
        _bearerToken = dotenv.env['BEARER_TOKEN']!;

  Future<http.Response> fetchTvs(
      {required String searchText, required int page}) async {
    final Uri uri = Uri.https(_apiAuthorityUrl, _apiPathPrefixUrl, {
      'language': 'en',
      'query': searchText,
      'include_adult': 'true',
      'limit': '5'
    });
    final Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $_bearerToken'
    };
    return await http.get(uri, headers: headers);
  }
}
