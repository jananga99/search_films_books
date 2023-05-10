import 'package:flutter/material.dart';

class PageNumber extends StatelessWidget {
  final void Function(int) _onPageSelected;
  final bool _selected;
  final int _number;
  const PageNumber(
      {Key? key,
      required void Function(int) onPageSelected,
      bool selected = false,
      required int number})
      : _onPageSelected = onPageSelected,
        _number = number,
        _selected = selected,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    const Color enabledColor = Colors.black;
    const Color disabledColor = Colors.grey;
    return TextButton(
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all(
          _selected ? Colors.white : enabledColor,
        ),
        backgroundColor: MaterialStateProperty.all(
          _selected ? Colors.blue : Colors.transparent,
        ),
      ),
      onPressed: _selected ? null : () => _onPageSelected(_number),
      child: Text(_number.toString()),
    );
  }
}
