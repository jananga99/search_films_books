import 'package:flutter/material.dart';

class HomePageLoader extends StatelessWidget {
  const HomePageLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Center(
            child: CircularProgressIndicator(
              color: Color(0xff005c99),
            ),
          ),
        ],
      ),
    );
  }
}
