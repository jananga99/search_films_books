import 'package:flutter/cupertino.dart';

class PosterPublisher extends StatelessWidget {
  final String? publisher;
  const PosterPublisher(this.publisher, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Text(
        "Publisher            :    ${publisher == null || publisher!.isEmpty ? 'Unknown' : publisher!}",
        style: const TextStyle(fontSize: 20),
      ),
    );
  }
}
