class Book {
  final List<String> authors;
  final String title;
  final String? publisher;
  final String? publishedDate;
  final String? description;
  final String? imageUrl;
  final int? pageCount;
  final double? averageRating;
  final String? language;
  const Book(
      {required this.authors,
      required this.title,
      required this.publisher,
      required this.publishedDate,
      required this.description,
      required this.imageUrl,
      required this.pageCount,
      required this.averageRating,
      required this.language});

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      authors: json['authors'] == null ? [] : json['authors'].cast<String>(),
      title: json['title'],
      publisher: json['publisher'],
      publishedDate: json['publishedDate'],
      description: json['description'],
      imageUrl: json['imageLinks']?['thumbnail'],
      pageCount: json['pageCount'],
      averageRating: json['averageRating']?.toDouble(),
      language: json['language'],
    );
  }
}
