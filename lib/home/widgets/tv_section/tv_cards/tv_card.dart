import 'package:flutter/cupertino.dart';

import '../../../../common/models/tv_models/tv.dart';

class TvCard extends StatelessWidget {
  final Tv _tv;

  const TvCard(Tv tv, {super.key}) : _tv = tv;

  @override
  Widget build(BuildContext context) {
    return Text(_tv.name);
  }
}
