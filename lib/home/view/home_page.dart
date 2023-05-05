import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/movies_bloc/movies_bloc.dart';
import '../bloc/tv_bloc/tv_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late MoviesBloc _moviesBloc;
  late TvBloc _tvBloc;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesBloc, MoviesState>(
      builder: (context, state) {
        _moviesBloc = context.read<MoviesBloc>();
        _tvBloc = context.read<TvBloc>();
        if (_moviesBloc.state.status == MoviesStatus.idle) {
          _moviesBloc.add(const MoviesStarted(searchText: 'dragons'));
        } else if (_moviesBloc.state.status == MoviesStatus.succeeded) {
          print(_moviesBloc.state.movies);
        }
        if (_tvBloc.state.status == TvStatus.idle) {
          _tvBloc.add(const TvStarted(searchText: 'dragons'));
        } else if (_tvBloc.state.status == TvStatus.succeeded) {
          print(_tvBloc.state.tvs);
        }
        return Column(
          children: [
            Visibility(
              visible: _moviesBloc.state.status == MoviesStatus.idle ||
                  _moviesBloc.state.status == MoviesStatus.loading,
              child: const CircularProgressIndicator(
                color: Colors.red,
              ),
            ),
            Visibility(
                visible: _moviesBloc.state.status == MoviesStatus.succeeded,
                child: const Text("Success Movie")),
            Visibility(
                visible: _moviesBloc.state.status == MoviesStatus.failed,
                child: const Text("Failed Movie")),
            Visibility(
              visible: _tvBloc.state.status == TvStatus.idle ||
                  _tvBloc.state.status == TvStatus.loading,
              child: const CircularProgressIndicator(
                color: Colors.red,
              ),
            ),
            Visibility(
                visible: _tvBloc.state.status == TvStatus.succeeded,
                child: const Text("Success Tv")),
            Visibility(
                visible: _tvBloc.state.status == TvStatus.failed,
                child: const Text("Failed Tv"))
          ],
        );
      },
    );
  }
}
