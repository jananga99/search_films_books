import 'package:flutter/material.dart';
import 'package:ftb/common/constants/route_constants.dart';

import '../../common/constants/ui_constants.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void handleAboutUs() {
      Navigator.of(context).pushNamed(RouteConstants.aboutUsRoute);
    }

    return PopupMenuButton<int>(
      icon: CircleAvatar(
          backgroundColor:
              CustomColorScheme.headerColorScheme.profilePictureBackground,
          radius: 15,
          child: const Icon(Icons.person_2_rounded)),
      itemBuilder: (context) => [
        const PopupMenuItem(
          value: 1,
          height: 10,
          child: Text('About Us'),
        ),
      ],
      offset: const Offset(0, 40),
      color: const Color(0xff00ace6),
      elevation: 2,
      onSelected: (value) {
        if (value == 1) {
          handleAboutUs();
        }
      },
    );
  }
}
