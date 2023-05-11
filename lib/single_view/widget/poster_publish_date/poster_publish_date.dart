import 'package:flutter/cupertino.dart';

class PosterPublishDate extends StatelessWidget {
  final String? publishedDate;
  const PosterPublishDate(this.publishedDate, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Text(
        "Published Year  :    ${publishedDate == null || publishedDate!.isEmpty ? 'Unknown' : publishedDate}",
        style: const TextStyle(fontSize: 20),
      ),
    );
  }
}
