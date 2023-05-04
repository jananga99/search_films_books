import 'package:flutter/material.dart';
import 'package:ftb/common/ui_constants.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      icon: CircleAvatar(
          backgroundColor:
              CustomColorScheme.headerColorScheme.profilePictureBackground,
          radius: 15,
          child: const Icon(Icons.person_2_rounded)),
      onChanged: (String? value) {},
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
