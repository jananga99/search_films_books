import 'package:flutter/material.dart';

import 'common/constants/route_constants.dart';
import 'home/view/home_page.dart';

Future<void> main() async {
  runApp(
    const App(),
  );
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: MaterialApp(
        title: 'Meraxes FTB',
        debugShowCheckedModeBanner: false,
        initialRoute: RouteConstants.homeRoute,
        routes: {
          RouteConstants.homeRoute: (context) => const HomePage(),
        },
      ),
    );
  }
}
