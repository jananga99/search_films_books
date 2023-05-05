import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _searchTextController = TextEditingController();

  bool isSearchTextEmpty = true;

  @override
  void initState() {
    super.initState();
    _searchTextController.addListener(() {
      setState(() {
        isSearchTextEmpty = _searchTextController.text.isEmpty;
      });
    });
  }

  @override
  void dispose() {
    _searchTextController.dispose();
    super.dispose();
  }

  bool _isButtonDisabled() {
    return _searchTextController.text.isEmpty;
  }

  void _handleSearch() {}

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Form(
            key: _formKey,
            child: TextFormField(
              controller: _searchTextController,
              decoration: const InputDecoration(
                hintText: 'Search here...',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a text to search';
                }
                return null;
              },
            ),
          ),
        ),
        const SizedBox(
          width: 10.0,
        ),
        ElevatedButton(
          onPressed: _isButtonDisabled() ? null : _handleSearch,
          child: const Text('Search '),
        ),
      ],
    );
    ;
  }
}
