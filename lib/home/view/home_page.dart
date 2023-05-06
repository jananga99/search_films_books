import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  late TabController _tabController;
  final List<String> tabList = ["Movies", "Tv Series"];
  final TextEditingController _searchTextController = TextEditingController();
  bool isSearchTextEmpty = true;

  void handleSearch() {
    if (_searchTextController.text.isNotEmpty) {
      if (_tabController.index == 0) {
        _moviesBloc.add(MoviesStarted(searchText: _searchTextController.text));
      } else if (_tabController.index == 1) {
        _tvBloc.add(TvStarted(searchText: _searchTextController.text));
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _searchTextController.addListener(() {
      setState(() {
        isSearchTextEmpty = _searchTextController.text.isEmpty;
      });
    });
    _tabController = TabController(vsync: this, length: tabList.length);
    _tabController.addListener(() {
      if (_tabController.index != selectedIndex) {
        handleSearch();
      }
      setState(() {
        selectedIndex = _tabController.index;
      });
    });
  }

  @override
  void dispose() {
    _searchTextController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _moviesBloc = context.read<MoviesBloc>();
    _tvBloc = context.read<TvBloc>();
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: SafeArea(
          minimum: const EdgeInsets.symmetric(vertical: 20),
          child: CustomScrollView(
            slivers: <Widget>[
              const SliverToBoxAdapter(child: HeaderBar()),
              SliverToBoxAdapter(
                child: Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: SearchBar(
                    searchFn: handleSearch,
                    searchTextController: _searchTextController,
                  ),
                ),
              ),
              SliverToBoxAdapter(
                  child: TabBar(
                controller: _tabController,
                tabs: tabList
                    .map(
                      (e) => Tab(
                        child: Text(
                          e,
                          style: const TextStyle(color: Colors.black),
                        ),
                      ),
                    )
                    .toList(),
              )),
              SliverFillRemaining(
                child: SingleChildScrollView(
                  child: IndexedStack(
                    index: selectedIndex,
                    children: const [
                      MovieSection(),
                      TvSection(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
