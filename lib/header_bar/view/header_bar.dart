import 'package:flutter/material.dart';

import '../widgets/home_icon.dart';
import '../widgets/profile.dart';

class HeaderBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;

  const HeaderBar({super.key}) : preferredSize = const Size.fromHeight(56.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Theme.of(context).colorScheme.background,
      elevation: 0,
      actions: [
        Container(
          margin: const EdgeInsets.only(right: 40),
          child: const HomeIcon(),
        ),
        Container(
            margin: const EdgeInsets.only(right: 30), child: const Profile()),
      ],
    );
  }
}
