import 'book.dart';

class FetchBooksResponse {
  FetchBooksResponse({required this.items, required this.totalItems});
  final List<Book> items;
  final num totalItems;
  factory FetchBooksResponse.fromJson(Map<String, dynamic> json) {
    return FetchBooksResponse(
      totalItems: json['totalItems'] ?? 0,
      items: json['items'] == null
          ? []
          : List<Book>.from(
              json['items'].map((e) => Book.fromJson(e['volumeInfo']))),
    );
  }
}
