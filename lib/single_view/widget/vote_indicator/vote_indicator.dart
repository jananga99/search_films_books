import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../../common/helpers/single_view_helpers.dart';

class VoteIndicator extends StatelessWidget {
  final double? voteAverage;
  const VoteIndicator(this.voteAverage, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      final double circleRadius = constraints.maxWidth < 90 ? 24.0 : 36;
      final double fontSize = constraints.maxWidth < 90 ? 15 : 20;
      return CircularPercentIndicator(
        radius: circleRadius,
        lineWidth: 6.0,
        backgroundColor: Colors.grey,
        percent: voteAverage != null ? voteAverage! / 10 : 100,
        center: Text(
          voteAverage != null ? voteAverage!.toStringAsPrecision(2) : 'N/A',
          style: TextStyle(
            color: Colors.black,
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
          ),
        ),
        progressColor: voteAverage != null
            ? SingleViewHelper.getRatingColor(voteAverage!)
            : Colors.grey,
      );
    });
  }
}
