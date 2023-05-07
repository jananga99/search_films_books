import 'package:flutter/material.dart';
import 'package:ftb/common/constants/route_constants.dart';
import 'package:ftb/common/constants/ui_constants.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void handleAboutUs() {
      Navigator.of(context).pushNamed(RouteConstants.aboutUsRoute);
    }

    return DropdownButton<String>(
      dropdownColor: Color(0xff00ace6),
      icon: CircleAvatar(
          backgroundColor:
              CustomColorScheme.headerColorScheme.profilePictureBackground,
          radius: 15,
          child: const Icon(Icons.person_2_rounded)),
      onChanged: (String? value) {
        if (value == "about-us") {
          handleAboutUs();
        }
      },
      underline: const SizedBox(),
      items: const [
        DropdownMenuItem<String>(
          value: "about-us",
          child: Text("About Us"),
        )
      ],
    );
  }
}
