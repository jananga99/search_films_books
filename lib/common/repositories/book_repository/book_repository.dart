import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:ftb/common/constants/ui_constants.dart';
import 'package:http/http.dart' as http;

class BookRepository {
  final String _apiAuthorityUrl;
  final String _apiPathPrefixUrl;

  BookRepository()
      : _apiAuthorityUrl = dotenv.env['API_BOOK_AUTHORITY_URL']!,
        _apiPathPrefixUrl = dotenv.env['API_BOOK_SEARCH']!;

  Future<http.Response> fetchBooks(
      {required String searchText, required int page}) async {
    final Uri uri = Uri.https(_apiAuthorityUrl, _apiPathPrefixUrl, {
      'q': searchText,
      'maxResults': DataGrid.itemsPerPage.toString(),
      'startIndex': (1 + DataGrid.itemsPerPage * (page - 1)).toString()
    });
    final Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8',
    };
    return await http.get(uri, headers: headers);
  }
}
