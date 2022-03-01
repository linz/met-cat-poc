import 'package:flutter/material.dart';
import 'package:metcat/src/widget/search_box.dart';

class SearchPage extends StatelessWidget {
  const SearchPage(BuildContext context, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // AppBar(
        //     elevation: 0,
        //     backgroundColor: Theme.of(context).colorScheme.surface,
        //     foregroundColor: Theme.of(context).colorScheme.onSurface,
        //     title: Text('Search Data Catalogue')),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SearchBox(context: context),
        )
      ],
    );
  }
}
