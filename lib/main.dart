import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:ftb/common/repositories/tv_repository/tv_repository.dart';
import 'package:ftb/common/services/tv_service/tv_service.dart';
import 'package:ftb/home/bloc/tv_bloc/tv_bloc.dart';

import 'common/constants/route_constants.dart';
import 'common/repositories/movie_repository/movie_repository.dart';
import 'common/services/movie_service/movie_service.dart';
import 'home/bloc/movies_bloc/movies_bloc.dart';
import 'home/view/home_page.dart';

Future<void> main() async {
  await dotenv.load(fileName: ".env");

  final MovieRepository movieRepository = MovieRepository();
  final TvRepository tvRepository = TvRepository();

  final MovieService movieService = MovieService(movieRepository);
  final TvService tvService = TvService(tvRepository);

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<MoviesBloc>(
          create: (BuildContext context) => MoviesBloc(movieService)),
      BlocProvider<TvBloc>(create: (BuildContext context) => TvBloc(tvService)),
    ],
    child: const App(),
  ));
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
