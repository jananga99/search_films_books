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
              decoration: InputDecoration(
                  hintText: 'Search here.....',
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(
                        color: Colors.black,
                      )),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(
                        color: Colors.black,
                      ))),
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
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.disabled)) {
                  return const Color(0xff809fff);
                  // return const Color(0xff4d79ff);
                }
                return const Color(0xff4d79ff);
              },
            ),
            foregroundColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
              if (states.contains(MaterialState.disabled)) {
                return Colors.black;
              }
              return Colors.black;
            }),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
          onPressed: _isButtonDisabled() ? null : widget.searchFn,
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 5),
            child: Text('Search '),
          ),
        ),
      ],
    );
  }
}
