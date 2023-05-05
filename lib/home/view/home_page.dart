import 'package:flutter/material.dart';
import 'package:ftb/header_bar/view/header_bar.dart';
import 'package:ftb/home/widgets/search_bar/search_bar.dart';
import 'package:ftb/home/widgets/tv_section/tv_section.dart';

import '../bloc/movies_bloc/movies_bloc.dart';
import '../bloc/tv_bloc/tv_bloc.dart';
import '../widgets/movie_section/movie_section.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late MoviesBloc _moviesBloc;
  late TvBloc _tvBloc;

  int selectedIndex = 0;

  final List<Tab> _tabs = <Tab>[
    const Tab(
      child: Text(
        "Movies",
        style: TextStyle(color: Colors.black),
      ),
    ),
    const Tab(
      child: Text(
        'Tv Series',
        style: TextStyle(color: Colors.black),
      ),
    ),
  ];

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: _tabs.length);
    _tabController.addListener(() {
      setState(() {
        selectedIndex = _tabController.index;
        print(selectedIndex);
      });
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HeaderBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SearchBar(),
            TabBar(
              controller: _tabController,
              tabs: _tabs,
            ),
            IndexedStack(
              index: selectedIndex,
              children: const [
                MovieSection(),
                TvSection(),
              ],
            )
          ],
        ),
      ),
    );
  }
}

// BlocBuilder<MoviesBloc, MoviesState>(
//   builder: (context, state) {
//     _moviesBloc = context.read<MoviesBloc>();
//     _tvBloc = context.read<TvBloc>();
//     if (_moviesBloc.state.status == MoviesStatus.idle) {
//       _moviesBloc.add(const MoviesStarted(searchText: 'dragons'));
//     } else if (_moviesBloc.state.status == MoviesStatus.succeeded) {
//       print(_moviesBloc.state.movies);
//     }
//     if (_tvBloc.state.status == TvStatus.idle) {
//       _tvBloc.add(const TvStarted(searchText: 'dragons'));
//     } else if (_tvBloc.state.status == TvStatus.succeeded) {
//       print(_tvBloc.state.tvs);
//     }
//     return Column(
//       children: [
//         Visibility(
//           visible: _moviesBloc.state.status == MoviesStatus.idle ||
//               _moviesBloc.state.status == MoviesStatus.loading,
//           child: const CircularProgressIndicator(
//             color: Colors.red,
//           ),
//         ),
//         Visibility(
//             visible: _moviesBloc.state.status == MoviesStatus.succeeded,
//             child: const Text("Success Movie")),
//         Visibility(
//             visible: _moviesBloc.state.status == MoviesStatus.failed,
//             child: const Text("Failed Movie")),
//         Visibility(
//           visible: _tvBloc.state.status == TvStatus.idle ||
//               _tvBloc.state.status == TvStatus.loading,
//           child: const CircularProgressIndicator(
//             color: Colors.red,
//           ),
//         ),
//         Visibility(
//             visible: _tvBloc.state.status == TvStatus.succeeded,
//             child: const Text("Success Tv")),
//         Visibility(
//             visible: _tvBloc.state.status == TvStatus.failed,
//             child: const Text("Failed Tv"))
//       ],
//     );
//   },
// ),
