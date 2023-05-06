import 'package:flutter/material.dart';
import 'package:ftb/common/constants/ui_constants.dart';

import '../../common/constants/route_constants.dart';

class HomeIcon extends StatelessWidget {
  const HomeIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void handleHomeClick() {
      Navigator.of(context).pushNamed(RouteConstants.homeRoute);
    }

    return TextButton(
      onPressed: handleHomeClick,
      child: Icon(
        Icons.home,
        color: CustomColorScheme.headerColorScheme.homeIconBackground,
        size: 30,
      ),
    );
  }
}
