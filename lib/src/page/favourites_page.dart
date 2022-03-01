import 'package:flutter/material.dart';

class FavouritesPage extends StatelessWidget {
  const FavouritesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Favourites'),
          centerTitle: true,
          // backgroundColor: Colors.red,
        ),
      );
}
