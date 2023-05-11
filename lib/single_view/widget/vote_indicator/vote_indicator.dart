import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../../common/helpers/single_view_helpers.dart';

class VoteIndicator extends StatelessWidget {
  final double? _voteAverage;
  final double _total;
  const VoteIndicator(
      {Key? key, required double? voteAverage, required double total})
      : _voteAverage = voteAverage,
        _total = total,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    ;
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      final double circleRadius = constraints.maxWidth < 90 ? 24.0 : 36;
      final double fontSize = constraints.maxWidth < 90 ? 15 : 20;
      return CircularPercentIndicator(
        radius: circleRadius,
        lineWidth: 6.0,
        backgroundColor: Colors.grey,
        percent: _voteAverage != null ? _voteAverage! / _total : 0,
        center: Text(
          _voteAverage != null ? _voteAverage!.toStringAsPrecision(2) : 'N/A',
          style: TextStyle(
            color: Colors.black,
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
          ),
        ),
        progressColor: _voteAverage != null
            ? SingleViewHelper.getRatingColor(
                rating: _voteAverage!, total: _total)
            : Colors.grey,
      );
    });
  }
}
