import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  final void Function() searchFn;
  final TextEditingController searchTextController;

  const SearchBar(
      {Key? key, required this.searchFn, required this.searchTextController})
      : super(key: key);

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final _formKey = GlobalKey<FormState>();

  bool _isButtonDisabled() {
    return widget.searchTextController.text.isEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Form(
            key: _formKey,
            child: TextFormField(
              controller: widget.searchTextController,
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
          onPressed: _isButtonDisabled() ? null : widget.searchFn,
          child: const Text('Search '),
        ),
      ],
    );
  }
}
