import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:ftb/about_us/view/about_us.dart';
import 'package:ftb/common/repositories/tv_repository/tv_repository.dart';
import 'package:ftb/common/services/tv_service/tv_service.dart';
import 'package:ftb/home/bloc/books_bloc/books_bloc.dart';
import 'package:ftb/home/bloc/tv_bloc/tv_bloc.dart';
import 'package:ftb/single_view/views/book_page/book_page.dart';
import 'package:ftb/single_view/views/movie_page/movie_page.dart';
import 'package:ftb/single_view/views/tv_page/tv_page.dart';

import 'common/constants/route_constants.dart';
import 'common/logger/logger.dart';
import 'common/models/book_models/book.dart';
import 'common/models/movie_models/movie.dart';
import 'common/models/tv_models/tv.dart';
import 'common/repositories/book_repository/book_repository.dart';
import 'common/repositories/movie_repository/movie_repository.dart';
import 'common/services/book_service/book_service.dart';
import 'common/services/movie_service/movie_service.dart';
import 'home/bloc/movies_bloc/movies_bloc.dart';
import 'home/view/home_page.dart';

Future<void> main() async {
  await dotenv.load(fileName: ".env");

  final MovieRepository movieRepository = MovieRepository();
  final TvRepository tvRepository = TvRepository();
  final BookRepository bookRepository = BookRepository();

  final MovieService movieService = MovieService(movieRepository);
  final TvService tvService = TvService(tvRepository);
  final BookService bookService = BookService(bookRepository);

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<MoviesBloc>(
          create: (BuildContext context) => MoviesBloc(movieService)),
      BlocProvider<TvBloc>(create: (BuildContext context) => TvBloc(tvService)),
      BlocProvider<BooksBloc>(
          create: (BuildContext context) => BooksBloc(bookService)),
    ],
    child: DevicePreview(enabled: false, builder: (context) => const App()),
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
          RouteConstants.aboutUsRoute: (context) => const AboutUsPage(),
          RouteConstants.movieRoute: (context) {
            try {
              final Movie movie =
                  ModalRoute.of(context)!.settings.arguments as Movie;
              return MoviePage(movie: movie);
            } catch (err) {
              logger.e(err);
              return const HomePage();
            }
          },
          RouteConstants.tvRoute: (context) {
            try {
              final Tv tv = ModalRoute.of(context)!.settings.arguments as Tv;
              return TvPage(tv: tv);
            } catch (err) {
              logger.e(err);
              return const HomePage();
            }
          },
          RouteConstants.bookRoute: (context) {
            try {
              final Book book =
                  ModalRoute.of(context)!.settings.arguments as Book;
              return BookPage(book: book);
            } catch (err) {
              logger.e(err);
              return const HomePage();
            }
          },
        },
      ),
    );
  }
}
