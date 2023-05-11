import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ftb/header_bar/view/header_bar.dart';

const TextStyle headlineStyle = TextStyle(
  fontSize: 24,
  fontWeight: FontWeight.bold,
);

const TextStyle subTitleStyle = TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.bold,
);

const TextStyle bodyStyle = TextStyle(
  fontSize: 16,
);

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        systemNavigationBarColor: Theme.of(context).colorScheme.background,
        statusBarColor: Colors.transparent,
      ),
    );
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        minimum: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HeaderBar(),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    'assets/our_logo.png',
                    width: 300,
                    height: 150,
                  ),
                ),
              ),
              const SizedBox(height: 10.0),
              const Center(
                child: Text(
                  style: headlineStyle,
                  'About us - Meraxes FT',
                ),
              ),
              const SizedBox(height: 16.0),
              const Text(
                'This is a personal app developed for movie and TV series enthusiasts. We created this app to help us search for our favorite movies and TV series with ease. We believe in making movie and TV series search more fun and enjoyable.',
                style: bodyStyle,
              ),
              const SizedBox(height: 16.0),
              const Text(
                'TMDB (The Movies Database) API Attribution',
                style: subTitleStyle,
              ),
              const SizedBox(height: 16.0),
              const Text(
                'We use the TMDB API to power our app. The TMDB API is an amazing resource for movie and TV series information. We acknowledge and appreciate their efforts to provide this API to developers like us.',
                style: bodyStyle,
              ),
              const SizedBox(height: 16.0),
              const Text(
                'Attribution Requirements',
                style: subTitleStyle,
              ),
              const SizedBox(height: 16.0),
              const Text(
                'In accordance with the TMDB API terms of use, we have included the TMDB logo to identify our use of the TMDB API. We have also included a notice to inform our users that this app uses the TMDB API, but is not endorsed or certified by TMDB. We understand and acknowledge that our use of the TMDB logo must be less prominent than our own app logo.',
                style: bodyStyle,
              ),
              const SizedBox(height: 16.0),
              Align(
                alignment: Alignment.center,
                child: Container(
                  color: Colors.blueGrey,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      'assets/tmdb_logo.png',
                      width: 200,
                      height: 100,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
