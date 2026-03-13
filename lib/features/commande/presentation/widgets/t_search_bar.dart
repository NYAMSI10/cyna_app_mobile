import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TSearchBar extends ConsumerStatefulWidget {
  const TSearchBar(
      {super.key, required this.searchController, required this.onChanged});
  final TextEditingController searchController;
  final ValueChanged<String> onChanged;

  @override
  ConsumerState<TSearchBar> createState() => _TSearchBarState();
}

class _TSearchBarState extends ConsumerState<TSearchBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
      child: TextField(
        controller: widget.searchController,
        onChanged: widget.onChanged,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.search),
          suffixIcon: widget.searchController.text.isNotEmpty
              ? IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    widget.searchController.clear();
                    widget.onChanged('');
                  },
                )
              : null,
          hintText: 'Rechercher un service ou une date…',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          isDense: true,
        ),
      ),
    );
  }
}
