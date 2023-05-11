import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ftb/header_bar/view/header_bar.dart';
import 'package:ftb/home/widgets/search_bar/search_bar.dart';

import '../bloc/books_bloc/books_bloc.dart';
import '../bloc/movies_bloc/movies_bloc.dart';
import '../bloc/tv_bloc/tv_bloc.dart';
import '../widgets/sections/book_section/book_section.dart';
import '../widgets/sections/movie_section/movie_section.dart';
import '../widgets/sections/tv_section/tv_section.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late MoviesBloc _moviesBloc;
  late TvBloc _tvBloc;
  late BooksBloc _booksBloc;

  int selectedIndex = 0;
  late TabController _tabController;
  final List<String> tabList = ["Movies", "Tv Series", "Books"];
  final TextEditingController _searchTextController = TextEditingController();
  bool isSearchTextEmpty = true;
  final ScrollController _scrollController = ScrollController();

  void handleSearch({int page = 1}) {
    if (_searchTextController.text.isNotEmpty) {
      if (_tabController.index == 0) {
        _moviesBloc.add(
            MoviesStarted(searchText: _searchTextController.text, page: page));
      } else if (_tabController.index == 1) {
        _tvBloc
            .add(TvStarted(searchText: _searchTextController.text, page: page));
      } else if (_tabController.index == 2) {
        _booksBloc.add(
            BooksStarted(searchText: _searchTextController.text, page: page));
      }
    }
  }

  void handlePageSelected(int page) {
    handleSearch(page: page);
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
    _scrollController.dispose();
    super.dispose();
  }

  void handleScrollTop() {
    if (_scrollController.offset != 0) {
      _scrollController.animateTo(
        0.0,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    _moviesBloc = context.read<MoviesBloc>();
    _tvBloc = context.read<TvBloc>();
    _booksBloc = context.read<BooksBloc>();
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
                  controller: _scrollController,
                  child: IndexedStack(
                    index: selectedIndex,
                    children: [
                      BlocBuilder<MoviesBloc, MoviesState>(
                        buildWhen: (prev, current) =>
                            prev.status == MoviesStatus.succeeded &&
                            current.status != MoviesStatus.succeeded,
                        builder: (context, state) {
                          if (state.status != MoviesStatus.succeeded) {
                            handleScrollTop();
                          }
                          return MovieSection(
                            onPageSelected: handlePageSelected,
                          );
                        },
                      ),
                      BlocBuilder<TvBloc, TvState>(
                        buildWhen: (prev, current) =>
                            prev.status == TvStatus.succeeded &&
                            current.status != TvStatus.succeeded,
                        builder: (context, state) {
                          if (state.status != TvStatus.succeeded) {
                            handleScrollTop();
                          }
                          return TvSection(
                            onPageSelected: handlePageSelected,
                          );
                        },
                      ),
                      BlocBuilder<BooksBloc, BooksState>(
                        buildWhen: (prev, current) =>
                            prev.status == BooksStatus.succeeded &&
                            current.status != BooksStatus.succeeded,
                        builder: (context, state) {
                          if (state.status != BooksStatus.succeeded) {
                            handleScrollTop();
                          }
                          return BookSection(
                            onPageSelected: handlePageSelected,
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
