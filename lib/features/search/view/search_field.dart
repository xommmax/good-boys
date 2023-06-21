import 'package:flutter/material.dart';

typedef SearchCallback = void Function(String searchQuery);

class SearchField extends StatefulWidget {
  const SearchField({super.key, this.callback});

  final SearchCallback? callback;

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  late final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: TextField(
        cursorColor: Colors.white,
        style: const TextStyle(color: Colors.white),
        controller: _controller,
        onSubmitted: (_) => _search(),
        decoration: InputDecoration(
          hintText: 'Search',
          hintStyle: const TextStyle(color: Colors.white54),
          border: InputBorder.none,
          suffixIcon: IconButton(
            icon: const Icon(Icons.search, color: Colors.white),
            onPressed: _search,
          ),
        ),
      ),
    );
  }

  void _search() => widget.callback?.call(_controller.value.text);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
