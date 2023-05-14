import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ftb/common/constants/route_constants.dart';

import '../../common/constants/ui_constants.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void handleAboutUs() {
      Navigator.of(context).pushNamed(RouteConstants.aboutUsRoute);
    }

    void handleExit() {
      SystemChannels.platform.invokeMethod('SystemNavigator.pop');
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
          height: 15,
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('About Us'),
          ),
        ),
        const PopupMenuItem(
          value: 2,
          height: 15,
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('Exit app'),
          ),
        ),
      ],
      offset: const Offset(0, 40),
      color: const Color(0xff809fff),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.all(4.0),
      elevation: 2,
      onSelected: (value) {
        if (value == 1) {
          handleAboutUs();
        } else if (value == 2) {
          handleExit();
        }
      },
    );
  }
}
